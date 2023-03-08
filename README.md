# EasyPin

[![CI Status](https://img.shields.io/travis/fahadshafiq48/EasyPin.svg?style=flat)](https://travis-ci.org/fahadshafiq48/EasyPin)
[![Version](https://img.shields.io/cocoapods/v/EasyPin.svg?style=flat)](https://cocoapods.org/pods/EasyPin)
[![License](https://img.shields.io/cocoapods/l/EasyPin.svg?style=flat)](https://cocoapods.org/pods/EasyPin)
[![Platform](https://img.shields.io/cocoapods/p/EasyPin.svg?style=flat)](https://cocoapods.org/pods/EasyPin)

![EasyPin logo](https://raw.githubusercontent.com/fahadshafiq48/EasyPin/main/.github/pinView.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS version 13 or above
- SwiftUI

## Installation

EasyPin is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby
pod 'EasyPin'
```

## Usage

You can find Demo App from the git repository in Example directory.

### Step by step tutorial:

You can create customizable Pin view and its keypad by following the mentioned steps:
Make sure to add EasyPin in Podfile & install it

import EasyPin in your code file

```ruby
import EasyPin
```

### Pin View

initialize variables which will hold your actual pin and its limit
pinLimit represents the total count of pin dots 

```ruby
@State var pinCode = ""
let pinLimit = 4
```

Now you can simply make Pin view using the following code
```ruby
PinCodeWidget.shared.addPinCode(limit: pinLimit, text: pinCode, fillColor: Color.blue,
borderColor: Color.white, height: 40, width: 40, cornerRadius: 20)
```
  
### KeyPad View

To make the keypad first make a object of PinCodeWidget

```ruby
let keypad = PinCodeWidget(keyHeight: 56, keyBgColor: .clear,
keyTextColor: .white, keyFont: .system(size: 48))
```

now use the keypad object and draw the keypad. Here we are onUpdate method with pinCode which allow us to perform some action when user will press some key

```ruby
keypad.drawKeypad(pinCode: $pinCode.onUpdate {
    pinCodeUpdated()
}, backSpaceImg: Image("clear"), limit: pinLimit)
```

In pinCodeUpdated() function you can write what you want. For example, moving to next screen

## Author

Fahad Shafiq, fahadshafiq48@gmail.com

## License

EasyPin is available under the MIT license. See the LICENSE file for more info.
