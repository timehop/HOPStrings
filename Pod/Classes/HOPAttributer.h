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

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString defaultAttributes:(HOPStringAttributes *)attributes NS_DESIGNATED_INITIALIZER;

# pragma mark - Lifting

+ (instancetype)attributerWithDefaultAttributes:(HOPStringAttributes *)attributes;
+ (instancetype)attributerWithDefaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;
+ (instancetype)attributerWithString:(NSString *)string;
+ (instancetype)attributerWithString:(NSString *)string defaultAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;

# pragma mark - Appending without using default attributes

- (instancetype)appendString:(NSString *)string emptyAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;

# pragma mark - Appending using overridable default attributes

- (instancetype)appendString:(NSString *)string;
- (instancetype)appendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *attr))attributesBlock;

@end
