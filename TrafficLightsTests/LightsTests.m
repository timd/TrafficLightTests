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
@end

SPEC_BEGIN(LightsTests)

describe(@"The traffic lights", ^{

    __block ViewController *vc = nil;
    
    beforeEach(^{
        vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        [vc view];
        [[vc.view shouldNot] beNil];
    });

    context(@"when working through the sequence", ^{
        
        
        
    });

    afterEach(^{
        vc = nil;
    });

});

SPEC_END