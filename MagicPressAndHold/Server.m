//
//  Server.m
//  MagicPressAndHold
//
//  Created by Jordy Rose on 2012-04-23.
//  Copyright (c) 2012 Belkadan Software. All rights reserved.
//

#import "Server.h"
#import	"SwizzleMacros.h"
#import "PressAndHold.h"

@implementation Server

+ (void)load
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
	if ([language length] == 0) {
		language = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
	}

	// Returns a space-separated list of possible replacements for the input string.
	return [self ComBelkadanPressAndHold_accentsStringForString:input language:language];
}

@end
