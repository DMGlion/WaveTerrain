//
//  ViewImages.m
//  waveTerrain
//
//  Created by David Moya on 13/02/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "ViewImages.h"

@implementation ViewImages

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        

        // Initialization code
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
   self.showsVerticalScrollIndicator=YES;

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    }


@end
