# KZNBlinkView
===============

![Screenshot](https://raw2.github.com/kenzan8000/KZNBlinkView/master/Screenshot/Screenshot.gif "Screenshot")

KZNBlinkView is UIView to blink.

KZNBlinkView is tested on iOS 5.0+ and requires ARC.


## Installation

### CocoaPods
If you are using CocoaPods, then just add KZNBlinkView to you Podfile.
```ruby
pod 'KZNBlinkView', :git => 'https://github.com/kenzan8000/KZNBlinkView.git'
```

### Manually
Simply add the files in the KZNBlinkView directory to your project.


## Example

```objective-c
    // Category
    [KZNBlinkView showBlinkWithBlinkColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.3f]
                            blinkInterval:0.15f];
```

```objective-c
    // Storyboard or Xib
    [self.blinkView setBlinkColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.3f]
                       blinkCount:NSIntegerMax
                    blinkInterval:0.15f
                     waitInterval:0.5f];
    [self.blinkView startBlinking];
```

```objective-c
    // Manual
    KZNBlinkView *blinkView = [[KZNBlinkView alloc] initWithBlinkColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.3f]
                                                            blinkCount:NSIntegerMax
                                                         blinkInterval:0.15f
                                                          waitInterval:0.5f];
    [blinkView startBlinking];
```


## License
Released under the MIT license.
