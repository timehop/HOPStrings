# HOPStrings

[![CI Status](http://img.shields.io/travis/Chris Trott/HOPStrings.svg?style=flat)](https://travis-ci.org/Chris Trott/HOPStrings)
[![Version](https://img.shields.io/cocoapods/v/HOPStrings.svg?style=flat)](http://cocoapods.org/pods/HOPStrings)
[![License](https://img.shields.io/cocoapods/l/HOPStrings.svg?style=flat)](http://cocoapods.org/pods/HOPStrings)
[![Platform](https://img.shields.io/cocoapods/p/HOPStrings.svg?style=flat)](http://cocoapods.org/pods/HOPStrings)

HOPStrings is a small experimental library for creating NSAttributedStrings. It was inspired by a talk by James Paolantonio at [iOSoho](http://www.meetup.com/iOSoho/events/220604299/) about his library [JPAttributedString](https://github.com/jPaolantonio/JPAttributedString).

This library has not seen much production use yet. Therefore it is considered pre-release. The API may change.

API ideas and pull requests are welcome.

![Screenshot](/Marketing/example_01.png)

## Usage

### Class Overview

* `HOPAttributer` - The primary interface for building attributed strings. Immutable. Chainable.
* `HOPStringAttributes` - Property storage and arbitration between NSAttributedString dictionary attribute keys and NSParagraphStyle attributes. Mutable.

### Overview

1. Create a `HOPAttributer` with one of the class methods.
2. Chain `HOPAttributer` instance methods together to append strings. All instance methods return a new immutable `HOPAttributer` instance.
3. Call `-attributedString` on any `HOPAttributer` instance to vend an `NSAttributedString`.

#### 1. Create a `HOPAttributer`

```objc
/// You'll probably use these the most.
+ (instancetype)attributerWithDefaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;
+ (instancetype)attributer;

/// You can use these too though.
+ (instancetype)attributerWithDefaultAttributes:(HOPStringAttributes *)attributes;
+ (instancetype)attributerWithString:(NSString *)string;
+ (instancetype)attributerWithString:(NSString *)string 
              defaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;
```

`HOPAttributer` has the concept of *default attributes*. Default attributes will be applied to all strings appended down the chain with the caveat they may be overridden (and also ignored: see `emptyAttributesBlock`).

#### 2. Chain `HOPAttributer` instances

```objc
/// Appending starting with default attributes
- (instancetype)appendString:(NSString *)string;
- (instancetype)appendString:(NSString *)string 
             attributesBlock:(void (^)(HOPStringAttributes *attr))attributesBlock;

/// Appending without using default attributes
- (instancetype)appendString:(NSString *)string 
        emptyAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;
```

Use the above methods append strings to the attributer.

`HOPAttributer` uses the builder-pattern. It receives a block with a mutable `HOPStringAttributes` object that can be configured before being returned to the caller and applied to the string.

```objc
[[HOPAttributer attributer]
    appendString:@"Test string"
        attributesBlock:^(HOPStringAttributes *attr) {
            // These attributes will be applied to "Test String".
            attr.font = [UIFont systemFontOfSize:10];
            attr.foregroundColor = [UIColor blueColor];
        }];
```

`appendString:attributesBlock:` will pass a `HOPStringAttributes` instance with the default attributes already set. If you want a pristine `HOPStringAttributes` instance, use use the `appendString:emptyAttributesBlock:` variant instead.

#### 3. Get the output

When you're finished appending strings, just call `attributedString` on the `HOPAttributer` instance to vend an `NSAttributedString`. Perhaps you could set `attributedText` on a `UILabel`?

### More Examples

```objc
self.label.attributedText =
    [[[[HOPAttributer
        attributerWithDefaultAttributesBlock:^(HOPStringAttributes *attr) {
            attr.font = [UIFont systemFontOfSize:10];
            attr.foregroundColor = [UIColor blueColor];
        }]
        appendString:@"This string will be small and blue.\n"]
        appendString:@"This string will be too.\n"]
        attributedString];

self.label.attributedText =
    [[[[HOPAttributer
        attributerWithDefaultAttributesBlock:^(HOPStringAttributes *attr) {
            attr.font = [UIFont systemFontOfSize:10];
            attr.foregroundColor = [UIColor blueColor];
        }]
        appendString:@"This string will be small and blue.\n"]
        appendString:@"This string will be large and blue (because of defaults).\n"
            attributesBlock:^(HOPStringAttributes *attr) {
                attr.font = [UIFont systemFontOfSize:36];
            }]
        attributedString];

self.label.attributedText =
    [[[[HOPAttributer
        attributerWithDefaultAttributesBlock:^(HOPStringAttributes *attr) {
            attr.font = [UIFont systemFontOfSize:10];
            attr.foregroundColor = [UIColor blueColor];
        }]
        appendString:@"This string will be small and blue.\n"]
        appendString:@"This string will be large and black (because of `empty`).\n"
            emptyAttributesBlock:^(HOPStringAttributes *attr) {
                attr.font = [UIFont systemFontOfSize:36];
            }]
        attributedString];
```

### Example project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

HOPStrings has no external dependencies outside of UIKit and Foundation. It uses attributed string attributes introduced at iOS 7.

## Installation

HOPStrings is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HOPStrings"
```

## Author

Chris Trott, chris@timehop.com

### Additional Credits

`HOPStringAttributes` borrows heavily from [JPStringAttribute](https://github.com/jPaolantonio/JPAttributedString/blob/master/Pod/Classes/JPStringAttribute.h).

## License

HOPStrings is available under the MIT license. See the LICENSE file for more info.
