//
//  SFViewController.m
//  SFFocusViewLayout
//
//  Created by Sergio Fernández on 10/05/2015.
//  Copyright (c) 2015 Sergio Fernández. All rights reserved.
//

#import "SFViewController.h"

#import "SFCollectionViewCell.h"

#import "SFManager.h"
#import "SFPresenter.h"
#import "SFFocusViewLayout.h"

CGFloat const kSFFocusViewLayoutStandardHeight = 300;

static NSString * const kSFCollectionViewReuseIdentifier = @"__kSFCollectionViewReuseIdentifier";

@interface SFViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) SFManager *manager;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;

    UINib *collectionViewcellNib = [UINib nibWithNibName:NSStringFromClass(SFCollectionViewCell.class)
                                    bundle:nil];
    [self.collectionView registerNib:collectionViewcellNib
          forCellWithReuseIdentifier:kSFCollectionViewReuseIdentifier];

    self.collectionView.backgroundColor = [UIColor colorWithRed:51/255.f green:55/255.f blue:61/255.f alpha:1.f];

    self.manager = [SFManager new];
    [self.manager loadResources];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.resources.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSFCollectionViewReuseIdentifier
                                                                           forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate methods

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(SFCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    SFResource *resource = self.resources[indexPath.item];
    [SFPresenter present:resource inView:cell];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SFFocusViewLayout *focusViewLayout = (SFFocusViewLayout *)collectionView.collectionViewLayout;

    CGFloat offset = focusViewLayout.dragOffset * indexPath.item;
    if (collectionView.contentOffset.y != offset) {
        [collectionView setContentOffset:CGPointMake(0, offset) animated:YES];
    }
}

#pragma mark - Private methods

- (NSArray *)resources
{
    return self.manager.resources;
}

@end
