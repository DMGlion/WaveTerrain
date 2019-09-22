//
//  ReverbUIview.m
//  waveTerrain
//
//  Created by David Moya on 10/03/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "ReverbUIview.h"

@implementation ReverbUIview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 0.5 green: 0.5 blue: 0.5 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 4;
    
    //// Abstracted Attributes
    NSString* reverbContent = @"Reverb";
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 0.5, 65.5, 308.5) cornerRadius: 10];
    [color2 setFill];
    [roundedRectanglePath fill];
    [color2 setStroke];
    roundedRectanglePath.lineWidth = 1.5;
    [roundedRectanglePath stroke];
    
    
    //// Rounded Rectangle 3 Drawing
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(4, 4.5, 61, 61) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle3Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle3Path.lineWidth = 1.5;
    [roundedRectangle3Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle 4 Drawing
    UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(4, 70, 60.5, 234.5) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle4Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle4Path.lineWidth = 1.5;
    [roundedRectangle4Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Reverb Drawing
    CGRect reverbRect = CGRectMake(12, 284, 45, 15);
    NSMutableParagraphStyle* reverbStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [reverbStyle setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* reverbFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"ArialMT" size: 10], NSForegroundColorAttributeName: [UIColor blackColor], NSParagraphStyleAttributeName: reverbStyle};
    
    [reverbContent drawInRect: reverbRect withAttributes: reverbFontAttributes];
    
    
    
}


@end
