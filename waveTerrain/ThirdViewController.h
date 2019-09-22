//
//  ThirdViewController.h
//  waveTerrain
//
//  Created by David Moya on 07/01/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CsoundObj.h"
#import "CsoundValueCacheable.h"
#import "UIImageViewSelect.h"
#import "Imagetrack.h"
#import "UIKnob.h"
#import "UIKnobPitchR.h"
#import "UIControlXY.h"
#import "UIKnobVolume.h"
#import "LevelMeterView.h"
#import "LevelMeterView1.h"

NSString *blue1;
NSString *green1;
NSString *red1;
NSString *alpha1;
NSString *xone;
NSString *yone;
NSString *Vxone;
NSString *Vyone;

@interface ThirdViewController : UIViewController<CsoundObjCompletionListener, CsoundValueCacheable,AVAudioPlayerDelegate>
{
    IBOutlet UIControlXY	*mXYControl;
    IBOutlet Imagetrack     *RGBAControl,*XYpControl,*VXYpControl, *ImageValue;
    IBOutlet UIView *ViewImages;    
    IBOutlet UIView *viewEff1;
    IBOutlet UIView *viewEff2;
    
    //Declaration View Popups///////////
    IBOutlet UIView *PopReverb;
    IBOutlet UIView *PopFtables;
    IBOutlet UIView *PopVolumeC;
    IBOutlet UIView *PopVariableG;
    IBOutlet UIView *PopImage;
    IBOutlet UIView *PopImageSel;
    IBOutlet UIView *ViewSwitchHiddePop;
    /////////////////////////////////////
    
    //Level Meters Outlet
    IBOutlet LevelMeterView *mLevelMeter;
    IBOutlet LevelMeterView1 *mLevelMeter1;
    ////////////////////
    
    
    IBOutlet UISwitch *firstswitch;
}

-(IBAction)Images1;
-(IBAction)Images2;
-(IBAction)Images3;
-(IBAction)Images4;
-(IBAction)Images5;
-(IBAction)Images6;
-(IBAction)Images7;
-(IBAction)Images8;
-(IBAction)Images9;
-(IBAction)Images10;


//////////Declaration action Buttons///////
-(IBAction)ShowPopups;
-(IBAction)HiddePopups;
///////////////////////////////////////////



-(IBAction)Eff1onoff:(id)component;



- (IBAction)changeReverb:(UIKnob *)sender;
- (IBAction)changePitchReverb:(UIKnobPitchR *)sender;
- (IBAction)changeVolume:(UIKnobVolume *)sender;

@property (nonatomic) IBOutlet UIImageView *ToggleImage;

@property (nonatomic) IBOutlet UIImageView *imageselct;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrolView;

@property (weak, nonatomic)	IBOutlet UIKnob *ReverbKnob;

@property (weak, nonatomic)	IBOutlet UIKnobPitchR *ReverpitchKnob;

@property (weak, nonatomic)	IBOutlet UIKnobVolume *VolumeKnob;


//////////Label Volume///////////////////////////////////
@property (weak, nonatomic)	IBOutlet UILabel *mPitchLabel;

//////////Label Reverb///////////////////////////////////
@property (weak, nonatomic)	IBOutlet UILabel *mSizeRoom;
@property (weak, nonatomic)	IBOutlet UILabel *mCutOff;


@property (nonatomic, retain) CsoundObj* csound;


@property (nonatomic,retain) IBOutlet UILabel *switchLabel;
@property (nonatomic,retain) IBOutlet UISwitch *toggleSwitch;


@end
