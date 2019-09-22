//
//  Imagetrack.h
//  waveTerrain
//
//  Created by David Moya on 11/02/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CsoundObj.h"
#import "CsoundValueCacheable.h"

@interface Imagetrack : UIControl <CsoundValueCacheable>

{
    Float32 rValue, gValue, bValue, aValue, xpValue,ypValue,VxpValue,VypValue;
    
	
	// Value Cacheable
	BOOL mCacheDirty;
    CGRect circleRect;
	float cachedValueR, cachedValueG, cachedValueB, cachedValueA, cachedValuepx, cachedValuepY, cachedValueVx, cachedValueVY;
    float *channelPtrR, *channelPtrG,*channelPtrB, *channelPtrA,*channelPtrGpx,*channelPtrGpy, *channelPtrVpx,*channelPtrVpy;
    
    
    
}
-(IBAction)Silence;
@property (nonatomic)  UIImage *imageselct;
@property (nonatomic, retain) UIImage *workingImage;


//Values RGB Third View controler
@property (nonatomic, readwrite, setter = setRValue:) Float32 rValue;
@property (nonatomic, readwrite, setter = setGValue:) Float32 gValue;
@property (nonatomic, readwrite, setter = setBValue:) Float32 bValue;
@property (nonatomic, readwrite, setter = setAValue:) Float32 aValue;

//X and Y Variables
@property (nonatomic, readwrite, setter = setPXValue:) Float32 xpValue;
@property (nonatomic, readwrite, setter = setPYValue:) Float32 ypValue;

//X and Y Velocity
@property (nonatomic, readwrite, setter = setVXValue:) Float32 VxpValue;
@property (nonatomic, readwrite, setter = setVYValue:) Float32 VypValue;


@property (assign) BOOL cacheDirty;


//Variables gesture//////////////////////////////////////////
/////////////////////////////////////////////////////////////
@property (nonatomic, weak) IBOutlet UILabel *redLabel;
@property (nonatomic, weak) IBOutlet UILabel *greenLabel;
@property (nonatomic, weak) IBOutlet UILabel *blueLabel;
@property (nonatomic, weak) IBOutlet UILabel *alphaLabel;

@property (nonatomic, weak) IBOutlet UILabel *xLabel;
@property (nonatomic, weak) IBOutlet UILabel *yLabel;

@property (nonatomic, weak) IBOutlet UILabel *VxLabel;
@property (nonatomic, weak) IBOutlet UILabel *VyLabel;
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

- (BOOL)InitUIpanGesture:(UITouch *)touch withEvent:(UIEvent *)event;
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;

-(IBAction)images1a;
-(IBAction)images2a;
-(IBAction)images3a;
-(IBAction)images4a;
-(IBAction)images5a;
-(IBAction)images6a;
-(IBAction)images7a;
-(IBAction)images8a;
-(IBAction)images9a;
-(IBAction)images10a;




@end
