//
//  ImagePop.m
//  waveTerrain
//
//  Created by David Moya on 25/03/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "ImagePop.h"

@implementation ImagePop

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
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.867 green: 0.969 blue: 0.725 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.867 green: 0.969 blue: 0.725 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.886 green: 0 blue: 0.295 alpha: 1];
    
    //// Abstracted Attributes
    NSString* textContent = @"Interact With the Image Below Me for Sonification Purposes";
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 1.5, 213, 82) cornerRadius: 10];
    [color3 setFill];
    [roundedRectanglePath fill];
    [color setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [color4 setFill];
    [bezier2Path fill];
    [color setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(25, 14, 166, 56);
    NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [textStyle setAlignment: NSTextAlignmentCenter];
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 15.5], NSForegroundColorAttributeName: [UIColor blackColor], NSParagraphStyleAttributeName: textStyle};
    
    [textContent drawInRect: textRect withAttributes: textFontAttributes];
    
}


@end
