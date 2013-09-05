#import <UIKit/UIKit.h>

@protocol LightEngineProtocol <NSObject>
-(NSNumber *)tick;
-(void)stopSequence;
@end

@interface ViewController : UIViewController
@property (nonatomic, weak) id<LightEngineProtocol> delegate;
@end
