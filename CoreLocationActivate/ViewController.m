//
//  ViewController.m
//  CoreLocationActivate
//
//  Created by Noriaki Misawa on 2015/01/19.
//  Copyright (c) 2015年 MISAWA.NET. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CLLocationManager *lm = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        lm.delegate = self;
        lm.distanceFilter = kCLDistanceFilterNone;
        lm.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    if ([lm respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [lm requestWhenInUseAuthorization];
    } else {
        [lm startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
}

- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog( @"%s", __func__ );
}

@end
