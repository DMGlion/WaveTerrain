//
//  FirstViewController.m
//  waveTerrain
//
//  Created by David Moya on 02/11/2013.
//  Copyright (c) 2013 David Moya. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
float currentValue;
float currentReverb,currentDur,_currentKQ,_currentPan;
float* ampChannelPtr;
int _currentMode,_currentKV,_currentKC;
UISwitch* uiswitch;
@synthesize csound = mCsound;


//Display equalizer View
-(IBAction)DisplayEqualizer{
    
    viewEqualizer.hidden = NO;
    
}

//Hide equalizer View
-(IBAction)HiddenEqualizer{
  
    viewEqualizer.hidden = YES;
}


- (void)viewDidLoad
{
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"Sliderball32x"];
    [self->slidervolume setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderballHigh32x"];
    [self->slidervolume setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"aLeft1"]
    resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [firstswitch setOn:NO animated:YES];
    self.title = @"Intro";
    [self->slidervolume setMinimumTrackImage:trackLeftImage
                                    forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self->slidervolume setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    [firstswitch setOn:NO animated:YES];
    self.title = @"Home";
    [super viewDidLoad];
       

	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated
{
 [self startvaluesview1];
 [firstswitch setOn:NO animated:YES];
}


-(void) startvaluesview1
{
   //initialze value to 0.8 on
   currentValue = 0.8;
    
   //imitialize value reverb to 0.8
    currentReverb = 1.0;
    
   //initialize value Harm
    currentDur = 0.3;
    
   //initialize value Pan
    _currentPan = 0.5;
    
    //Variables init Equalizer///////////////////////////
    //initialize kv
    _currentKV = 0;
    _currentKC = 0;
    _currentKQ = 0.5;
    
    /////////////////////////////////////////////////////
   
   //Slider Pan
   self->sliderPan.value= _currentPan;
    
   //Slider Harm
   self->sliderDur.value= currentDur;
   
    //Slider Volume
   self->slidervolume.value= currentValue;
   
    //Slider Reverb
   self->sliderReverb.value= currentReverb;
    
    //Label Pan
   self->kPanning.text = [NSString stringWithFormat:@"%1.1f", _currentPan];

    //Label Reverb
   self->Dur.text = [NSString stringWithFormat:@"%1.1f", currentDur];
    
    //Label Reverb
   self->Reverb.text = [NSString stringWithFormat:@"%1.1f", currentReverb];
    
    //and Label
   self->volume.text = [NSString stringWithFormat:@"%1.1f", currentValue];
    
   //Initialize label on/off to Off
   Switch.text= [NSString stringWithFormat:@"Off"];
    
    
    ////////////////////Equalizer///////////////////////////
    //Slider ModeEQ
    self->sliderModeEQ.value= _currentMode;
    
    //Label ModeEQ
    self->ModeEQ.text = [NSString stringWithFormat:@"%d", _currentMode];
    
    //Slider Kv
    self->EquKv.value= _currentKV;
    
    //Label Kv
    self->ModeKc.text = [NSString stringWithFormat:@"%d", _currentKC];
    
    //Slider Kc
    self->EquKc.value= _currentKC;
    
    //Label Kc
    self->ModeKc.text = [NSString stringWithFormat:@"%1.1f", _currentKQ];
    
    //Slider Kq
    self->EquKq.value= _currentKQ;
    
    //Label Kq
    self->ModeKq.text = [NSString stringWithFormat:@"%1.1f", _currentKQ];
    
    /////////////////////////////////////////////////////////

}





/////////////////////////////Equlizer Sliders////////////////////////////////////////////////

//Method Slider Mode Eq
-(IBAction)slModeEQ:(id)sender{
    ModeEQ.text = [NSString stringWithFormat:@"%d",_currentMode];
    UISlider *ModeSlider = (UISlider *)sender;
    _currentMode = ModeSlider.value;
    NSLog(@"%d", _currentMode);
    
}
//Method Slider Kv
-(IBAction)sliderEqKv:(id)sender{
    ModeKv.text = [NSString stringWithFormat:@"%d",_currentKV];
    UISlider *KvSlider = (UISlider *)sender;
    _currentKV = KvSlider.value;
    NSLog(@"%d", _currentKV);

}

//Method Slider Kc
-(IBAction)sliderEqKc:(id)sender{
    ModeKc.text = [NSString stringWithFormat:@"%d",_currentKC];
    UISlider *KcSlider = (UISlider *)sender;
    _currentKC = KcSlider.value;
    NSLog(@"%d", _currentKC);
}

//Method Slider Kq
-(IBAction)sliderEqKq:(id)sender{
    ModeKq.text = [NSString stringWithFormat:@"%1.1f",_currentKQ];
    UISlider *KqSlider = (UISlider *)sender;
    _currentKQ = KqSlider.value;
    NSLog(@"%1.1f", _currentKQ);
}

-(IBAction)Videoon{
    [self.csound stopCsound];
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"last" ofType:@"mp4"];
    MPMoviePlayerViewController *playerController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:moviePath]];
    [self presentMoviePlayerViewControllerAnimated:playerController];
    _myPlayer.controlStyle = MPMovieControlStyleNone;
    [playerController.moviePlayer play];
    NSLog(@"on");
}


////////////////////////////////////////////////////////////////////////////////////////////


//Method Slider Panning
-(IBAction)slPan:(id)sender{
    kPanning.text = [NSString stringWithFormat:@"%1.1f",sliderPan.value];
    UISlider *PanSlider = (UISlider *)sender;
    _currentPan = PanSlider.value;
}

//Method Slider Volume
-(IBAction)slidetheslider:(id)sender{
    volume.text = [NSString stringWithFormat:@"%1.1f",slidervolume.value];
    UISlider *ampSlider = (UISlider *)sender;
    currentValue = ampSlider.value;
}


//Method Slider Reverb
-(IBAction)slReverb:(id)sender{
    Reverb.text = [NSString stringWithFormat:@"%1.1f",sliderReverb.value];
    UISlider *reverbSlider = (UISlider *)sender;
    currentReverb = reverbSlider.value;
}


//Method Slider Harm
-(IBAction)slDur:(id)sender{
    Dur.text = [NSString stringWithFormat:@"%1.1f",sliderDur.value];
    UISlider *DurSlider = (UISlider *)sender;
    currentDur = DurSlider.value;
    
}

//Hidden status Bar
-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(IBAction) toggleOnOff:(id)component{
    UISwitch* uiswitch = (UISwitch*)component;
	NSLog(@"Status: %d", [uiswitch isOn]);
    
    if(uiswitch.on) {
        //Label Switch ON
        Switch.text= [NSString stringWithFormat:@"On"];
        
        NSString *tempFile = [[NSBundle mainBundle] pathForResource:@"IV" ofType:@"csd"];
        NSLog(@"FILE PATH: %@", tempFile);
        
		[self.csound stopCsound];
        
        self.csound = [[CsoundObj alloc] init];
        [self.csound addCompletionListener:self];
        
        [self.csound enableAccelerometer];
        [self.csound enableAttitude];
        [self.csound enableGyroscope];
        
        [self.csound startCsound:tempFile];
        [self.csound addSlider:slidervolume forChannelName:@"ampVal"];
        [self.csound addSlider:sliderReverb forChannelName:@"EffRev"];
        [self.csound addSlider:sliderDur forChannelName:@"HarmM"];
        [self.csound addSlider:sliderModeEQ forChannelName:@"EQu"];
        [self.csound addSlider:EquKv forChannelName:@"kv"];
        [self.csound addSlider:EquKv forChannelName:@"kc"];
        [self.csound addSlider:EquKq forChannelName:@"kq"];
        [self.csound addSlider:sliderPan forChannelName:@"kpan"];
        [mLevelMeter addToCsoundObj:self.csound forChannelName:@"1"];
        [mLevelMeter1 addToCsoundObj:self.csound forChannelName:@"2"];
        
	} else {
        
        //Label Switch Off
        Switch.text= [NSString stringWithFormat:@"Off"];
        
        [self.csound stopCsound];
    }
}


-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [mCsound stopCsound];
}




-(void)csoundObjComplete:(CsoundObj *)csoundObj {
    [firstswitch setOn:NO animated:YES];
}

-(void)csoundObjDidStart:(CsoundObj *)csoundObj {
}

//Sets up communication with Csound
-(void)setup:(CsoundObj* )csoundObj

{
    // NSString *ampString = @"ampVal";
    // ampChannelPtr = [csoundObj getInputChannelPtr:ampString];
    
    
    //Uptate volume to csound
    [self.csound addSlider:slidervolume forChannelName:@"ampVal"];
    
    //Uptate Reverb to csound
    [self.csound addSlider:sliderReverb forChannelName:@"EffRev"];
    
    //Uptate Harm to csound
    [self.csound addSlider:sliderDur forChannelName:@"HarmM"];
    
    //Equalizer///////////////////////////////////////////
    //Uptate Mode EQ to csound
    [self.csound addSlider:sliderModeEQ forChannelName:@"EQu"];
    //Uptate kv to csound
    [self.csound addSlider:EquKv forChannelName:@"kv"];
    //Uptate kc to csound
    [self.csound addSlider:EquKv forChannelName:@"kv"];
    //Uptate kq to csound
    [self.csound addSlider:EquKq forChannelName:@"kq"];
    
    [mLevelMeter addToCsoundObj:self.csound forChannelName:@"1"];
    [mLevelMeter1 addToCsoundObj:self.csound forChannelName:@"2"];
    [self.csound addSlider:sliderPan forChannelName:@"kpan"];
    ///////////////////////////////////////////////////////
}

-(void)updateValuesToCsound
{
}


-(void)updateValuesFromCsound
{
    //No values coming from Csound to iOS
}

-(void)cleanup
{
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
