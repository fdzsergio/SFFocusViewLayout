/*
 * This file is part of the SFFocusViewLayout package.
 * (c) Sergio Fernández <fdz.sergio@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <UIKit/UIKit.h>

//! Project version number for SFFocusViewLayout.
FOUNDATION_EXPORT double SFFocusViewLayoutVersionNumber;

//! Project version string for SFFocusViewLayout.
FOUNDATION_EXPORT const unsigned char SFFocusViewLayoutVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SFFocusViewLayout/PublicHeader.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFFocusViewLayout : UICollectionViewLayout

/**
 `SFFocusViewLayout` is a subclass of `UICollectionViewLayout` for displaying focused content on UICollectionView
 which is the largest cell of all.

 By default, this UICollectionViewLayout has initialize a set of properties to work as designed.

 @warning Focused height must be greater than standard height.
 */

/**
 Standard height for collapsed cells.
 By default, this property is set to `kSFFocusViewLayoutStandardHeight`.

 @param standardHeight The collapsed height

 @warning this property must be smaller than focusedHeight
 */
@property (nonatomic) IBInspectable CGFloat standardHeight;

/**
 Featured height for focused cell.
 By default, this property is set to `kSFFocusViewLayoutFocusedHeight`.

 @param focusedHeight The featured height

 @warning this property must be greater than standardHeight
 */
@property (nonatomic) IBInspectable CGFloat focusedHeight;

/**
 Drag Offset is the amount the user needs to scroll before the featured cell changes.
 By default, this property is set to `kSFFocusViewLayoutDragOffset`.

 @param dragOffset The amount user needs to change cell
 */
@property (nonatomic) IBInspectable CGFloat dragOffset;

@end

NS_ASSUME_NONNULL_END
