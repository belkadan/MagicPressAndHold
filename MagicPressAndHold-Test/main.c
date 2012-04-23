#import <CoreFoundation/CoreFoundation.h>
#import <Carbon/Carbon.h>

int main(int argc, const char * argv[])
{
	TISInputSourceRef currentKeyboard = TISCopyCurrentKeyboardLayoutInputSource();
	CFTypeRef type = TISGetInputSourceProperty(currentKeyboard, CFSTR("ComBelkadanTest"));
	CFShow(type);
	CFRelease(currentKeyboard);
    return 0;
}

