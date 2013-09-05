//
//  Created by Tim on 29/08/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "Kiwi.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "LightEngine.h"

@interface ViewController (UITests)
@property (nonatomic, weak) id delegate;
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
@end

SPEC_BEGIN(UITests)

describe(@"The user interface", ^{

    __block ViewController *vc = nil;
    
    beforeAll(^{
    });
    
    beforeEach(^{
        vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        [vc view];
    });
    
    context(@"when instantiated", ^{

        it(@"should have a delegate property", ^{
            [[vc should] respondToSelector:@selector(delegate)];
        });
        
        it(@"should have the delegate set", ^{
            AppDelegate *appDelegate = [[AppDelegate alloc] init];
            [appDelegate application:nil didFinishLaunchingWithOptions:nil];
            [[(NSObject *)appDelegate.viewController.delegate should] conformToProtocol:@protocol(LightEngineProtocol)];
        });

    });
    
    context(@"when in the default state", ^{
        
        it(@"should show all lights as black", ^{
            [[vc.upRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            
            [[vc.downRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show the tick and stop buttons as greyed out", ^{
            [[vc.tickButton.titleLabel.textColor shouldNot] equal:[UIColor blackColor]];
            [[vc.stopButton.titleLabel.textColor shouldNot] equal:[UIColor blackColor]];
        });
        
        it(@"should show the start button as active", ^{
            [[vc.startButton.titleLabel.textColor should] equal:[UIColor blackColor]];
        });
        
        afterEach(^{
        });
        
        afterAll(^{
        });
        
    });
    
    context(@"when responding to user input", ^{
        
        it(@"should lock the 'tick' button until the start button has been tapped", ^{
            [[theValue(vc.tickButton.enabled) should] equal:theValue(NO)];
            [vc didTapStartButton:nil];
            [[theValue(vc.tickButton.enabled) should] equal:theValue(YES)];
        });

        it(@"should unlock the 'stop' button after the start button has been tapped", ^{
            [[theValue(vc.stopButton.enabled) should] equal:theValue(NO)];
            [vc didTapStartButton:nil];
            [[theValue(vc.stopButton.enabled) should] equal:theValue(YES)];
        });
        
        it(@"should show the stop and tick buttons as active after the start button has been tapped", ^{
            [vc didTapStartButton:nil];
            [[vc.stopButton.titleLabel.textColor should] equal:[UIColor blackColor]];
            [[vc.tickButton.titleLabel.textColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should show the start button as inactive after the start button has been tapped", ^{
            [vc didTapStartButton:nil];
            [[vc.startButton.titleLabel.textColor shouldNot] equal:[UIColor blackColor]];
        });
        
       it(@"should turn both red lights on in response to the start button", ^{
           [vc didTapStartButton:nil];
           [[vc.upRed.backgroundColor should] equal:[UIColor redColor]];
           [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
           [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
           
           [[vc.downRed.backgroundColor should] equal:[UIColor redColor]];
           [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
           [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
       });
        
        it(@"should show the tick button as active after each tick", ^{
            [vc didTapStartButton:nil];
            [[vc.tickButton.titleLabel.textColor should] equal:[UIColor blackColor]];
            [vc didTapTickButton:nil];
            [[vc.tickButton.titleLabel.textColor should] equal:[UIColor blackColor]];
        });
        
        it(@"should send a 'tick' message to the delegate when the Tick button is tapped", ^{
            id delegateMock = [KWMock mockForProtocol:@protocol(LightEngineProtocol)];
            [[delegateMock should] conformToProtocol:@protocol(LightEngineProtocol)];
            [vc setDelegate:delegateMock];
            [[delegateMock should] receive:@selector(tick) andReturn:@164];
            [vc didTapTickButton:nil];
        });
        
        describe(@"and handling stop button interaction", ^{
            
            beforeEach(^{
                [vc didTapStartButton:nil];
                [[theValue(vc.tickButton.enabled) should] beTrue];
                [[theValue(vc.stopButton.enabled) should] beTrue];
                
                [vc didTapStopButton:nil];
            });
        
            it(@"should turn all lights black in response to the stop button", ^{
                [[vc.upRed.backgroundColor should] equal:[UIColor blackColor]];
                [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
                [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
                
                [[vc.downRed.backgroundColor should] equal:[UIColor blackColor]];
                [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
                [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
            });

            it(@"should lock the tick and stop buttons after tapping the stop button", ^{
                [[theValue(vc.tickButton.enabled) should] beFalse];
                [[theValue(vc.stopButton.enabled) should] beFalse];
            });
            
            it(@"should unlock the start button after tapping the stop button", ^{
                [[theValue(vc.startButton.enabled) should] beTrue];
            });
            
            it(@"should show the tick and stop buttons as inactive", ^{
                [[vc.tickButton.titleLabel.textColor shouldNot] equal:[UIColor blackColor]];
                [[vc.stopButton.titleLabel.textColor shouldNot] equal:[UIColor blackColor]];
            });
            
            it(@"should show the start button as active", ^{
                [[vc.startButton.titleLabel.textColor should] equal:[UIColor blackColor]];
            });
            
            it(@"should send the stopSequence message to the delegate when tapping the stop button", ^{
                id delegateMock = [KWMock mockForProtocol:@protocol(LightEngineProtocol)];
                [[delegateMock should] conformToProtocol:@protocol(LightEngineProtocol)];
                [vc setDelegate:delegateMock];
                [[delegateMock should] receive:@selector(stopSequence)];
                [vc didTapStopButton:nil];
            });

        });

    });
    
});

SPEC_END