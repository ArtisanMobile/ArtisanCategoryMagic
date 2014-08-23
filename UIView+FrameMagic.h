/*  
 *	UIView+FrameMagic.h
 *  
 *  Used to contain properties of UIView such as size, xy 
 *  coordinates, and adjust the size and position of the 
 *  View inside the frame
 *  
 *  Created by Scott Wasserman on 9/11/13.
 *  Copyright (c) 2013 Artisan Mobile, Inc. All rights reserved.
 *
 *  Check out Artisan Mobile at http://useartisan.com
 *
 */


@interface UIView (FrameMagic)

//  Returns the Y (bottom) and X (right) coordinates of the frame of the view
+ (CGFloat)viewRightX:(UIView *)view;
+ (CGFloat)viewBottomY:(UIView *)view;

// Set the height and width of the view
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

// set the X (bottom) and Y (right) coordinates of the view
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;

// Centers the view in the given frame, either vertically or horizontally
- (void)centerHorizontallyInFrame:(CGRect)frame;
- (void)centerVerticallyInFrame:(CGRect)frame;
- (void)centerHorizontallyAndVerticallyInFrame:(CGRect)frame;

// Aligns the view with the bottom of the given frame
- (void)alignBottomYWithFrame:(CGRect)frame;

// Adds yPixels amount of spacing in either the top or the bottom of the frame
- (void)setFrameYPixelsDown:(CGFloat)yPixels fromFrame:(CGRect)frame;
- (void)setFrameYPixelsUpFromBottomOfScreen:(CGFloat)yPixels screenHeight:(CGFloat)screenHeight;

// Add xPixels to the left of the frame, moving it to the right
- (void)setFrameXPixelsRight:(CGFloat)xPixels fromFrame:(CGRect)frame;

// Returns the X and Y coordinates of the view
- (CGFloat)rightXCoordinate;
- (CGFloat)bottomYCoordinate;

// Returns the view origin coordinates and the view height and width as a string
- (NSString *)asString;

// for debugging purposes, logs the coordinates, optionally with a tag
- (void)debugCoords;
- (void)debugCoordsWithTag:(NSString *)tag;
@end
