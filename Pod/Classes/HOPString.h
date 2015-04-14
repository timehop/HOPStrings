//
//  Pods
//
//

@import Foundation;

@class HOPStringAttributes;
@class HOPMutableStringAttributes;

#pragma mark -

@interface HOPString : NSObject

@property (nonatomic, readonly) NSAttributedString *attributedString;
@property (nonatomic, readonly) NSString *string;

+ (instancetype)withCascadingAttributes:(HOPStringAttributes *)attributes;
+ (instancetype)withCascadingAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock;
+ (instancetype)string:(NSString *)string;
+ (instancetype)string:(NSString *)string withCascadingAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock;

- (instancetype)appendString:(NSString *)string withAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock;

- (instancetype)cascadeAppendString:(NSString *)string;
- (instancetype)cascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPMutableStringAttributes *attr))attributesBlock;

- (instancetype)newlineAppendString:(NSString *)string withAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock;
- (instancetype)newlineCascadeAppendString:(NSString *)string;
- (instancetype)newlineCascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPMutableStringAttributes *attr))attributesBlock;

@end
