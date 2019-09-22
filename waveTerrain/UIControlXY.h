//
//  UIControlXY.h
//  waveTerrain
//
//  Created by David Moya on 14/01/2014.
//  Copyright (c) 2014 David Moya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CsoundObj.h"
#import "CsoundValueCacheable.h"

@interface UIControlXY : UIControl <CsoundValueCacheable>
{
    Float32 xValue, yValue;
    CGRect circleRect;
    CGFloat circleDiameter;
	
	// Value Cacheable
	BOOL mCacheDirty;
	float cachedValueX, cachedValueY;
    float *channelPtrX, *channelPtrY;
}

@property (assign) BOOL cacheDirty;
@property (nonatomic, readwrite, setter = setXValue:) Float32 xValue;
@property (nonatomic, readwrite, setter = setYValue:) Float32 yValue;
@property (nonatomic, readwrite, setter = setCircleDiameter:) CGFloat circleDiameter;

@end
