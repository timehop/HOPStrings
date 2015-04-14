//
//  Pods
//
//

@import Foundation;

@class HOPStringAttributes;

#pragma mark -

/// A chainable object that builds NSAttributedStrings by optionally applying default attributes.
@interface HOPAttributer : NSObject

# pragma mark - Output

/// Read the output of the attributer once it has been built.
@property (nonatomic, readonly) NSAttributedString *attributedString;

# pragma mark - Initialization

/// Create an attributer by wrapping an attributedString and setting the default attributes.
/// Consumers usually will not need to use this method. Use one of the generators under "Lifting" instead.
- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString defaultAttributes:(HOPStringAttributes *)attributes __attribute((nonnull)) NS_DESIGNATED_INITIALIZER;

# pragma mark - Lifting

/// Create an attributer with a premade set of defaultAttributes that may be applied to future transformations.
+ (instancetype)attributerWithDefaultAttributes:(HOPStringAttributes *)attributes __attribute((nonnull));

/// Create an attributer with a configureable set of attributes that may be applied to most future transformations.
+ (instancetype)attributerWithDefaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

/// Create an attributer with a string and no default attributes.
+ (instancetype)attributerWithString:(NSString *)string __attribute((nonnull));

/// Create an attributer with a configurable set of default attributes. The attributes will be applied to `string`.
+ (instancetype)attributerWithString:(NSString *)string defaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

# pragma mark - Appending starting with default attributes

/// Append a string to the receiever by applying the default attributes.
/// Returns a new `HOPAttributer` with the same default attributes as the receiver.
- (instancetype)appendString:(NSString *)string __attribute((nonnull));

/// Append a string to the receiever by applying the default attributes and any modifications to the
/// default attributes made by `attributesBlock`.
/// Returns a new `HOPAttributer` with the same default attributes as the receiver.
- (instancetype)appendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

# pragma mark - Appending without using default attributes

/// Append a string to the receiever with only the attributes configured in `attributesBlock`. The default attributes will not be used.
/// Returns a new `HOPAttributer` with the same default attributes as the receiver.
- (instancetype)appendString:(NSString *)string emptyAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

# pragma mark - Appending using special attribute rules

/// Appends a newline character with the attributes of the last character in the receiver's attributedString.
/// If the receiver's attributedString is empty, the receiver is returned.
- (instancetype)appendNewline;

@end
