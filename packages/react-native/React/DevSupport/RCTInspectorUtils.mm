/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RCTInspectorUtils.h"

#import <React/RCTConstants.h>
#import <React/RCTVersion.h>
#import <UIKit/UIKit.h>

@implementation CommonHostMetadata
@end

@implementation RCTInspectorUtils

+ (CommonHostMetadata *)getHostMetadata
{
  UIDevice *device = [UIDevice currentDevice];
  auto version = RCTGetReactNativeVersion();

  CommonHostMetadata *metadata = [[CommonHostMetadata alloc] init];

  metadata.appDisplayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
  metadata.appIdentifier = [[NSBundle mainBundle] bundleIdentifier];
  metadata.platform = RCTPlatformName;
  metadata.deviceName = [device name];
  metadata.reactNativeVersion = [NSString stringWithFormat:@"%i.%i.%i%@",
                                                           [version[@"major"] intValue],
                                                           [version[@"minor"] intValue],
                                                           [version[@"patch"] intValue],
                                                           [version[@"prerelease"] isKindOfClass:[NSNull class]]
                                                               ? @""
                                                               : [@"-" stringByAppendingString:version[@"prerelease"]]];

  return metadata;
}

@end
