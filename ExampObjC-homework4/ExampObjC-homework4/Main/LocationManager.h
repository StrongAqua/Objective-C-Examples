//
//  LocationManager.h
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import <Foundation/Foundation.h>
#import "CoreLocation/CoreLocation.h"

@protocol LocationManagerDelegate

-(void)onLocationUpdate:(CLLocation*_Nullable) location;

@end

@interface LocationManager : NSObject

@property(weak, nonatomic, nullable) id<LocationManagerDelegate> delegate;

-(void)start;
-(void)stop;

@end

