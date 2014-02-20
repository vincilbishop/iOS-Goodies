//
//  IOGPeripheralManager.m
//  Pods
//
//  Created by Vincil Bishop on 2/7/14.
//
//

#import "IOGPeripheralManager.h"

@implementation IOGPeripheralManager

static IOGPeripheralManager *_sharedManager;

+ (IOGPeripheralManager*) sharedManager
{
    if (!_sharedManager) {
        
        _sharedManager = [[IOGPeripheralManager alloc] init];
    }
    
    return _sharedManager;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        
        _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)];
    }
    
    return self;
}

#pragma mark - Convenience Methods -

- (void) startAdvertisingWithRegion:(CLBeaconRegion*)beaconRegion
                         completion:(IOGCompletionBlock)completionBlock;
{
    NSDictionary *beaconPeripheralData = [beaconRegion peripheralDataWithMeasuredPower:nil];
    
    if (self.peripheralManager.state == CBPeripheralManagerStatePoweredOn) {
        
        [self.peripheralManager startAdvertising:beaconPeripheralData];
        
        if (completionBlock) {
            completionBlock(self,YES,nil,self);
        }
    } else {
        
        __block id observer = nil;
        observer = [[NSNotificationCenter defaultCenter] addObserverForName:kIOGPeripheralManager_DidUpdateState_Notification object:observer queue:[[NSOperationQueue alloc] init] usingBlock:^(NSNotification *note) {
            
            if (self.peripheralManager.state == CBPeripheralManagerStatePoweredOn) {
                
                DDLogVerbose(@"Powered On");
                [self.peripheralManager startAdvertising:beaconPeripheralData];
                
                [[NSNotificationCenter defaultCenter] removeObserver:observer];
                
                if (completionBlock) {
                    completionBlock(self,YES,nil,self);
                }
            }
            else if (self.peripheralManager.state == CBPeripheralManagerStatePoweredOff)
            {
                [self.peripheralManager stopAdvertising];
                
                [[NSNotificationCenter defaultCenter] removeObserver:observer];
                
                if (completionBlock) {
                    completionBlock(self,NO,nil,self);
                }
            }
        }];
    }
}

#pragma mark - CBPeripheralManagerDelegate -

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kIOGPeripheralManager_DidUpdateState_Notification object:peripheral];
}

@end
