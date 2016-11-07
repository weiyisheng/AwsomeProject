//
//  SnapShotViewManager.m
//  AwesomeProject
//
//  Created by gemini on 11/1/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RCTSnapShotViewManager.h"

#import "RCTSnapShotView.h"

@implementation RCTSnapShotViewManager

- (UIView *)view
{
  return [[RCTSnapShotView alloc] init];
}

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(shotNumber, int)

RCT_EXPORT_VIEW_PROPERTY(fileName, NSString)

RCT_EXPORT_VIEW_PROPERTY(onShoted, RCTDirectEventBlock)

@end
