//
//  Tests.m
//  Tests
//
//  Created by Sergio Fernández Durán on 12/1/15.
//  Copyright © 2015 fdzsergio. All rights reserved.
//

@import SFFocusViewLayout;

#import <XCTest/XCTest.h>
#import "SFCollectionViewController.h"
#import "SFFocusViewLayout+Private.h"

#define NSIndexPathZero [NSIndexPath indexPathForItem:0 inSection:0]

@interface Tests : XCTestCase

@property (nonatomic, strong) SFFocusViewLayout *focusViewLayout;
@property (nonatomic, strong) SFCollectionViewController *collectionViewControler;

@end

@implementation Tests

- (void)setUp
{
    [super setUp];

    self.focusViewLayout = [[SFFocusViewLayout alloc] init];
    self.collectionViewControler = [[SFCollectionViewController alloc] initWithCollectionViewLayout:self.focusViewLayout];
    self.collectionViewControler.view.frame = CGRectMake(0, 0, 600, 600);
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFocusViewLayoutHasDefaultValues
{
    XCTAssertEqual(self.focusViewLayout.standardHeight, kSFFocusViewLayoutStandardHeight);
    XCTAssertEqual(self.focusViewLayout.focusedHeight, kSFFocusViewLayoutFocusedHeight);
    XCTAssertEqual(self.focusViewLayout.dragOffset, kSFFocusViewLayoutDragOffset);
}

- (void)testLayoutContentViewSizeUsesController
{
    CGSize focusViewLayoutSize = self.focusViewLayout.collectionViewContentSize;
    CGSize collectionViewControllerSize = self.collectionViewControler.view.frame.size;

    XCTAssertEqual(focusViewLayoutSize.width, collectionViewControllerSize.width);
    XCTAssertEqual(focusViewLayoutSize.height, collectionViewControllerSize.height-self.focusViewLayout.dragOffset);
}

- (void)testLayoutHasSmoothScrolling
{
    CGPoint proposedOffset = [self.focusViewLayout targetContentOffsetForProposedContentOffset:CGPointZero
                                                                         withScrollingVelocity:CGPointZero];

    XCTAssertEqual(proposedOffset.x, 0.f);
    XCTAssertEqual(proposedOffset.y, 0.f);
}

- (void)testLayoutHasCachedLayoutAttributes
{
    self.collectionViewControler.items = @[@0];

    [self.collectionViewControler.view layoutIfNeeded];

    XCTAssertEqual(self.focusViewLayout.cachedLayoutAttributes.count, 1);
}

- (void)testLayoutAttributeIsCached
{
    self.collectionViewControler.items = @[@0];

    [self.collectionViewControler.view layoutIfNeeded];

    NSArray *attributes = [self.focusViewLayout layoutAttributesForElementsInRect:CGRectZero];

    XCTAssertEqualObjects(self.focusViewLayout.cachedLayoutAttributes, attributes);
}

- (void)testLayoutHasLayoutAttributesAtIndexPath
{
    self.collectionViewControler.items = @[@0, @1, @2];

    [self.collectionViewControler.view layoutIfNeeded];

    UICollectionViewLayoutAttributes *attribute = [self.focusViewLayout layoutAttributesForItemAtIndexPath:NSIndexPathZero];

    XCTAssertEqualObjects(self.focusViewLayout.cachedLayoutAttributes[0], attribute);
}

- (void)testLayoutShouldInvalidateLayoutForBoundsChange
{
    XCTAssertTrue([self.focusViewLayout shouldInvalidateLayoutForBoundsChange:CGRectZero]);
}

- (void)testLayoutHasCurrentItemIndex
{
    self.collectionViewControler.items = @[@1];

    XCTAssertEqual([self.focusViewLayout currentFocusedItemIndex], 0);
}

- (void)testLayoutNextItemPercentageIsZero
{
    self.collectionViewControler.items = @[@1];

    XCTAssertEqual([self.focusViewLayout nextItemPercentageOffset], 0.f);
}

@end
