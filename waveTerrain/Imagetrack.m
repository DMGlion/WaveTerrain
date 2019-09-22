//
//  Imagetrack.m
//  waveTerrain
//
//  Created by David Moya on 11/02/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import "Imagetrack.h"
#include "ThirdViewController.h"


@interface Imagetrack ()
{
    CGFloat borderWidth;
    BOOL shouldTrack;
    float red,green,blue,alpha;
    int tranx,trany,velocityx,velocityy;
}
@end


@implementation Imagetrack
{
  
}
@synthesize rValue;
@synthesize gValue;
@synthesize bValue;
@synthesize aValue;

@synthesize xpValue;
@synthesize ypValue;

@synthesize workingImage;
@synthesize imageselct;

@synthesize VxpValue;
@synthesize VypValue;
@synthesize cacheDirty = mCacheDirty;


/////////////////Initialize First Image/////////////////////////////////////////////////
//////////Things loaded from a nib are inited with -(id)initWithCoder:(NSCoder*)coder///
////////////////////////////////////////////////////////////////////////////////////////
-(id)initWithCoder:(NSCoder*)coder
{
    [self startimageValue];
    self = [super initWithCoder:coder];
    if (self) {
    [self startimageValue];
    
        
    }
    return self;
}

-(void)startimageValue{
    imageselct = [UIImage imageNamed:@"GASOLINE.png"];
}
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UIControl Overrides

- (BOOL)InitUIpanGesture:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    return YES;
    
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handlePan:)];
    
    
    
    /*
     UIPanGestureRecognizer *panGesture1 = [[UIPanGestureRecognizer alloc]
     initWithTarget:self action:@selector(gestureRecognizerShouldBegin:)];
     */
    [self addGestureRecognizer: panGesture];
    /*
     [self addGestureRecognizer: panGesture1];
     */
}


-(IBAction)images1a{
    imageselct = [UIImage imageNamed:@"lines.jpg"];
    
}

-(IBAction)images2a{
    imageselct = [UIImage imageNamed:@"GASOLINE.png"];
}

-(IBAction)images3a{
    imageselct = [UIImage imageNamed:@"RedBlack.jpg"];
    
}

-(IBAction)images4a{
    imageselct = [UIImage imageNamed:@"AbstractFolkArt.jpg"];
    
}

-(IBAction)images5a{
    imageselct = [UIImage imageNamed:@"Abstract.jpg"];
    
}

-(IBAction)images6a{
    imageselct = [UIImage imageNamed:@"AbstractGlass.jpg"];
    
}

-(IBAction)images7a{
    imageselct = [UIImage imageNamed:@"Color.jpg"];
    
}

-(IBAction)images8a{
    imageselct = [UIImage imageNamed:@"wallpaper.jpg"];
    
}

-(IBAction)images9a{
    imageselct = [UIImage imageNamed:@"ColorBars.jpg"];
    
}

-(IBAction)images10a{
    imageselct = [UIImage imageNamed:@"BlackWave.jpg"];
    
}


- (IBAction)handlePan:(UIPanGestureRecognizer *)event
{
    if (event.numberOfTouches==1){
        
        tranx = [event locationInView:self].x;
        trany = [event locationInView:self].y;
        
        CGPoint vel = [event velocityInView:self];
        velocityx = vel.x;
        velocityy = vel.y;
        
        //////I was getting an error compilation do to the negative values of x/////
        ////////////////////////////////////////////////////////////////////////////
        if( tranx<0){
            tranx = tranx*-1;
        }
        ////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////
        
        
        CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(imageselct.CGImage));
        const UInt8* data = CFDataGetBytePtr(pixelData);
        int pixelInfo = ((workingImage.size.width  * trany) + tranx ) * 4;
        
        red = data[pixelInfo];
        green = data[(pixelInfo+1)];
        blue = data[pixelInfo  +2 ];
        alpha = data[pixelInfo +3 ];
        
        CFRelease(pixelData);
        UIColor* color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha/255.0f];
        
        if ([color getRed:&red green: &green blue: &blue alpha: &alpha]){
            
            NSLog(@"r: %f g: %f b: %f a: %f", red, green, blue, alpha);
            
            rValue = red;
            gValue = green;
            bValue = blue;
            aValue = alpha;
            
            VxpValue = velocityx;
            VypValue = velocityy;
            
            [self sendActionsForControlEvents:UIControlEventValueChanged];
            [self updateLabels];
        }
    }
}


- (void)updateLabels {
    // NSLog(@"Color value - R : %f G : %f : B %f", rValue, gValue, bValue);
    red1 = [NSString stringWithFormat:@"%f", red];
    self.redLabel.text = red1;
    
    green1 = [NSString stringWithFormat:@"%f", green];
    self.greenLabel.text = green1;
    
    alpha1 = [NSString stringWithFormat:@"%f", alpha];
    self.alphaLabel.text = alpha1;
    
    blue1 = [NSString stringWithFormat:@"%f", blue];
    self.blueLabel.text = blue1;
    
    xone = [NSString stringWithFormat:@"%i", tranx];
    self.xLabel.text = xone;
    
    yone = [NSString stringWithFormat:@"%i", trany];
    self.yLabel.text = yone;
    
    Vxone = [NSString stringWithFormat:@"%i", velocityx];
    self.VxLabel.text = Vxone;
    
    Vyone = [NSString stringWithFormat:@"%i", velocityy];
    self.VyLabel.text = Vyone;

        
}

-(IBAction)Silence{
    rValue=0;
    gValue=0;
    bValue=0;
    aValue=0;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark - Value Cacheable
- (void)setup:(CsoundObj *)csoundObj
{
    //Color data to Csound
	channelPtrR = [csoundObj getInputChannelPtr:@"Red" channelType:CSOUND_CONTROL_CHANNEL];
	channelPtrG = [csoundObj getInputChannelPtr:@"Green" channelType:CSOUND_CONTROL_CHANNEL];
    channelPtrB = [csoundObj getInputChannelPtr:@"Blue" channelType:CSOUND_CONTROL_CHANNEL];
    channelPtrA = [csoundObj getInputChannelPtr:@"Alpha" channelType:CSOUND_CONTROL_CHANNEL];

    cachedValueR = rValue;
	cachedValueG = gValue;
    cachedValueB = bValue;
    cachedValueA = aValue;
    
    //X and Y to csound
    channelPtrGpx = [csoundObj getInputChannelPtr:@"xView" channelType:CSOUND_CONTROL_CHANNEL];
    channelPtrGpy = [csoundObj getInputChannelPtr:@"yView" channelType:CSOUND_CONTROL_CHANNEL];
    cachedValuepx = tranx ;
    cachedValuepY = trany;
    
    //Velocity to csound
    channelPtrVpx = [csoundObj getInputChannelPtr:@"VxView" channelType:CSOUND_CONTROL_CHANNEL];
    channelPtrVpy = [csoundObj getInputChannelPtr:@"VyView" channelType:CSOUND_CONTROL_CHANNEL];
    cachedValueVx = VxpValue;
    cachedValueVY = VypValue;
    
    self.cacheDirty = YES;
    [self addTarget:self action:@selector(updateValueCache:) forControlEvents:UIControlEventValueChanged];    
}


- (void)updateValueCache:(id)sender
{
    cachedValueR = ((Imagetrack*)sender).rValue;
	cachedValueG = ((Imagetrack*)sender).gValue;
    cachedValueB = ((Imagetrack*)sender).bValue;
    cachedValueA = ((Imagetrack*)sender).aValue;
    
    //X and Y to csound
    cachedValuepx = ((Imagetrack*)sender).xpValue;
    cachedValuepY = ((Imagetrack*)sender).ypValue;
    
    //Velocity to csound
    cachedValueVx = ((Imagetrack*)sender).VxpValue;
    cachedValueVY = ((Imagetrack*)sender).VypValue;
    
     self.cacheDirty = YES;
}

- (void)updateValuesToCsound
{
	if (self.cacheDirty) {
        
        *channelPtrR = cachedValueR;
		*channelPtrG = cachedValueG;
        *channelPtrB = cachedValueB;
        *channelPtrA = cachedValueA;
        
        *channelPtrGpx = cachedValuepx;
        *channelPtrGpy = cachedValuepY;
        
        *channelPtrVpx = cachedValueVx;
        *channelPtrVpy = cachedValueVY;
        
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
