#import "Kiwi.h"

SPEC_BEGIN(BaseKiwiTests)

describe(@"When testing the traffic lights", ^{
    
    it(@"should run a Kiwi test correctly", ^{
        
        [[theValue(YES) should] equal:theValue(YES)];
        
    });
    
});

SPEC_END