/*
 *	UIButton+ButtonMagic.h
 *
 *  Used to deal with the annoyances associated with setting the color of a button and
 *  not having a down state like you have when setting a background image.
 *
 *  Created by Scott Wasserman on 7/3/14.
 *  Copyright (c) 2014 Artisan Mobile, Inc. All rights reserved.
 *
 *  Check out Artisan Mobile at http://useartisan.com
 *
 */


#import <UIKit/UIKit.h>

@interface UIButton (ButtonMagic)

// This will allow you to set the background color of the button AND specify a state.
// This will also make the button have a greyed down state which doesn't happen when you
// specify a background color on a button.
// NOTE: Under the hood this is using setBackgroundImage so you can't use setBackgroundImage
//       with this method.
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
