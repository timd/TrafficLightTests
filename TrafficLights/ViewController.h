#import <UIKit/UIKit.h>

@protocol LightEngineProtocol <NSObject>
-(NSNumber *)tick;
@end

@interface ViewController : UIViewController
@property (nonatomic, weak) id<LightEngineProtocol> delegate;
@end
