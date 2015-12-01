//
//  SFPresenter.m
//  Example
//
//  Created by Sergio Fernández Durán on 10/6/15.
//  Copyright © 2015 Sergio Fernández. All rights reserved.
//

#import "SFPresenter.h"

#import "SFResource.h"
#import "SFCollectionViewCell.h"

@implementation SFPresenter

+ (void)present:(SFResource *)model inView:(SFCollectionViewCell*)cell
{
    cell.titleLabel.text = model.title;
    cell.descriptionLabel.text = model.detail;
    cell.backgroundImageView.image = model.backgroundImage;
}

@end
