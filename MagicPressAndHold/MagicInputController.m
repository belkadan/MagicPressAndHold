#import "MagicInputController.h"
#import "CustomAccentsServer.h"
#import	"SwizzleMacros.h"
#import "PressAndHold.h"

@implementation MagicInputController
+ (void)initialize
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Class PAHInputController_class = NSClassFromString(@"PAHInputController");
		if (!PAHInputController_class) return;
		
		COPY_AND_EXCHANGE(self, PAHInputController_class, ComBelkadanPressAndHold_, accentsStringForString:language:);
	});
}

#pragma mark -

- (NSString *)ComBelkadanPressAndHold_accentsStringForString:(NSString *)input language:(NSString *)language
{
	NSArray *customAccents = [[CustomAccentsServer sharedInstance] accentsForString:input];
	if (customAccents) return [customAccents componentsJoinedByString:@" "];
	
	// Returns a space-separated list of possible replacements for the input string.
	return [self ComBelkadanPressAndHold_accentsStringForString:input language:language];
}

@end
