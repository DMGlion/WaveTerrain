//
//  LevelMeterView2.h
//  waveTerrain
//
//  Created by David Moya on 02/02/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CsoundObj.h"
#import "CsoundValueCacheable.h"

@interface LevelMeterView2 : UIView <CsoundValueCacheable>

{
	BOOL mCacheDirty;
	float cachedValue;
    float* channelPtr;
    NSString* mChannelName;
	CGFloat lastY;
	NSInteger ksmps, sr;
}

@property (assign) BOOL cacheDirty;
@property (nonatomic, strong) NSString *channelName;

- (void)addToCsoundObj:(CsoundObj *)csoundObj forChannelName:(NSString *)channelName;

@end
