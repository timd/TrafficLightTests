#import "Kiwi.h"
#import "LightEngine.h"

SPEC_BEGIN(ModelTests)

describe(@"The model", ^{

    __block LightEngine *engine = nil;
    
    beforeAll(^{
    });
    
    beforeEach(^{
        engine = [[LightEngine alloc] init];
    });

    context(@"when instantiated", ^{
        
        it(@"should exist", ^{
            [[engine shouldNot] beNil];
        });
        
        it(@"should respond to the 'tick' message", ^{
            [[engine should] respondToSelector:@selector(tick)];
        });
        
        it(@"should return an NSNumber in response to a 'tick' message", ^{
            id result = [engine tick];
            [[result should] beKindOfClass:[NSNumber class]];
        });
        
    });
    
    context(@"When ticking", ^{
        
        it(@"should return @164 in response to the first tick", ^{
            NSNumber *result = [engine tick];
            [[result should] equal:@164];
        });

        it(@"should return @180 in response to the second tick", ^{
            [engine tick];
            NSNumber *secondResult = [engine tick];
            [[secondResult should] equal:@180];
        });
        
        NSArray *expectedValues = @[@164,@180,@140,@148,@100,@102,@97,@98,@164,@180,@140,@148,@100,@102,@97,@98,@164,@180,@140,@148,@100,@102,@97,@98];
        it(@"should return the correct values when ticking repeatedly", ^{
            
            for (NSNumber *value in expectedValues) {
                NSNumber *returnValue = [engine tick];
                [[returnValue should] equal:value];
            }
            
        });
            
    });
    
    afterEach(^{
        engine = nil;
    });
    
    afterAll(^{
    });

    
});

SPEC_END