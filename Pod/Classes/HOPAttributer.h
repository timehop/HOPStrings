//
//  Pods
//
//

@import Foundation;

@class HOPStringAttributes;

#pragma mark -

@interface HOPAttributer : NSObject

# pragma mark - Output

@property (nonatomic, readonly) NSAttributedString *attributedString;

# pragma mark - Initialization

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString defaultAttributes:(HOPStringAttributes *)attributes __attribute((nonnull)) NS_DESIGNATED_INITIALIZER;

# pragma mark - Lifting

+ (instancetype)attributerWithDefaultAttributes:(HOPStringAttributes *)attributes __attribute((nonnull));
+ (instancetype)attributerWithDefaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));
+ (instancetype)attributerWithString:(NSString *)string __attribute((nonnull));
+ (instancetype)attributerWithString:(NSString *)string defaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

# pragma mark - Appending without using default attributes

- (instancetype)appendString:(NSString *)string emptyAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

# pragma mark - Appending starting with default attributes

- (instancetype)appendString:(NSString *)string __attribute((nonnull));
- (instancetype)appendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *attr))attributesBlock __attribute((nonnull));

@end
