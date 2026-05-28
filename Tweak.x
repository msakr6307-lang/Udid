#import <UIKit/UIKit.h>
#import <substrate.h>

// ========== تخلي الـ IDFV ثابت ==========
%hook UIDevice
- (NSUUID *)identifierForVendor {
    return [[NSUUID alloc] initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
}
%end

// ========== تخلي NSUserDefaults ما تخزنش حاجة مهمة ==========
%hook NSUserDefaults
- (void)setObject:(id)value forKey:(NSString *)defaultName {
    NSArray *blockedKeys = @[@"license", @"activation", @"expiry", @"trial", @"premium", @"firstRun"];
    for (NSString *key in blockedKeys) {
        if ([defaultName containsString:key]) {
            return;
        }
    }
    %orig;
}
%end

// ========== تخلي Keychain ما يرجعش حاجة ==========
%hook KeychainManager
- (id)objectForKey:(NSString *)key {
    NSArray *blockedKeys = @[@"license", @"activation", @"expiry", @"trial", @"premium", @"deviceID"];
    for (NSString *blocked in blockedKeys) {
        if ([key containsString:blocked]) {
            return nil;
        }
    }
    return %orig;
}
%end

// ========== دوال التحقق الأساسية ==========
%hook LicenseManager
- (BOOL)isLicenseValid {
    return YES;
}
- (BOOL)checkDevice {
    return YES;
}
- (BOOL)verifyKey:(NSString *)key {
    return YES;
}
- (BOOL)isPremium {
    return YES;
}
- (id)getExpirationDate {
    return [NSDate distantFuture];
}
%end

// ========== منع إرسال التحليلات ==========
%hook AnalyticsManager
- (void)sendEvent:(NSString *)event {
    // منع إرسال أي بيانات
}
%end

%ctor {
    NSLog(@"[Bypass] License Bypass Activated!");
}
