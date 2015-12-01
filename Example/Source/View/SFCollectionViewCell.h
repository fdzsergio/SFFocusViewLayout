//
//  SFCollectionViewCell.h
//  SFFocusViewLayout
//
//  Created by Sergio Fernández Durán on 10/5/15.
//  Copyright © 2015 Sergio Fernández. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
