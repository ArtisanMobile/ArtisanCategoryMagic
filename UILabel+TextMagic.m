/*
 *  UILabel+TextMagic.m
 *
 *
 *  Created by Scott Wasserman on 8/28/13.
 *  Copyright (c) 2013 Artisan Mobile, Inc. All rights reserved.
 *
 *  Check out Artisan Mobile at http://useartisan.com
 *
 */

#import "UILabel+TextMagic.h"

@implementation UILabel (TextMagic)

- (CGFloat)actualTextWidth
{
    return [self actualTextSize].width;
}

- (CGFloat)actualTextHeight
{
    return [self actualTextSize].height;
}

- (CGSize)actualTextSize
{
    return [self actualTextSizeConstrainedByWidth:self.frame.size.width
                                        andHeight:self.frame.size.height];
}

- (CGSize)actualTextSizeConstrainedByWidth:(CGFloat)width andHeight:(CGFloat)height
{
    CGSize actualTextSize;
    if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0) {
        // We know this is deprecated but the boundingRectWithSize we're using is only in iOS7 or greater
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        actualTextSize = [self.text sizeWithFont:self.font
                               constrainedToSize:CGSizeMake(width,height)
                                   lineBreakMode:self.lineBreakMode];
#pragma clang diagnostic pop
    }
    else {
        actualTextSize =  [self.text boundingRectWithSize:CGSizeMake(width,height)
                                                  options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                               attributes:@{NSFontAttributeName:self.font}
                                                  context:nil].size;
    }
    
    return CGSizeMake(ceil(actualTextSize.width), ceil(actualTextSize.height));
}

- (CGSize)actualTextSizeWithString:(NSString *)stringToSize
{
    CGSize actualTextSize;
    if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0) {
        // We know this is deprecated but the boundingRectWithSize we're using is only in iOS7 or greater
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        actualTextSize = [self.text sizeWithFont:self.font
                               constrainedToSize:CGSizeMake(self.frame.size.width,self.frame.size.height)
                                   lineBreakMode:self.lineBreakMode];
#pragma clang diagnostic pop
    }
    else {
        actualTextSize =  [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width,self.frame.size.height)
                                                  options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                               attributes:@{NSFontAttributeName:self.font}
                                                  context:nil].size;
    }
    
    return CGSizeMake(ceil(actualTextSize.width), ceil(actualTextSize.height));

}

- (void)setTextAndResizeFrame:(NSString *)text
{
    self.text = text;
    [self adjustFrameToTextWidthAndHeight];
}

// This is the same thing as SizeToFit
- (void)adjustFrameHeightToTextHeight
{
    CGSize labelActualTextSize = [self actualTextSize];
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,labelActualTextSize.height);
}

- (void)adjustFrameWidthToTextWidth
{
    CGSize labelActualTextSize = [self actualTextSize];
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,labelActualTextSize.width,self.frame.size.height);
}

- (void)adjustFrameToTextWidthAndHeight
{
    CGSize labelActualTextSize = [self actualTextSize];
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,labelActualTextSize.width,labelActualTextSize.height);
}

- (CGFloat)bottomYCoordinate
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)rightXCoordinate
{
    return self.frame.origin.x + self.frame.size.width;
}

- (int)numberOfLinesToPad
{
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    CGSize actualSize = [self actualTextSize];
    int numberOfLinesToPad =  ceil((self.frame.size.height - actualSize.height) / fontSize.height);
    if (numberOfLinesToPad > 0)
    {
        return numberOfLinesToPad;
    }
    else
    {
        return 0;
    }
}

- (void)alignTop
{
    int numberOfLinesToPad = [self numberOfLinesToPad];
    for(int i = 0; i < numberOfLinesToPad; i++)
    {
        self.text = [self.text stringByAppendingString:@"\n "];
    }
}

- (void)alignBottom
{
    int numberOfLinesToPad = [self numberOfLinesToPad];
    for(int i = 0; i < numberOfLinesToPad; i++)
    {
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
    }
}

- (CGRect)buildStrikethroughFrameWithHeight:(int)strikethroughHeight
{
    CGFloat strikethroughY = self.frame.origin.y + ceil(self.frame.size.height/2) - ceil(strikethroughHeight/2);
    
    CGFloat strikethroughX = self.frame.origin.x;
    
    if (self.textAlignment == NSTextAlignmentCenter)
    {
        strikethroughX = self.frame.origin.x + ceil((self.frame.size.width - [self actualTextWidth])/2);
    }
    else if (self.textAlignment == NSTextAlignmentRight)
    {
        strikethroughX = self.frame.origin.x + (self.frame.size.width) - ceil((self.frame.size.width - [self actualTextWidth])/2);
    }
    
    return CGRectMake(strikethroughX,strikethroughY,[self actualTextWidth],strikethroughHeight);
}

@end
