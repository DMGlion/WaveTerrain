//
//  infwtts.h
//  waveTerrain
//
//  Created by David Moya on 12/11/2013.
//  Copyright (c) 2013 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>

@interface infwtts : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//Was the button to go back
-(IBAction)back;

@property(nonatomic, readonly) MPMoviePlayerController *myPlayer;
//Web Page View

@end
