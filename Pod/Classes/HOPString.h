//
//  Pods
//
//

@import Foundation;

@class HOPStringAttributes;
@class HOPStringAttributes;

#pragma mark -

@interface HOPString : NSObject

# pragma mark - Output

@property (nonatomic, readonly) NSAttributedString *attributedString;
@property (nonatomic, readonly) NSString *string;

# pragma mark - Lifting

+ (instancetype)withCascadingAttributes:(HOPStringAttributes *)attributes;
+ (instancetype)withCascadingAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;
+ (instancetype)string:(NSString *)string;
+ (instancetype)string:(NSString *)string withCascadingAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;

# pragma mark - Appending

- (instancetype)appendString:(NSString *)string withAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;

# pragma mark - Cascading

- (instancetype)cascadeAppendString:(NSString *)string;
- (instancetype)cascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *attr))attributesBlock;

# pragma mark - New Line

- (instancetype)newlineAppendString:(NSString *)string withAttributesBlock:(void(^)(HOPStringAttributes *attr))attributesBlock;
- (instancetype)newlineCascadeAppendString:(NSString *)string;
- (instancetype)newlineCascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *attr))attributesBlock;

@end
