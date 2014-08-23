/*  
 *	UIView+FrameMagic.h
 *
 *  Created by Scott Wasserman on 9/11/13.
 *  Copyright (c) 2013 Artisan Mobile, Inc. All rights reserved.
 *
 *  Check out Artisan Mobile at http://useartisan.com
 *
 */

#import "UIView+FrameMagic.h"

@implementation UIView (FrameMagic)


- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,width,self.frame.size.height);
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,height);
}

- (void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
}

- (void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x,y,self.frame.size.width,self.frame.size.height);
}

- (CGFloat)rightXCoordinate
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottomYCoordinate
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)alignBottomYWithFrame:(CGRect)frame
{
    self.frame = CGRectMake(self.frame.origin.x, frame.origin.y + frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)centerHorizontallyInFrame:(CGRect)frame
{
    self.frame = CGRectMake( (frame.size.width - self.frame.size.width)/2, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)centerVerticallyInFrame:(CGRect)frame
{
    self.frame = CGRectMake(self.frame.origin.x, (frame.size.height - self.frame.size.height)/2,self.frame.size.width, self.frame.size.height);
}

- (void)centerHorizontallyAndVerticallyInFrame:(CGRect)frame {
    [self centerHorizontallyInFrame:frame];
    [self centerVerticallyInFrame:frame];
}

- (void)setFrameYPixelsDown:(CGFloat)yPixels fromFrame:(CGRect)frame
{
    self.frame = CGRectMake(self.frame.origin.x, frame.origin.y + frame.size.height + yPixels, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameYPixelsUpFromBottomOfScreen:(CGFloat)yPixels screenHeight:(CGFloat)screenHeight
{
    self.frame = CGRectMake(self.frame.origin.x, screenHeight - yPixels - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameXPixelsRight:(CGFloat)xPixels fromFrame:(CGRect)frame
{
    self.frame = CGRectMake(frame.origin.x + frame.size.width + xPixels, frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (NSString *)asString
{
    return [NSString stringWithFormat:@"%f,%f,%f,%f",self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height];
}

- (void)debugCoords
{
    NSLog(@"%@",[self asString]);
}

- (void)debugCoordsWithTag:(NSString *)tag
{
    NSLog(@"%@ - %@",tag,[self asString]);
}


+ (CGFloat)viewRightX:(UIView *)view
{
    return view.frame.origin.x + view.frame.size.width;
}

+ (CGFloat)viewBottomY:(UIView *)view
{
    return view.frame.origin.y + view.frame.size.height;
}

@end
