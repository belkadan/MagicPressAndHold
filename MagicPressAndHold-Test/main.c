#import <CoreFoundation/CoreFoundation.h>
#import <Carbon/Carbon.h>

void showName(TISInputSourceRef keyboard, void *unused) {
	CFShow(TISGetInputSourceProperty(keyboard, kTISPropertyInputSourceID));
}

#define LENGTH(x) (sizeof(x)/sizeof(*(x)))

int main(int argc, const char * argv[])
{
	CFTypeRef keys[] = { kTISPropertyInputSourceCategory, kTISPropertyInputSourceIsSelectCapable };
	CFTypeRef values[] = { kTISCategoryKeyboardInputSource, kCFBooleanTrue };
	CFDictionaryRef keyLayoutsOnly = CFDictionaryCreate(NULL, keys, values, LENGTH(keys), &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);

	CFArrayRef inputSources = TISCreateInputSourceList(keyLayoutsOnly, false);
	CFArrayApplyFunction(inputSources, CFRangeMake(0, CFArrayGetCount(inputSources)), (CFArrayApplierFunction)&showName, NULL);

	CFRelease(inputSources);
	CFRelease(keyLayoutsOnly);
    return 0;
}

