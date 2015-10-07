/*
 * This file is part of the SFFocusViewLayout package.
 * (c) Sergio Fernández <fdz.sergio@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SFFocusViewLayout : UICollectionViewLayout

@property (nonatomic) IBInspectable CGFloat standardHeight;
@property (nonatomic) IBInspectable CGFloat focusedHeight;
@property (nonatomic) IBInspectable CGFloat dragOffset;

@end
