//
//  ViewController.m
//  TrafficLights
//
//  Created by Tim on 29/08/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *upRed;
@property (weak, nonatomic) IBOutlet UIView *upAmber;
@property (weak, nonatomic) IBOutlet UIView *upGreen;
@property (weak, nonatomic) IBOutlet UIView *downRed;
@property (weak, nonatomic) IBOutlet UIView *downAmber;
@property (weak, nonatomic) IBOutlet UIView *downGreen;

@property (weak, nonatomic) IBOutlet UIImageView *stopImageview;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *tickButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

@property (nonatomic, strong) NSArray *upLights;
@property (nonatomic, strong) NSArray *downLights;

@end

@implementation ViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setup initial state of lights
    self.upLights = @[self.upRed, self.upAmber, self.upGreen];
    self.downLights = @[self.downRed, self.downAmber, self.downGreen];
    
    for (UIView *light in self.upLights) {
        [light setBackgroundColor:[UIColor blackColor]];
    }
    
    for (UIView *light in self.downLights) {
        [light setBackgroundColor:[UIColor blackColor]];
    }

    [self.tickButton setEnabled:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma Button methods

- (IBAction)didTapStartButton:(id)sender {
    [self.upRed setBackgroundColor:[UIColor redColor]];
    [self.downRed setBackgroundColor:[UIColor redColor]];
    
    [self.tickButton setEnabled:YES];
    [self.startButton setEnabled:NO];
    
}

- (IBAction)didTapTickButton:(id)sender {
    [self.delegate tick];
}

- (IBAction)didTapStopButton:(id)sender {
}

@end
