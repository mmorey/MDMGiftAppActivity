# MDMGiftAppActivity

MDMGiftAppActivity is a `UIActivity` subclass that provides a "Gift App" action to a `UIActivityViewController`.

![MDMGiftAppActivity Screenshot](https://github.com/mmorey/MDMGiftAppActivity/raw/master/screenshot.png)

## Installation

### With CocoaPods

Add `pod 'MDMGiftAppActivity'` to your Podfile or `pod 'MDMGiftAppActivity', :head` if you're feeling adventurous.

### Manually

_**Important note if your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `MDMGiftAppActivity.m` in Target Settings > Build Phases > Compile Sources._

Just drag the `MDMGiftAppActivity.[h|m]` and `glyphicons_069_gift[@2x].png` files into your project.

## Usage

_**Important note,  demo does not work on simulator**: simulator does not contain the App Store app, you must test on a device._

(see example Xcode project in `/MDMGiftAppActivityDemo`)

### Create a MDMGiftAppActivity object

```objective-c
MDMGiftAppActivity *giftAppActivity = [[MDMGiftAppActivity alloc] initWithAppID:@"593296099"];
```

### Add it to a UIActivityViewController

```objective-c
NSArray *applicationActivities = @[giftAppActivity];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                                     applicationActivities:applicationActivities];
[self presentViewController:activityViewController animated:YES completion:nil];
```

## Credits
MDMGiftAppActivity is brought to you by [Matthew Morey](http://matthewmorey.com). The gift icon is from [Glyphish](http://glyphish.com/). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/mmorey/MDMGiftAppActivity/issues/new). If you're using MDMGiftAppActivity in your project, attribution would be nice.