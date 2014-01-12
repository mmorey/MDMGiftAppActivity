//
//  MDMGiftAppActivity.m
//  MDMGiftAppActivity
//
//  Created by Matthew Morey (http://matthewmorey.com) on 7/24/13.
//  Copyright (c) 2013 Matthew Morey. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this
//  software and associated documentation files (the "Software"), to deal in the Software
//  without restriction, including without limitation the rights to use, copy, modify, merge,
//  publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
//  to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies
//  or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
//  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#import "MDMGiftAppActivity.h"

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface MDMGiftAppActivity ()

@property (nonatomic, strong) NSURL *appStoreURL;

@end

@implementation MDMGiftAppActivity

- (id)initWithAppID:(NSString *)appID {

    return [self initWithAppID:appID withAffiliateToken:nil withCampaignToken:nil];
    
}

- (id)initWithAppID:(NSString *)appID withAffiliateToken:(NSString *)affiliateToken withCampaignToken:(NSString *)campaignToken {

    self = [super init];
    if (self) {
        self.appID = appID;
        self.affiliateToken = affiliateToken;
        self.campaignToken = campaignToken;
    }
    return self;
    
}

- (NSString *)activityType {
    
    return @"com.matthewmorey.giftapp";
    
}

- (NSString *)activityTitle {
 
    if ([self.titleOfActivity length] > 0) {
        return self.titleOfActivity;
    }
    return @"Gift App";
}

- (UIImage *)activityImage {
    
    if (self.iconOfActivity) {
        return self.iconOfActivity;
    }
    return [UIImage imageNamed:@"glyphicons_069_gift"];
    
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    // URL Breakdown
    //
    // itms-appss: https equivalent for linking directly to App Store instead of launching Safari
    // mt: Media Types, 8 = Mobile Software Applications
    // salableAdamId: Apple ID for App
    // at: Affiliate token (optional)
    // ct: Affiliate campaign token (optional)
    
    NSString *giftURLString = nil;
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        giftURLString = [NSString stringWithFormat:@"itms-appss://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/giftSongsWizard?gift=1&salableAdamId=%@&productType=C&pricingParameter=STDQ&mt=8&ign-mscache=1", self.appID];
    } else {
        giftURLString = [NSString stringWithFormat:@"itms-appss://itunes.apple.com/us/app/id%@?mt=8", self.appID];
    }
    
    if ([self.affiliateToken length] > 0) {
        giftURLString = [giftURLString stringByAppendingFormat:@"&at=%@", self.affiliateToken];
        
        if ([self.campaignToken length] > 0) {
            giftURLString = [giftURLString stringByAppendingFormat:@"&ct=%@", self.campaignToken];
        }
    }
    
    self.appStoreURL = [NSURL URLWithString:giftURLString];
    
    if (([self.appID length] > 0) && [[UIApplication sharedApplication] canOpenURL:self.appStoreURL]) {
        return YES;
    }
    
    return NO;
    
}

- (void)performActivity {
    
    [self activityDidFinish:[[UIApplication sharedApplication] openURL:self.appStoreURL]];
    
}

@end