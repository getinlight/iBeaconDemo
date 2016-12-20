//
//  ViewController.m
//  iBeaconDemo
//
//  Created by getinlight on 16/12/17.
//  Copyright © 2016年 getinlight. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLBeaconRegion *beaconRegion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:@"此处填入UUID"] major:10046 minor:11053 identifier:@"BrtBeacon"];
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestStateForRegion:self.beaconRegion];
    
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(nonnull CLRegion *)region {
    NSLog(@"%s", __func__);
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"%s", __func__);
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(nullable CLRegion *)region withError:(nonnull NSError *)error {
    NSLog(@"%s", __func__);
    NSLog(@"%@", error.localizedDescription);
}


- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(nonnull NSArray<CLBeacon *> *)beacons inRegion:(nonnull CLBeaconRegion *)region {
    for (CLBeacon *beacon in beacons) {
        NSLog(@"%@", beacon);
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(nonnull CLBeaconRegion *)region withError:(nonnull NSError *)error {
    NSLog(@"%s", __func__);
}


@end
