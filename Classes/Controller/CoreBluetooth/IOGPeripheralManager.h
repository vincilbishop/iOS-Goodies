//
//  IOGPeripheralManager.h
//  Pods
//
//  Created by Vincil Bishop on 2/7/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import "IOGBlocks.h"

#define kIOGPeripheralManager_DidUpdateState_Notification @"kIOGPeripheralManager_DidUpdateState_Notification"

@interface IOGPeripheralManager : NSObject<CBPeripheralManagerDelegate>

@property (nonatomic,strong) CBPeripheralManager *peripheralManager;

+ (IOGPeripheralManager*) sharedManager;

- (void) startAdvertisingWithRegion:(CLBeaconRegion*)beaconRegion completion:(IOGCompletionBlock)completionBlock;

@end
