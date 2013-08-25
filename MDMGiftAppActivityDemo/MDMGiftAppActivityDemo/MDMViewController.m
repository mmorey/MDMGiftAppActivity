//
//  MDMViewController.m
//  MDMGiftAppActivityDemo
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

#import "MDMViewController.h"
#import "MDMGiftAppActivity.h"

@interface MDMViewController ()

@end

@implementation MDMViewController

- (IBAction)shareButtonTapped:(id)sender {
 
    NSString *shareString = @"Check out this awesome app";
    NSURL *shareURL = [NSURL URLWithString:@"http://buoyexplorer.com"];
    NSArray *activityItems = @[shareString, shareURL];
    
    NSArray *excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll];
    
    // Gift app without affiliate ID
    MDMGiftAppActivity *giftAppActivity = [[MDMGiftAppActivity alloc] initWithAppID:@"593296099"];
    
    // Gift app with affiliate ID
    // MDMGiftAppActivity *giftAppActivity = [[MDMGiftAppActivity alloc] initWithAppID:@"XXXXXXXXX" withAffiliateToken:@"YYYYYY" withCampaignToken:@"ZZZZZZZ"];
    
    NSArray *applicationActivities = @[giftAppActivity];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                                         applicationActivities:applicationActivities];
    activityViewController.excludedActivityTypes = excludedActivityTypes;
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
}

@end
