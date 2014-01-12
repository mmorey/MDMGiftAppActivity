# MDMGiftAppActivity

[![MDMGiftAppActivity](https://cocoapod-badges.herokuapp.com/v/MDMGiftAppActivity/badge.png)](http://cocoadocs.org/docsets/MDMGiftAppActivity)
[![MDMGiftAppActivity](https://cocoapod-badges.herokuapp.com/p/MDMGiftAppActivity/badge.svg)](http://cocoadocs.org/docsets/MDMGiftAppActivity)

MDMGiftAppActivity is a `UIActivity` subclass that provides a "Gift App" action to a `UIActivityViewController`.

On iOS 6 the user will be taken to the gifting dialog for the app on the App Store. 

On iOS 7 the user is taken to the App Store page for the app instead. Once on the App Store page the use still has to tap on action button in the top toolbar. Apple no longer allows linking directly to the gifting dialog.

![MDMGiftAppActivity Screenshot](https://github.com/mmorey/MDMGiftAppActivity/raw/master/screenshot_iOS7.png)
![MDMGiftAppActivity Screenshot](https://github.com/mmorey/MDMGiftAppActivity/raw/master/screenshot.png)

## Installation

### With CocoaPods

Add `pod 'MDMGiftAppActivity'` to your Podfile or `pod 'MDMGiftAppActivity', :head` if you're feeling adventurous.

### Manually

Just drag the `MDMGiftAppActivity.[h|m]` and `glyphicons_069_gift[@2x].png` files into your project.

_**Important note:**_ If your project doesn't use ARC you must add the `-fobjc-arc` compiler flag to `MDMGiftAppActivity.m` in Target Settings > Build Phases > Compile Sources.

## Usage

_**Important note:**_ Demo does not work on the simulator as it does not contain the App Store app, you must test on a device. See example Xcode project in `/MDMGiftAppActivityDemo`.

### 1) Create a MDMGiftAppActivity object

```objective-c
MDMGiftAppActivity *giftAppActivity = [[MDMGiftAppActivity alloc] initWithAppID:@"XXXXXXXXX"];
```

An app ID can be found by opening iTunes and finding the app you want to link to. Right click on its icon then on ‘Copy Link’. For this example I’m using Buoy Explorer and the link looks like this: `https://itunes.apple.com/us/app/buoy-explorer-noaa-marine/id593296099?mt=8`. The app ID for Buoy Explorer is `593296099`. You can also find the App ID with the [Apple Link Maker](http://itunes.apple.com/linkmaker/).

### 2) Add it to a UIActivityViewController

```objective-c
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"Awesome app"]]
                                                                                     applicationActivities:@[giftAppActivity]];
[self presentViewController:activityViewController animated:YES completion:nil];
```

### Optional Features

Add affiliate ID

```objective-c
MDMGiftAppActivity *giftAppActivity = [[MDMGiftAppActivity alloc] initWithAppID:@"XXXXXXXXX" withAffiliateToken:@"YYYYYY" withCampaignToken:@"ZZZZZZZ"];
```

Change activity title

```objective-c
giftAppActivity.titleOfActivity = @"Gift This App";
```

Change activity icon

```objective-c
giftAppActivity.iconOfActivity = [UIImage imageNamed:@"gift-icon"];
```

## Credits

MDMGiftAppActivity is brought to you by [Matthew Morey](http://matthewmorey.com). The gift icon is from [GLYPHICONS](http://glyphicons.com/). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/mmorey/MDMGiftAppActivity/issues/new). If you're using MDMGiftAppActivity in your project, attribution would be nice.
