//
//  ViewController.m
//  Force Touch Demo
//
//  Created by Nolan Brown on 9/27/15.
//  Copyright © 2015 Paraset LLC. All rights reserved.
//

#import "ViewController.h"
#import "PSForceTouchGestureRecognizer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PSForceTouchGestureRecognizer *gesture = [[PSForceTouchGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(forceTouch:)];
    gesture.minimumForce = 0.8;

    [self.view addGestureRecognizer:gesture];
    
}


- (void) forceTouch: (PSForceTouchGestureRecognizer *) gesture
{
    if(gesture.state == UIGestureRecognizerStateChanged) {
        self.forceLabel.text = [NSString stringWithFormat:@"%f",gesture.currentForce];
    }
    else if(gesture.state == UIGestureRecognizerStateEnded) {
        self.forceLabel.text = @"Ended";
    }
    else if(gesture.state == UIGestureRecognizerStateCancelled) {
        self.forceLabel.text = @"0.0";

    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
