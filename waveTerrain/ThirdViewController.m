//  ThirdViewController.m
//  waveTerrain
//
//  Created by David Moya on 07/01/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//
int alpha;
#import "ThirdViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ThirdViewController ()

@end

@implementation ThirdViewController
float CurrentSRoom, CutOffS, VolumeKn;

Imagetrack * viewimage;

@synthesize csound = mCsound;

@synthesize switchLabel;
@synthesize toggleSwitch;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = @"SWT";
    
    
    [super viewDidLoad];
    
    
    _imageselct.image = [UIImage imageNamed:@"GASOLINE.png"];
    
    
    
    
    viewimage = [[Imagetrack alloc] init];
    [self.view addSubview:viewimage];
    
    
    //Scroll View Size image selectio ///////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    [self.myScrolView setScrollEnabled:YES];
    [self.myScrolView setContentSize:(CGSizeMake(1100, 156))];
    self.myScrolView.showsVerticalScrollIndicator = YES;
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////

    [mXYControl setXValue:.08f];
	[mXYControl setYValue:.85f];
    
    //Initialize Values RGBA Imagetrack
   
    
    [RGBAControl setRValue: 0.0];
    [RGBAControl setGValue: 0.0];
    [RGBAControl setBValue: 0.0];
    [RGBAControl setAValue: 0.0];
    
    [XYpControl setPXValue: 0.0];
    [XYpControl setPYValue: 0.0];
    
    [VXYpControl setVXValue: 0.0];
    [VXYpControl setVYValue: 0.0];


    
    //CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(_imageselct.CGImage));
    // Do any additional setup after loading the view.
}


-(void) viewDidAppear:(BOOL)animated{
    
    [mLevelMeter addToCsoundObj:self.csound forChannelName:@"1"];
    [mLevelMeter1 addToCsoundObj:self.csound forChannelName:@"2"];
    
    PopReverb.hidden = YES;
    PopFtables.hidden = YES;
    PopVolumeC.hidden = YES;
    PopVariableG.hidden = YES;
    PopImage.hidden = YES;
    PopImageSel.hidden = YES;
    ViewSwitchHiddePop.hidden = YES;
    //Locate .csd and assign create a string with its file path
    NSString *tempFile = [[NSBundle mainBundle] pathForResource:@"terrain4" ofType:@"csd"];
    
    
    // Print the file path and name
    //NSLog(@"File opened: %@", tempFile1);
    NSLog(@"File opened: %@", tempFile);
    
    //Allocate some memory
    self.csound = [[CsoundObj alloc] init];
    
    //Tell Csound to add a completion listener
	[self.csound addCompletionListener:self];
    
    [self.csound addValueCacheable:mXYControl];
    [self.csound addValueCacheable:RGBAControl];
    
    
    [self.csound addSwitch:firstswitch forChannelName:@"FirstSwitch"];
    
    //Control Reverb///////////////////////////
    ///////////////////////////////////////////
    CurrentSRoom = 5.0;
    CutOffS = 10000.;
    VolumeKn = .9;
    self->_mPitchLabel.text = [NSString stringWithFormat:@"%1.1f", VolumeKn];
    self->_mCutOff.text = [NSString stringWithFormat:@"%1.1f", CutOffS];
    self->_mSizeRoom.text = [NSString stringWithFormat:@"%1.1f", CurrentSRoom];
    
    
    [_ReverbKnob setMinimumValue:0.1f];
    [_ReverbKnob setMaximumValue:0.9f];
    [_ReverbKnob setValue:.5f];
    [self.csound addValueCacheable:_ReverbKnob];
    
    [_ReverpitchKnob setMinimumValue:0.1f];
    [_ReverpitchKnob setMaximumValue:20000.0f];
    [_ReverpitchKnob setValue:10000.f];
    [self.csound addValueCacheable:_ReverpitchKnob];
    
    [_VolumeKnob setMinimumValue:0.02f];
    [_VolumeKnob setMaximumValue:0.99f];
    [_VolumeKnob setValue:0.90f];
    [self.csound addValueCacheable:_VolumeKnob];

    /////////////////////////////////////////////
    /////////////////////////////////////////////
    
    //Tell csound to start the file
	[self.csound startCsound:tempFile];
}

-(IBAction)Eff1onoff:(id)component;{
    UISwitch* uiswitchEff1 = (UISwitch*)component;
	NSLog(@"Status: %d", [uiswitchEff1 isOn]);
    
    if(uiswitchEff1.on) {
        viewEff1.userInteractionEnabled = YES;
        _ToggleImage.image = [UIImage imageNamed:@"Toggle.png"];
        
    }
    else{
        viewEff1.userInteractionEnabled = NO;
        _ToggleImage.image = [UIImage imageNamed:@"Toggleoff.png"];
    }
    
}


////Show Popups//////////////////
-(IBAction)ShowPopups{
    PopReverb.hidden = NO;
    PopFtables.hidden = NO;
    PopVolumeC.hidden = NO;
    PopVariableG.hidden = NO;
    PopImage.hidden = NO;
    PopImageSel.hidden = NO;
    ViewSwitchHiddePop.hidden = NO;
}

-(IBAction)HiddePopups{
    PopReverb.hidden = YES;
    PopFtables.hidden = YES;
    PopVolumeC.hidden = YES;
    PopVariableG.hidden = YES;
    PopImage.hidden = YES;
    PopImageSel.hidden = YES;
    ViewSwitchHiddePop.hidden = YES;
}
////////////////////////////////////
///////////////////////////////////

-(IBAction)Images1{
 _imageselct.image = [UIImage imageNamed:@"lines.jpg"];
}

-(IBAction)Images2{
 _imageselct.image = [UIImage imageNamed:@"GASOLINE.png"];
}

-(IBAction)Images3{
 _imageselct.image = [UIImage imageNamed:@"RedBlack.jpg"];
}

-(IBAction)Images4{
    _imageselct.image = [UIImage imageNamed:@"AbstractFolkArt.jpg"];
}

-(IBAction)Images5{
    _imageselct.image = [UIImage imageNamed:@"Abstract.jpg"];
}

-(IBAction)Images6{
    _imageselct.image = [UIImage imageNamed:@"AbstractGlass.jpg"];
}

-(IBAction)Images7{
    _imageselct.image = [UIImage imageNamed:@"Color.jpg"];
}
-(IBAction)Images8{
    _imageselct.image = [UIImage imageNamed:@"wallpaper.jpg"];
}

-(IBAction)Images9{
    _imageselct.image = [UIImage imageNamed:@"ColorBars.jpg"];
}

-(IBAction)Images10{
    _imageselct.image = [UIImage imageNamed:@"BlackWave.jpg"];
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [mCsound stopCsound];
}

-(IBAction)DisplayControlEff{
    viewEff1.userInteractionEnabled = YES;
}
-(IBAction)HiddenControlEff{
    viewEff1.userInteractionEnabled = NO;
}

//////////////// Control Views effects////////////////////
//////////////////////////////////////////////////////////


-(IBAction)Eff2onoff:(id)component{
    UISwitch* uiswitchEff2 = (UISwitch*)component;
	NSLog(@"Status: %d", [uiswitchEff2 isOn]);
    
    if(uiswitchEff2.on) {
        viewEff2.hidden = NO;
        
        
    }
    else{
        viewEff2.hidden = YES;
    }

    
}
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////


////////////////////////////////////////////////////
////////////////////////////////////////////////////

/////////////////Action Knobs/////////////////////////
//////////////////////////////////////////////////////

- (IBAction)changeReverb:(UIKnob *)sender{
    
    [_mSizeRoom setText:[NSString stringWithFormat:@"%1.1f", [sender value]]];
}

- (IBAction)changePitchReverb:(UIKnobPitchR *)sender{
    [_mCutOff setText:[NSString stringWithFormat:@"%1.1f", [sender value]]];
    
}

- (IBAction)changeVolume:(UIKnobVolume *)sender{
   [_mPitchLabel setText:[NSString stringWithFormat:@"%1.1f", [sender value]]];
   
    
}
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////



-(void)setup:(CsoundObj* )csoundObj
{
 [self.csound addSwitch:firstswitch forChannelName:@"FirstSwitch"];
    [mLevelMeter addToCsoundObj:self.csound forChannelName:@"32"];
    [mLevelMeter1 addToCsoundObj:self.csound forChannelName:@"16"];
}

//Update the values being sent from IOS to Csound
-(void)updateValuesToCsound
{
    
    
    
}
// Collect any values from Csound
-(void)updateValuesFromCsound
{
    //No values coming from Csound to iOS
}

//
-(void)cleanup
{
}

//This method is called when Csound object is created. This allows developers to notify the user that Csound is running IOS
-(void)csoundObjDidStart:(CsoundObj *)csoundObj
{
}

//Much like the way the'csoundObjDidStart' method works, this allows developers to notify the user that Csound has stopped running in IOS.
-(void)csoundObjComplete:(CsoundObj *)csoundObj
{
}


//Hidden status Bar
-(BOOL)prefersStatusBarHidden{
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
