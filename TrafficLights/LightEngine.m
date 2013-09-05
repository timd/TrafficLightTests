//
//  LightEngine.m
//  TrafficLights
//
//  Created by Tim on 29/08/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "LightEngine.h"

@interface LightEngine()
@property (nonatomic) NSUInteger tickCount;
@property (nonatomic, strong) NSDictionary *valuesDictionary;
@end

@implementation LightEngine

-(id)init {
    self = [super init];
    if (self) {
        // Custom inititialization
        _tickCount = 0;
        _valuesDictionary = @{@0 : @164,
                              @1 : @180,
                              @2 : @140,
                              @3 : @148,
                              @4 : @100,
                              @5 : @102,
                              @6 : @97,
                              @7 : @98
                              };
    }
    return self;
}

-(NSNumber *)tick {
    
    NSNumber *value = [self.valuesDictionary objectForKey:@(self.tickCount)];
    
    if (self.tickCount < 7) {
        self.tickCount += 1;
    } else {
        self.tickCount = 0;
    }
    
    return value;
    
}

-(void)stopSequence {
    self.tickCount = 0;
}

@end
