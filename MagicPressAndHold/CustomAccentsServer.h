#import <Foundation/Foundation.h>

@interface ComBelkadanPressAndHold_CustomAccentsServer : NSObject
+ (ComBelkadanPressAndHold_CustomAccentsServer *)sharedInstance;

- (NSArray *)accentsForString:(NSString *)input;
@end

@compatibility_alias CustomAccentsServer ComBelkadanPressAndHold_CustomAccentsServer;
