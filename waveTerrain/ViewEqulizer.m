//
//  ViewEqulizer.m
//  waveTerrain
//
//  Created by David Moya on 10/01/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "ViewEqulizer.h"

@implementation ViewEqulizer

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
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.833 green: 0.833 blue: 0.833 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.497 green: 0.497 blue: 0.497 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* gradientColor3 = [UIColor colorWithRed: 0.571 green: 0.571 blue: 0.571 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    UIColor* color6 = [UIColor colorWithRed: 1 green: 1 blue: 0.571 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)[UIColor colorWithRed: 0.534 green: 0.534 blue: 0.534 alpha: 1].CGColor,
                               (id)gradientColor3.CGColor, nil];
    CGFloat gradientLocations[] = {0.1, 0.64, 0.99};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, -0.5, 318, 375) cornerRadius: 12];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(159.5, -0.5), CGPointMake(159.5, 374.5), 0);
    CGContextRestoreGState(context);
    [[UIColor blackColor] setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    
    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5.5, 4.5, 308, 365) cornerRadius: 12];
    [color setFill];
    [rectangle2Path fill];
    [gradientColor2 setStroke];
    rectangle2Path.lineWidth = 1;
    [rectangle2Path stroke];
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(81, 330, 157, 60);
    NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [textStyle setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"ArialHebrew" size: 21], NSForegroundColorAttributeName: gradientColor2, NSParagraphStyleAttributeName: textStyle};
    
    [@"EQ Controller" drawInRect: textRect withAttributes: textFontAttributes];
    
    
    //// Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(21.5, 19.5, 276, 293) cornerRadius: 12];
    [color4 setFill];
    [rectangle3Path fill];
    [color5 setStroke];
    rectangle3Path.lineWidth = 1;
    [rectangle3Path stroke];
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(238.5, 325.5, 58, 30)];
    [color6 setFill];
    [ovalPath fill];
    [color5 setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
