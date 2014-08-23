/*
 *  UILabel+TextMagic.h
 *
 *  Used to contain properties of the UILabel such as text size,
 *  width and height, and adjust the size of the frame of the 
 *  label to match the size of the text.
 *  
 *  Created by Scott Wasserman on 8/28/13.
 *  Copyright (c) 2013 Artisan Mobile, Inc. All rights reserved.
 *
 *  Check out Artisan Mobile at http://useartisan.com
 *
 */

@interface UILabel (TextMagic)

/*
 *  Holds the label's text size in CGSize variable
 */
- (CGSize)actualTextSize;
/*
 *  Extracts from actualTextSize the width of the text
 */
- (CGFloat)actualTextWidth;
/*
 *  Extracts from actualTextHeight the height of the test
 */
- (CGFloat)actualTextHeight;
/*
 *  Returns the text size that is constrained by the given size
 *  This is the size of the text that is visible when the given 
 *  size is smaller than the text it holds
 *  Takes in a width and a height, both of type CGFloat
 */
- (CGSize)actualTextSizeConstrainedByWidth:(CGFloat)width andHeight:(CGFloat)height;
/*
 *  Returns the text size that is constrained by the given size
 *  This is the size of the text that is visible when the given 
 *  size is smaller than the text it holds
 *  Takes in a string, and uses the size of the string
 */
- (CGSize)actualTextSizeWithString:(NSString *)stringToSize;
/*
 * 	Sets the labels text to the given string and adjusts the
 *  size (height and width) to match the size of the inputted
 *  string
 */
- (void)setTextAndResizeFrame:(NSString *)text;
/*
 *  Changes the labels height to match the text's height
 */
- (void)adjustFrameHeightToTextHeight;
/*
 *  Changes the labels width to match its text's width
 */
- (void)adjustFrameWidthToTextWidth;
/*
 *  Changes the labels width and height to match it's
 *  text size
 */
- (void)adjustFrameToTextWidthAndHeight;
/*
 *  Returns the Y coordinate of the bottom of the label
 */
- (CGFloat)bottomYCoordinate;
/*
 *  Returns the X coordinate of the right of the label
 */
- (CGFloat)rightXCoordinate;
/*
 *  Adds n linebreaks to the top of the label, where n is 
 *  an integer returned by "numberOfLinesToPad", which is
 *  calculated by taking (frame size - textsize)/font height
 */
- (void)alignTop;
/*
 *  Adds n linebreaks to the bottom of the label, where n is 
 *  an integer returned by "numberOfLinesToPad", which is
 *  calculated by taking (frame size - textsize)/font height
 */
- (void)alignBottom;
/*
 *  Takes the height of the font (so that the strikethrough goes
 *  through the middle of the text) and creates a strikethrough
 *  across the font of type CGRect
 */
- (CGRect)buildStrikethroughFrameWithHeight:(int)strikethroughHeight;
@end
