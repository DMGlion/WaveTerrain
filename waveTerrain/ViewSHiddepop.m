//
//  ViewSHiddepop.m
//  waveTerrain
//
//  Created by David Moya on 25/03/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "ViewSHiddepop.h"

@implementation ViewSHiddepop

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
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.867 green: 0.969 blue: 0.725 alpha: 1];
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 0.5, 60, 60) cornerRadius: 10];
    [color setFill];
    [roundedRectanglePath fill];
    [color setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
}


@end
