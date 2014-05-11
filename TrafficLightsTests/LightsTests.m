//
//  Created by Tim on 29/08/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "Kiwi.h"

#import "LightEngine.h"
#import "ViewController.h"

@interface ViewController (LightsTests)
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
- (IBAction)didTapStartButton:(id)sender;
- (IBAction)didTapTickButton:(id)sender;
- (IBAction)didTapStopButton:(id)sender;
- (void)updateLightsForCode:(NSNumber *)lightCode;
@property (nonatomic, strong) LightEngine *lightEngine;
@end

SPEC_BEGIN(LightsTests)

describe(@"The traffic lights", ^{
    
    __block ViewController *vc = nil;
    __block LightEngine *lightEngine = nil;
    
    beforeEach(^{
        vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        lightEngine = [[LightEngine alloc] init];
        [vc setDelegate:lightEngine];
        [vc view];
        [[vc.view shouldNot] beNil];
    });
    
    context(@"when working through the sequence", ^{
        
        it(@"should respond to the updateLightsForCode: method", ^{
            [[vc should] respondToSelector:@selector(updateLightsForCode:)];
        });
        
        it(@"should show Rxx Rxx when sent the @164 code", ^{
            [vc updateLightsForCode:@164];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show RAx Rxx when sent the @180 code", ^{
            [vc updateLightsForCode:@180];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor yellowColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show xxG Rxx when sent the @140 code", ^{
            [vc updateLightsForCode:@140];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor greenColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show xAx Rxx when sent the @148 code", ^{
            [vc updateLightsForCode:@148];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor yellowColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show Rxx Rxx when sent the @100 code", ^{
            [vc updateLightsForCode:@100];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show Rxx RAx when sent the @102 code", ^{
            [vc updateLightsForCode:@102];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor yellowColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show Rxx xxG when sent the @97 code", ^{
            [vc updateLightsForCode:@97];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor greenColor]];
        });
        
        it(@"should show Rxx xAx when sent the @98 code", ^{
            [vc updateLightsForCode:@98];
            
            [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor yellowColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
    });
    
    context(@"When working through the sequence with the UI", ^{
        
        it(@"should update the lights to RAx Rxx after a first tick", ^{
            
            [[[vc.upRed backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
            
            [[[vc.downRed backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
            
            [vc didTapStartButton:nil];
            
            [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
            [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
            
            [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
            [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
            
            [vc didTapTickButton:nil];
            
            [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
            [[[vc.upAmber backgroundColor] should] equal:[UIColor yellowColor]];
            [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
            
            [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
            [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
            [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
            
        });

        it(@"should run through the whole sequence correctly", ^{
            
            [vc didTapStartButton:nil];
            
            // Run through the whole sequence 5 times
            
            for(int count=0; count < 25; count++) {
                
                // RYB RBB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor yellowColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                // BBG RBB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor greenColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                // BYB RBB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor yellowColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                // RBB RBB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                // RBB RYB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor yellowColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                // RBB BBG
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor greenColor]];
                
                // RBB BYB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor yellowColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                // RBB RBB
                [vc didTapTickButton:nil];
                
                [[[vc.upRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.upAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.upGreen backgroundColor] should] equal:[UIColor blackColor]];
                
                [[[vc.downRed backgroundColor] should] equal:[UIColor redColor]];
                [[[vc.downAmber backgroundColor] should] equal:[UIColor blackColor]];
                [[[vc.downGreen backgroundColor] should] equal:[UIColor blackColor]];
                
            }
            
        });
        
    });
    
    afterEach(^{
        vc = nil;
    });
    
});

SPEC_END