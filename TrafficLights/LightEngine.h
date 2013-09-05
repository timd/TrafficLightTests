#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface LightEngine : NSObject <LightEngineProtocol>
-(NSNumber *)tick;
-(void)stopSequence;
@end
