#import "CustomAccentsServer.h"
#import "MagicInputController.h"
#import "PressAndHold.h"

static NSString * const kBundleIdentifier = @"com.belkadan.MagicPressAndHold";
static NSString * const kAccentsKey = @"Accents";

@interface CustomAccentsServer ()
@property (retain) NSDictionary *accents;
@end

@implementation CustomAccentsServer
@synthesize accents;

+ (void)load
{
	(void)[MagicInputController class]; // force load
}

+ (CustomAccentsServer *)sharedInstance
{
	static dispatch_once_t onceToken;
	static CustomAccentsServer *instance;
	dispatch_once(&onceToken, ^{
		NSDictionary *config = [[NSUserDefaults standardUserDefaults] persistentDomainForName:kBundleIdentifier];
		instance = [[self alloc] initWithConfiguration:config];
	});
	return instance;
}

#pragma -

- (id)initWithConfiguration:(NSDictionary *)configuration
{
	self = [super init];
	if (self) {
		accents = [configuration objectForKey:kAccentsKey];
	}
	return self;
}

- (NSArray *)accentsForString:(NSString *)input
{
	return [accents objectForKey:input];
}
@end
