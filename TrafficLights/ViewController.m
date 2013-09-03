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
    [self.delegate tick];
    
}

- (IBAction)didTapTickButton:(id)sender {
    
    NSNumber *lightCode = [self.delegate tick];
    [self updateLightsForCode:lightCode];
    
}

- (IBAction)didTapStopButton:(id)sender {
    [self.upRed setBackgroundColor:[UIColor redColor]];
    [self.upAmber setBackgroundColor:[UIColor blackColor]];
    [self.upGreen setBackgroundColor:[UIColor blackColor]];
    
    [self.downRed setBackgroundColor:[UIColor redColor]];
    [self.downAmber setBackgroundColor:[UIColor blackColor]];
    [self.downGreen setBackgroundColor:[UIColor blackColor]];
    
    [self.tickButton setEnabled:NO];
    [self.stopButton setEnabled:NO];
    [self.startButton setEnabled:YES];
}

#pragma mark -
#pragma mark Lights update methods

-(void)updateLightsForCode:(NSNumber *)lightsCode {
    
    [self.upRed setBackgroundColor:[UIColor blackColor]];
    [self.upAmber setBackgroundColor:[UIColor blackColor]];
    [self.upGreen setBackgroundColor:[UIColor blackColor]];
    
    [self.downRed setBackgroundColor:[UIColor blackColor]];
    [self.downAmber setBackgroundColor:[UIColor blackColor]];
    [self.downGreen setBackgroundColor:[UIColor blackColor]];
    
    int lights = [lightsCode intValue];
    
    if ((lights & 32) == 32) {
        [self.upRed setBackgroundColor:[UIColor redColor]];
    }
    
    if ((lights & 16) == 16) {
        [self.upAmber setBackgroundColor:[UIColor yellowColor]];
    }
    
    if ((lights & 8) == 8) {
        [self.upGreen setBackgroundColor:[UIColor greenColor]];
    }
    
    if ((lights & 4) == 4) {
        [self.downRed setBackgroundColor:[UIColor redColor]];
    }
    
    if ((lights & 2) == 2) {
        [self.downAmber setBackgroundColor:[UIColor yellowColor]];
    }
    
    if ((lights & 1) == 1) {
        [self.downGreen setBackgroundColor:[UIColor greenColor]];
    }
    
}

@end
