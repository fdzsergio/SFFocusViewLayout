//
//  SFCollectionViewCell.m
//  SFFocusViewLayout
//
//  Created by Sergio Fernández Durán on 10/5/15.
//  Copyright © 2015 Sergio Fernández. All rights reserved.
//

#import "SFCollectionViewCell.h"

@interface SFCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *overlayView;

@end

@implementation SFCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];

    CGFloat featuredHeight = 280.f;
    CGFloat standardHeight = 100.f;

    CGFloat delta = 1 - ((featuredHeight - CGRectGetHeight(self.frame)) / (featuredHeight - standardHeight));

    CGFloat minAlpha = 0.3f;
    CGFloat maxAlpha = 0.75f;

    CGFloat alpha = maxAlpha - (delta * (maxAlpha - minAlpha));
    self.overlayView.alpha = alpha;

    CGFloat scale = MAX(delta, 0.5f);
    self.titleLabel.transform = CGAffineTransformMakeScale(scale, scale);

    self.descriptionLabel.alpha = delta;
}

@end
