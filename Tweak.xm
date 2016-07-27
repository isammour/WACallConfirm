#import "UIAlert+Blocks.h"

#define kPreferencesPath @"/User/Library/Preferences/com.sammour.callconfirm.plist"
#define kPreferencesChanged "com.sammour.callconfirm.preferences-changed"
#define kTapConfirmation @"tapConfirmation"
static BOOL tapConfirmation;

static void WsInitPrefs() {
    NSDictionary *Wssettings = [NSDictionary dictionaryWithContentsOfFile:kPreferencesPath];
    NSNumber *WsEnableOptionKey1 = Wssettings[kTapConfirmation];
    tapConfirmation = WsEnableOptionKey1 ? [WsEnableOptionKey1 boolValue] : 1;
}

%hook CallManager 

-(int)startCallWith:(id)with withVideo:(BOOL)video
{
	__block int x = 0;
	if(tapConfirmation){
		UIAlertView *a = [[UIAlertView alloc]init];
		[a setMessage:@"Are you sure you want to call ?"];
		[a addButtonWithTitle:@"Yes"];
		[a addButtonWithTitle:@"No"];
		[a show];
		[a release];
		[a showWithCompletion:^(UIAlertView *alert,NSInteger clicked)
		{
			if(clicked == 0)
				x = %orig;
			else
				x = nil;
		}
		];
		return x;
	}
	else
		return %orig;
}
%end

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)WsInitPrefs, CFSTR(kPreferencesChanged), NULL, CFNotificationSuspensionBehaviorCoalesce);
    WsInitPrefs();
}


