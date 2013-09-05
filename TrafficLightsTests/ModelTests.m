#import "Kiwi.h"
#import "LightEngine.h"

@interface LightEngine (ModelTests)
@property (nonatomic) NSUInteger tickCount;
@end

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
    
    context(@"when stopping", ^{
        
        it(@"should respond to the stop message", ^{
            [[engine should] respondToSelector:@selector(stopSequence)];
        });
        
        it(@"should reset the tickCount back to zero in response to a stop message", ^{
            [[theValue([engine tickCount]) should] equal:theValue(0)];
            [engine tick];
            [[theValue([engine tickCount]) should] equal:theValue(1)];
            [engine stopSequence];
            [[theValue([engine tickCount]) should] equal:theValue(0)];
        });
        
    });
    
    afterEach(^{
        engine = nil;
    });
    
    afterAll(^{
    });

    
});

SPEC_END