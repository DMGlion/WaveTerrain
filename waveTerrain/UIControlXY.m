//
//  UIControlXY.m
//  waveTerrain
//
//  Created by David Moya on 14/01/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "UIControlXY.h"

@interface UIControlXY ()
{
    CGFloat borderWidth;
    BOOL shouldTrack;
}
@end

@implementation UIControlXY

@synthesize cacheDirty = mCacheDirty;
@synthesize xValue;
@synthesize yValue;
@synthesize circleDiameter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        borderWidth = 10.0f;
        circleRect = CGRectMake(borderWidth,
                                frame.size.height - 30.0f - borderWidth,
                                30.0f,
                                30.0f);
        xValue = 0.0f;
        yValue = 0.0f;
        
        shouldTrack = NO;
    }
    return self;
}
- (void)viewDidLoad
{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
        circleRect = CGRectMake(borderWidth,
                                self.frame.size.height - 30.0f - borderWidth,
                                30.0f,
                                30.0f);
        xValue = 0.0f;
        yValue = 0.0f;
    }
    return self;
}

- (void)setXValue:(Float32)xValue_
{
    xValue = xValue_;
    
    // Limit it
    CGFloat minX = borderWidth;
    CGFloat maxX = self.frame.size.width - borderWidth - circleRect.size.width;
    
    // Redraw
    CGFloat xPosition = xValue * (maxX - minX);
    circleRect.origin.x = xPosition + borderWidth;
    
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setYValue:(Float32)yValue_
{
    yValue = yValue_;
    
    CGFloat minY = borderWidth;
    CGFloat maxY = self.frame.size.height - borderWidth - circleRect.size.height;
    
    CGFloat yPosition = yValue * (maxY - minY);
    yPosition = maxY - yPosition;
    circleRect.origin.y = yPosition;
    
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setCircleDiameter:(CGFloat)circleDiameter_
{
    circleRect = CGRectMake(borderWidth,
                            self.frame.size.height - circleDiameter_ - borderWidth,
                            circleDiameter_,
                            circleDiameter_);
    [self setNeedsDisplay];
}

#pragma mark - UIControl Overrides

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:self];
    //if (CGRectContainsPoint(circleRect, location)) {
    
    // Reposition the touch (origin is top left)
    location.x -= circleRect.size.width/2.0f;
    location.y -= circleRect.size.height/2.0f;
    
    // Limit it
    CGFloat minX = borderWidth;
    CGFloat minY = borderWidth;
    CGFloat maxX = self.frame.size.width - borderWidth - circleRect.size.width;
    CGFloat maxY = self.frame.size.height - borderWidth - circleRect.size.height;
    location.x = location.x < minX ? minX : location.x;
    location.y = location.y < minY ? minY : location.y;
    location.x = location.x > maxX ? maxX : location.x;
    location.y = location.y > maxY ? maxY : location.y;
    
    // Redraw
    circleRect.origin.x = location.x;
    circleRect.origin.y = location.y;
    
    // Update values
    xValue = location.x / maxX;
    yValue = 1.0f - location.y / maxY;
    
    shouldTrack = YES;
    //}
    //Control ftable type Csound////
    ////////////////////////////////
    if(xValue<.33&& yValue>.5){
        xValue = 1.;
    }
    else if (xValue>.33&& xValue<.66 && yValue>.5){
        xValue = 2.;
    }
    else if (xValue>.66&& yValue>.5){
        xValue = 3.;
    }
        else if(xValue<.33&& yValue<.5){
        xValue = 4.;
    }
    else if (xValue>.33&& xValue<.66 && yValue<.5){
        xValue = 5.;
    }
    else if (xValue>.66&& yValue<.5){
        xValue = 6.;
    }
    
    
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:self];
    if (shouldTrack) {
        
        // Reposition the touch (origin is top left)
        location.x -= circleRect.size.width/2.0f;
        location.y -= circleRect.size.height/2.0f;
        
        // Limit it
        CGFloat minX = borderWidth;
        CGFloat minY = borderWidth;
        CGFloat maxX = self.frame.size.width - borderWidth - circleRect.size.width;
        CGFloat maxY = self.frame.size.height - borderWidth - circleRect.size.height;
        location.x = location.x < minX ? minX : location.x;
        location.y = location.y < minY ? minY : location.y;
        location.x = location.x > maxX ? maxX : location.x;
        location.y = location.y > maxY ? maxY : location.y;
        
        // Redraw
        circleRect.origin.x = location.x;
        circleRect.origin.y = location.y;
        
        // Update values
        xValue = location.x / maxX;
        yValue = 1.0f - location.y / maxY;
        
    }
    
    //Control ftable type Csound////
    ////////////////////////////////
    if(xValue<.33&& yValue>.5){
        xValue = 1.;
    }
    else if (xValue>.33&& xValue<.66 && yValue>.5){
        xValue = 2.;
    }
    else if (xValue>.66&& yValue>.5){
        xValue = 3.;
    }
    else if(xValue<.33&& yValue<.5){
        xValue = 4.;
    }
    else if (xValue>.33&& xValue<.66 && yValue<.5){
        xValue = 5.;
    }
    else if (xValue>.66&& yValue<.5){
        xValue = 6.;
    }
    ////////////////////////////////
    ////////////////////////////////
     NSLog(@"Color value - R : %f G : %f ", xValue ,yValue);
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;

   }



- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    shouldTrack = NO;
}

- (void)drawRect:(CGRect)rect
{
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10.0, 10.0)];
    [clipPath addClip];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Draw border lines.
    [[UIColor blackColor] set];
    CGContextSetLineWidth(context, borderWidth * 2.0f);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, borderWidth * 2.0f);
    
    // Line 1
    CGMutablePathRef borderPath = CGPathCreateMutable();
    CGPathMoveToPoint(borderPath, NULL, 0.0f, 0.0f);
    CGPathAddLineToPoint(borderPath, NULL, 0.0f, rect.size.height);
    CGPathAddLineToPoint(borderPath, NULL, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(borderPath, NULL, rect.size.width, 0.0f);
    CGPathAddLineToPoint(borderPath, NULL, 0.0f, 0.0f);
    CGContextAddPath(context, borderPath);
    CGPathRelease(borderPath);
    CGContextDrawPath(context, kCGPathStroke);
	
	CGContextAddEllipseInRect(context, circleRect);
	CGContextFillEllipseInRect(context, circleRect);
    
    CGColorSpaceRelease(colorSpace);
    

    
}


#pragma mark - Value Cacheable

- (void)setup:(CsoundObj *)csoundObj
{
    NSLog(@"Color value - R : %f G : %f ", xValue ,yValue);
	channelPtrX = [csoundObj getInputChannelPtr:@"typeftable" channelType:CSOUND_CONTROL_CHANNEL];
	channelPtrY = [csoundObj getInputChannelPtr:@"pitch" channelType:CSOUND_CONTROL_CHANNEL];
    cachedValueX = xValue;
	cachedValueY = yValue;
    self.cacheDirty = YES;
    [self addTarget:self action:@selector(updateValueCache:) forControlEvents:UIControlEventValueChanged];
}

- (void)updateValueCache:(id)sender
{
	cachedValueX = ((UIControlXY*)sender).xValue;
	cachedValueY = ((UIControlXY*)sender).yValue;
    self.cacheDirty = YES;
}

- (void)updateValuesToCsound
{
	if (self.cacheDirty) {
        *channelPtrX = cachedValueX;
		*channelPtrY = cachedValueY;
        self.cacheDirty = NO;
    }
}

- (void)updateValuesFromCsound
{
	
}

- (void)cleanup
{
	[self removeTarget:self action:@selector(updateValueCache:) forControlEvents:UIControlEventValueChanged];
}

@end
