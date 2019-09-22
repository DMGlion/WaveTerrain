//
//  AppDelegate.h
//  waveTerrain
//
//  Created by David Moya on 02/11/2013.
//  Copyright (c) 2013 David Moya. All rights reserved.
//

#import "CsoundObj.h"
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    CsoundObj* mCsound;
}

@property (strong, nonatomic) CsoundObj* csound;
@property (strong, nonatomic) UIWindow *window;

@end
