//
//  SFPresenter.h
//  Example
//
//  Created by Sergio Fernández Durán on 10/6/15.
//  Copyright © 2015 Sergio Fernández. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFResource;
@class SFCollectionViewCell;

@interface SFPresenter : NSObject

+ (void)present:(SFResource *)model inView:(SFCollectionViewCell*)cell;

@end
