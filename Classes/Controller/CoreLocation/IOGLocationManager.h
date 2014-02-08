//
//  IOGLocationController.h
//  Pods
//
//  Created by Vincil Bishop on 1/8/14.
//
//

#import <Foundation/Foundation.h>
#import "IOGBlocks.h"

#define kIOGLocationManager_DidUpdateLocations_Notification @"kIOGLocationManager_DidUpdateLocations_Notification "

#define kIOGLocationManager_DidRangeBeaconsInRegion_Notification @"kIOGLocationManager_DidRangeBeaconsInRegion_Notification"

@interface IOGLocationManager : CLLocationManager<CLLocationManagerDelegate>

@property (nonatomic,strong) NSArray *locations;
@property (nonatomic,strong) NSDictionary *beacons;

@property (nonatomic,strong) CLLocation *mockLocation;

- (CLLocation*) lastLocation;

+ (IOGLocationManager*) sharedManager;

- (void) getLocationAndStopWithCompletion:(IOGCompletionBlock)completionBlock;

- (void) getBeaconsAndStopInRegion:(CLBeaconRegion*)region completion:(IOGCompletionBlock)completionBlock;

@end
