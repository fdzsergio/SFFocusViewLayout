/*
 * This file is part of the SFFocusViewLayout package.
 * (c) Sergio Fernández <fdz.sergio@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
 

#import "SFFocusViewLayout.h"

static CGFloat const kSFFocusViewLayoutStandardHeight = 100.f;
static CGFloat const kSFFocusViewLayoutFocusedHeight = 280.f;
static CGFloat const kSFFocusViewLayoutDragOffset = 180.f;

@interface SFFocusViewLayout ()

@property (nonatomic, copy) NSArray *cachedLayoutAttributes;

@end

@implementation SFFocusViewLayout

#pragma mark - Life Cycle

- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _standardHeight = kSFFocusViewLayoutStandardHeight;
    _focusedHeight = kSFFocusViewLayoutFocusedHeight;
    _dragOffset = kSFFocusViewLayoutDragOffset;
}

#pragma mark - UICollectionViewFlowLayout methods

// Return the size of all the content in the collection view
- (CGSize)collectionViewContentSize
{
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGFloat contentHeight = numberOfItems * self.dragOffset + (self.collectionView.frame.size.height - self.dragOffset);
    return CGSizeMake(self.collectionView.frame.size.width, contentHeight);
}

// Return true so that the layout is continuously invalidated as the user scrolls 
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return true;
}

// Return the content offset of the nearest cell which achieves the nice snapping effect, similar to a paged UIScrollView 
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity
{
    // Smooth scrolling when user release the touch to focoused cell
    CGFloat proposedItemIndex = roundf(proposedContentOffset.y / self.dragOffset);
    CGFloat nearestPageOffset = proposedItemIndex * self.dragOffset;

    return CGPointMake(0.0f, nearestPageOffset);
}

// Return all attributes in the cache whose frame intersects with the rect passed to the method 
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // create layouts for the rectangles in the view
    NSMutableArray *layoutAttributes = [NSMutableArray array];

    for (UICollectionViewLayoutAttributes *attributes in self.cachedLayoutAttributes) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [layoutAttributes addObject:attributes];
        }
    }

    return layoutAttributes;
}

- (void)prepareLayout
{
    NSMutableArray *cache = [NSMutableArray array];

    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];

    // last rect will be used to calculate frames past the first one.  We initialize it to a non junk 0 value
    CGRect frame = CGRectZero;
    CGFloat y = 0;

    for (NSUInteger item = 0; item < numberOfItems; item++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath]
        ;
        // Important because each cell has to slide over the top of the previous one 
        attributes.zIndex = item;

        // Initially set the height of the cell to the standard height 
        CGFloat height = self.standardHeight;

        if (indexPath.item == self.currentFocusedItemIndex) {
            // The featured cell 
            CGFloat yOffset = self.standardHeight * self.nextItemPercentageOffset;
            y = self.collectionView.contentOffset.y - yOffset;
            height = self.focusedHeight;
        } else if (indexPath.item == (self.currentFocusedItemIndex + 1) && indexPath.item != numberOfItems) {
            // The cell directly below the featured cell, which grows as the user scrolls 
            CGFloat maxY = y + self.standardHeight;
            height =  self.standardHeight + MAX((self.focusedHeight - self.standardHeight) * self.nextItemPercentageOffset, 0);
            y = maxY - height;
        } else {
            y = frame.origin.y + frame.size.height;
        }

        frame = CGRectMake(0, y, self.collectionView.frame.size.width, height);
        attributes.frame = frame;
        [cache addObject:attributes];
        y = CGRectGetMaxY(frame);
    };

    self.cachedLayoutAttributes = [cache copy];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.cachedLayoutAttributes[indexPath.item];
}

#pragma mark - Private methods

// Returns the item index of the currently featured cell
- (NSUInteger)currentFocusedItemIndex
{
    return MAX(0, self.collectionView.contentOffset.y / self.dragOffset);
}

// Returns a value between 0 and 1 that represents how close the next cell is to becoming the featured cell
- (CGFloat)nextItemPercentageOffset
{
    return (self.collectionView.contentOffset.y / self.dragOffset) - self.currentFocusedItemIndex;
}


@end
