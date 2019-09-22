//
//  FirstViewController.h
//  waveTerrain
//
//  Created by David Moya on 02/11/2013.
//  Copyright (c) 2013 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CsoundObj.h"
#import "CsoundValueCacheable.h"
#import "LevelMeterView.h"
#import "LevelMeterView1.h"
#import <MediaPlayer/MediaPlayer.h>


@interface FirstViewController : UIViewController<CsoundObjCompletionListener,AVAudioPlayerDelegate>
{

    
    
    
 IBOutlet UISwitch *firstswitch;
 IBOutlet UISlider *slidervolume;
 IBOutlet UISlider *sliderReverb;
 IBOutlet UISlider *sliderDur;
 IBOutlet UISlider *sliderPan;
 

 //Equalizer
 IBOutlet UISlider *sliderModeEQ;
 IBOutlet UISlider *EquKv;
 IBOutlet UISlider *EquKc;
 IBOutlet UISlider *EquKq;
    
 IBOutlet UILabel *volume;
 IBOutlet UILabel *Switch;
 IBOutlet UILabel *Reverb;
 IBOutlet UILabel *Dur;
    
 //Panning Label
 IBOutlet UILabel *kPanning;
    
 //Mode EQ
 IBOutlet UILabel *ModeEQ;
 IBOutlet UILabel *ModeKv;
 IBOutlet UILabel *ModeKc;
 IBOutlet UILabel *ModeKq;
 
 //View
 IBOutlet UIView *viewEqualizer;
    
 //Level Meters Outlet
 IBOutlet LevelMeterView *mLevelMeter;
 IBOutlet LevelMeterView1 *mLevelMeter1;
    
}

-(IBAction)toggleOnOff:(id)component;
-(IBAction)slidetheslider:(id)sender;
-(IBAction)slReverb:(id)sender;
-(IBAction)slDur:(id)sender;
-(IBAction)slPan:(id)sender;


//Equalizer Mode
-(IBAction)slModeEQ:(id)sender;
-(IBAction)sliderEqKv:(id)sender;
-(IBAction)sliderEqKc:(id)sender;
-(IBAction)sliderEqKq:(id)sender;

//Hidden and Show Equalizer View
-(IBAction)DisplayEqualizer;
-(IBAction)HiddenEqualizer;

//Play Video tutorial
-(IBAction)Videoon;
//Declare a Csound object
@property (nonatomic, retain) CsoundObj* csound;
@property(nonatomic, readonly) MPMoviePlayerController *myPlayer;



@end
