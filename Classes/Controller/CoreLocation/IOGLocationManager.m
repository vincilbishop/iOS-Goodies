//
//  IOGLocationController.m
//  Pods
//
//  Created by Vincil Bishop on 1/8/14.
//
//

#import "IOGLocationManager.h"


@implementation IOGLocationManager

static IOGLocationManager *_sharedManager;

+ (IOGLocationManager*) sharedManager
{
    if (!_sharedManager) {
        _sharedManager = [[IOGLocationManager alloc] init];
    }
    
    return _sharedManager;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

#pragma mark - Location Convenience Methods -

- (void) getLocationAndStopWithCompletion:(IOGCompletionBlock)completionBlock
{
    id observer = nil;
    observer = [[NSNotificationCenter defaultCenter] addObserverForName:kIOGLocationManager_DidUpdateLocations_Notification object:observer queue:[[NSOperationQueue alloc] init] usingBlock:^(NSNotification *note) {
        
        // TODO: Make a check for manager instance, date, sanity, etc.
        completionBlock(self,YES,nil,self.location);
        
        [self stopMonitoringSignificantLocationChanges];
        
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }];
    
    [self startMonitoringSignificantLocationChanges];
}

#pragma mark - Beacon Convenience Methods -

- (void) getBeaconsAndStopInRegion:(CLBeaconRegion*)region completion:(IOGCompletionBlock)completionBlock
{
    id observer = nil;
    observer = [[NSNotificationCenter defaultCenter] addObserverForName:kIOGLocationManager_DidRangeBeaconsInRegion_Notification object:observer queue:[[NSOperationQueue alloc] init] usingBlock:^(NSNotification *note) {
        
        // TODO: Make a check for manager instance, date, sanity, etc.
        // Make sure that this is the right call for the beacon region we were monitoring...
        if (completionBlock) {
            completionBlock(self,YES,nil,self.beacons);
        }
        
        [self stopRangingBeaconsInRegion:region];
        
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }];
    
    [self startRangingBeaconsInRegion:region];

}

#pragma mark - Location Information -

- (CLLocation*) lastLocation
{
    // TODO: Uncomment the following line when we are ready for real locations
    //return [self.locations lastObject];
    
    // +37.78735890,-122.40822700
    if (self.mockLocation) {
        return self.mockLocation;
    } else {
        return [self.locations lastObject];
    }
//    CLLocation *mockLocation = [[CLLocation alloc] initWithLatitude:37.78735890 longitude:-122.40822700];
//    
//    return mockLocation;
}

#pragma mark - CLLocationManagerDelegate Locations -

/*
 *  locationManager:didRangeBeacons:inRegion:
 *
 *  Discussion:
 *    Invoked when a new set of beacons are available in the specified region.
 *    beacons is an array of CLBeacon objects.
 *    If beacons is empty, it may be assumed no beacons that match the specified region are nearby.
 *    Similarly if a specific beacon no longer appears in beacons, it may be assumed the beacon is no longer received
 *    by the device.
 */
- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    NSMutableDictionary *newBeacons = [self.beacons mutableCopy];
    
    [newBeacons setObject:beacons forKey:region];
    
    self.beacons = newBeacons;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kIOGLocationManager_DidRangeBeaconsInRegion_Notification object:self userInfo:@{@"locationManager":manager,@"beacons":beacons,@"region":region}];
    
    // TODO: add a flag here so that when starting location updates, one can choose whether to only update location once, or continually monitor locations as the user moves....
    [manager stopRangingBeaconsInRegion:region];
}

#pragma mark - CLLocationManagerDelegate Locations -

/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    self.locations = locations;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kIOGLocationManager_DidUpdateLocations_Notification object:self userInfo:@{@"locationManager":manager,@"locations":locations}];
    
    // TODO: add a flag here so that when starting location updates, one can choose whether to only update location once, or continually monitor locations as the user moves....
    [manager stopUpdatingLocation];
}

/*
 *  locationManager:rangingBeaconsDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when an error has occurred ranging beacons in a region. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region
              withError:(NSError *)error
{}

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region
{}

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region
{}

/*
 *  locationManager:didFailWithError:
 *
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    DDLogVerbose(@"error: %@", error);
}



@end
