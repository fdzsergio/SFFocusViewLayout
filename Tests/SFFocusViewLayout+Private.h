//
//  SFFocusViewLayout+Private.h
//  SFFocusViewLayout
//
//  Created by Sergio Fernández Durán on 12/12/15.
//  Copyright © 2015 fdzsergio. All rights reserved.
//

#import <SFFocusViewLayout/SFFocusViewLayout.h>

static CGFloat const kSFFocusViewLayoutStandardHeight = 100.f;
static CGFloat const kSFFocusViewLayoutFocusedHeight = 280.f;
static CGFloat const kSFFocusViewLayoutDragOffset = 180.f;

@interface SFFocusViewLayout (Private)

@property (nonatomic, copy, readonly) NSArray *cachedLayoutAttributes;

- (NSUInteger)currentFocusedItemIndex;

- (CGFloat)nextItemPercentageOffset;

@end
