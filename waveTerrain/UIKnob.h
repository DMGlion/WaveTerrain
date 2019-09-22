//
//  UIKnob.h
//  waveTerrain
//
//  Created by David Moya on 20/01/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import "CsoundValueCacheable.h"

@interface UIKnob : UIControl <CsoundValueCacheable>
{
    Float32 value;
    Float32 defaultValue;
    Float32 minimumValue;
    Float32 maximumValue;
	
	// Value Cacheable
	BOOL mCacheDirty;
	float cachedValue;
    float* channelPtr;
}

@property (assign) BOOL cacheDirty;
@property (nonatomic, readwrite, setter = setValue:) Float32 value;
@property (nonatomic, readwrite) Float32 defaultValue;
@property (nonatomic, readwrite) Float32 minimumValue;
@property (nonatomic, readwrite) Float32 maximumValue;

@end
