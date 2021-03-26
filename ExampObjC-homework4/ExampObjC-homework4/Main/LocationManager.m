//
//  LocationManager.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import "LocationManager.h"
#import "CoreLocation/CoreLocation.h"

@interface LocationManager() <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation LocationManager

- (instancetype)init {
    self = [super init];
    if (self) {
        if ([CLLocationManager locationServicesEnabled]) {
            self.manager = [CLLocationManager new];
            self.manager.delegate = self;
            self.manager.desiredAccuracy = kCLLocationAccuracyKilometer;
            self.manager.distanceFilter = 500;
            [self.manager requestWhenInUseAuthorization];
        } else {
            NSLog(@"ERROR: Location services are not accessible");
        }
        
    }
    return self;
}

#pragma mark - Public

-(void)start {
    [self.manager startUpdatingLocation];
}

-(void)stop {
    [self.manager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

// Wait for location callbacks
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations firstObject];
    if (location) {
        [self.delegate onLocationUpdate:location];
    }
}

-(void)locationManager:(CLLocationManager *)manager
didFinishDeferredUpdatesWithError:(NSError *)error{
    NSLog(@"Error with Updating");
}

-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    //Failed to recieve user's location
    NSLog(@"failed to recived user's location");
}


@end
