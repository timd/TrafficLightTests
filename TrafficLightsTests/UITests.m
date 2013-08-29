#import "Kiwi.h"
#import "ViewController.h"

@interface ViewController (UITests)
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
@end

SPEC_BEGIN(UITests)

describe(@"The user interface", ^{
    
    context(@"when in the default state", ^{
        
        __block ViewController *vc = nil;
        
        beforeAll(^{
        });
        
        beforeEach(^{
            vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
            [vc view];
        });
        
        it(@"should show all lights as black", ^{
            [[vc.upRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.upGreen.backgroundColor should] equal:[UIColor blackColor]];
            
            [[vc.downRed.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downAmber.backgroundColor should] equal:[UIColor blackColor]];
            [[vc.downGreen.backgroundColor should] equal:[UIColor blackColor]];
        });
        
        afterEach(^{
        });
        
        afterAll(^{
        });
        
    });
    
});

SPEC_END