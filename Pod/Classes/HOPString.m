//
//  Pods
//
//

#import "HOPString.h"


#pragma mark -

@implementation HOPString

# pragma mark - Lifting

+ (instancetype)withCascadingAttributes:(HOPStringAttributes *)attributes {
    return nil;
}

+ (instancetype)withCascadingAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock {
    return nil;
}

+ (instancetype)string:(NSString *)string {
    return nil;
}

+ (instancetype)string:(NSString *)string withCascadingAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock {
    return nil;
}

# pragma mark - Appending

- (instancetype)appendString:(NSString *)string withAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock {
    return nil;
}

# pragma mark - Cascading

- (instancetype)cascadeAppendString:(NSString *)string {
    return nil;
}

- (instancetype)cascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPMutableStringAttributes *attr))attributesBlock {
    return nil;
}

# pragma mark - New Line

- (instancetype)newlineAppendString:(NSString *)string withAttributesBlock:(void(^)(HOPMutableStringAttributes *attr))attributesBlock {
    return nil;
}

- (instancetype)newlineCascadeAppendString:(NSString *)string {
    return nil;
}

- (instancetype)newlineCascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPMutableStringAttributes *attr))attributesBlock {
    return nil;
}

@end
