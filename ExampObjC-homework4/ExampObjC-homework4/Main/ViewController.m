//
//  ViewController.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"
#import "LocationManager.h"

@interface ViewController() <MKMapViewDelegate, LocationManagerDelegate>

@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, strong) LocationManager *locationManager;
@property (nonatomic, strong) MKPointAnnotation *myLocation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Map Example";
    [self.view setBackgroundColor: [UIColor redColor]];
    
    MKMapView *map = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = map;
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"Somewhere";
    annotation.subtitle = @"I don't know what the place is it";
    annotation.coordinate = CLLocationCoordinate2DMake(59.95578270, 30.34748660);
    [_mapView addAnnotation:annotation];
    
    [self.view addSubview:self.mapView];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:59.95589530 longitude:30.34734860];
    [self addressFromLocation:location];
    [self locationFromAddress:@"Sankt-Petersburg, Clinical Street 4"];
    
    self.locationManager = [LocationManager new];
    self.locationManager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.locationManager start];
}

- (void)viewWDidDisappear:(BOOL)animated {
    [self.locationManager stop];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identifier = @"MarkerIdentifier";
    
    MKMarkerAnnotationView *annotationView =
        (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)addressFromLocation:(CLLocation *)location {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        if ([placemarks count] <= 0) return;

        for (MKPlacemark *placemark in placemarks) {
            NSLog(@"[Location2Address]: %@", placemark.name);
        }
    }];
}

- (void)locationFromAddress:(NSString *)address {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address
                 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        if ([placemarks count] <= 0) return;
        
        for (MKPlacemark *placemark in placemarks) {
            NSLog(@"[Address2Location]: %@", placemark.location);
        }
    }];
}

#pragma mark - LocationManagerDelegate

-(void)onLocationUpdate:(CLLocation*) location
{
    if (self.myLocation == NULL) {
        self.myLocation = [[MKPointAnnotation alloc] init];
        self.myLocation.title = @"It's ME!";
    }
    self.myLocation.coordinate = location.coordinate;
    [self.mapView addAnnotation:self.myLocation];
    NSLog(@"[Location Update]: %@", location);
}

@end
