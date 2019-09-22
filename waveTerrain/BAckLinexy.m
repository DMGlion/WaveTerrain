//
//  BAckLinexy.m
//  waveTerrain
//
//  Created by David Moya on 22/03/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "BAckLinexy.h"

@implementation BAckLinexy

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
    // Drawing code
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
    NSString* textContent = @"Function Tables";
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0.5, 302, 150) cornerRadius: 10];
    [color2 setFill];
    [roundedRectanglePath fill];
    [color2 setStroke];
    roundedRectanglePath.lineWidth = 1.5;
    [roundedRectanglePath stroke];
    
    
    //// Rounded Rectangle 3 Drawing
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(3.5, 2.5, 296, 145) cornerRadius: 10];
    [[UIColor whiteColor] setFill];
    [roundedRectangle3Path fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setStroke];
    roundedRectangle3Path.lineWidth = 1.5;
    [roundedRectangle3Path stroke];
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(109, 134, 85, 16);
    NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [textStyle setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"ArialMT" size: 10], NSForegroundColorAttributeName: [UIColor blackColor], NSParagraphStyleAttributeName: textStyle};
    
    [textContent drawInRect: textRect withAttributes: textFontAttributes];
}


@end
