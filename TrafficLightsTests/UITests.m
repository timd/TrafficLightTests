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
        
        beforeAll(^{
        });
        
        beforeEach(^{
            
        });
        
        it(@"should show all lights as black", ^{
        });
        
        afterEach(^{
        });
        
        afterAll(^{
        });
        
    });
    
});

SPEC_END