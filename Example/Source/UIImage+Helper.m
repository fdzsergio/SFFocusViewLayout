//
//  UIImage+SFHelper.m
//  Example
//
//  Created by Sergio Fernández Durán on 10/6/15.
//  Copyright © 2015 Sergio Fernández. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)

+ (UIImage *)decompressedImageFromImageString:(NSString *)imageString
{
    UIImage *image = [UIImage imageNamed:imageString];
    UIGraphicsBeginImageContextWithOptions(image.size, YES, 0);
    [image drawAtPoint:CGPointZero];
    UIImage *decompressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return decompressedImage;
}

@end
