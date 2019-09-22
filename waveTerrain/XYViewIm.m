//
//  XYViewIm.m
//  waveTerrain
//
//  Created by David Moya on 22/03/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "XYViewIm.h"

@implementation XYViewIm

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 0.5 green: 0.5 blue: 0.5 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 4;
    
    //// Abstracted Attributes
    NSString* textContent = @"Empty";
    NSString* text2Content = @"Moving  Orbits";
    NSString* text3Content = @"Terrain";
    NSString* text4Content = @"Moving Orbits 2";
    NSString* text6Content = @"Terrain 2";
    NSString* text7Content = @"Terrain 3";
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, -0.5, 192.5, 130) cornerRadius: 10];
    [color2 setFill];
    [roundedRectanglePath fill];
    [color2 setStroke];
    roundedRectanglePath.lineWidth = 1.5;
    [roundedRectanglePath stroke];
    
    
    //// Rounded Rectangle 3 Drawing
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(3, 1.5, 60.5, 60.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle3Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle3Path.lineWidth = 1.5;
    [roundedRectangle3Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle 2 Drawing
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(3, 66, 60.5, 60.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle2Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle2Path.lineWidth = 1.5;
    [roundedRectangle2Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle 4 Drawing
    UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(66, 1.5, 60.5, 60.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle4Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle4Path.lineWidth = 1.5;
    [roundedRectangle4Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle 5 Drawing
    UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(66, 66, 60.5, 60.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle5Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle5Path.lineWidth = 1.5;
    [roundedRectangle5Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle 6 Drawing
    UIBezierPath* roundedRectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(129, 1.5, 60.5, 60.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle6Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle6Path.lineWidth = 1.5;
    [roundedRectangle6Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle 7 Drawing
    UIBezierPath* roundedRectangle7Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(129, 66, 60.5, 60.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle7Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle7Path.lineWidth = 1.5;
    [roundedRectangle7Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(141, 90, 37, 13);
    NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [textStyle setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: textStyle};
    
    [textContent drawInRect: textRect withAttributes: textFontAttributes];
    
    
    //// Text 2 Drawing
    CGRect text2Rect = CGRectMake(11, 17, 41, 32);
    NSMutableParagraphStyle* text2Style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [text2Style setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* text2FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: text2Style};
    
    [text2Content drawInRect: text2Rect withAttributes: text2FontAttributes];
    
    
    //// Text 3 Drawing
    CGRect text3Rect = CGRectMake(78, 24, 37, 16);
    NSMutableParagraphStyle* text3Style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [text3Style setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* text3FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: text3Style};
    
    [text3Content drawInRect: text3Rect withAttributes: text3FontAttributes];
    
    
    //// Text 4 Drawing
    CGRect text4Rect = CGRectMake(139, 10, 41, 45);
    NSMutableParagraphStyle* text4Style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [text4Style setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* text4FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: text4Style};
    
    [text4Content drawInRect: text4Rect withAttributes: text4FontAttributes];
    
    
    //// Text 6 Drawing
    CGRect text6Rect = CGRectMake(78, 88, 37, 29);
    NSMutableParagraphStyle* text6Style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [text6Style setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* text6FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: text6Style};
    
    [text6Content drawInRect: text6Rect withAttributes: text6FontAttributes];
    
    
    //// Text 7 Drawing
    CGRect text7Rect = CGRectMake(15, 88, 37, 29);
    NSMutableParagraphStyle* text7Style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [text7Style setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* text7FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: text7Style};
    
    [text7Content drawInRect: text7Rect withAttributes: text7FontAttributes];
    
    
}


@end
