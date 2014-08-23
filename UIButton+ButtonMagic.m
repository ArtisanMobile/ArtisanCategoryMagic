/*
 *	UIButton+ButtonMagic.m
 *
 *  Created by Scott Wasserman on 7/3/14.
 *  Copyright (c) 2014 Artisan Mobile, Inc. All rights reserved.
 *  
 *  Check out Artisan Mobile at http://useartisan.com
 *
 */

#import "UIButton+ButtonMagic.h"

@implementation  UIButton (ButtonMagic)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton imageFromColor:backgroundColor] forState:state];
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
