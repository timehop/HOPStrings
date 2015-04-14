//
//  Pods
//
//

#import "HOPAttributer.h"

#import "HOPStringAttributes.h"

#import "NSAttributedString+HOPAppend.h"

#pragma mark -

@interface HOPAttributer ()

@property (nonatomic, readonly) HOPStringAttributes *defaultAttributes;

@end

@implementation HOPAttributer

- (instancetype)init {
    NSAttributedString *attributedString = [[NSAttributedString alloc] init];
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    return [self initWithAttributedString:attributedString defaultAttributes:attributes];
}

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString defaultAttributes:(HOPStringAttributes *)attributes {
    NSParameterAssert(attributedString != nil);
    NSParameterAssert(attributes != nil);
    self = [super init];
    if (self != nil) {
        _defaultAttributes = [attributes copy];
        _attributedString = [attributedString copy];
    }
    return self;
}

# pragma mark - Lifting

+ (instancetype)attributerWithDefaultAttributes:(HOPStringAttributes *)attributes {
    NSAttributedString *attributedString = [[NSAttributedString alloc] init];
    return [[self alloc] initWithAttributedString:attributedString defaultAttributes:attributes];
}

+ (instancetype)attributerWithDefaultAttributesBlock:(void(^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(attributesBlock != nil);
    HOPAttributer *attributer = [[self alloc] init];
    attributesBlock(attributer.defaultAttributes);
    return attributer;
}

+ (instancetype)attributerWithString:(NSString *)string {
    NSParameterAssert(string != nil);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string];
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    return [[self alloc] initWithAttributedString:attributedString defaultAttributes:attributes];
}

+ (instancetype)attributerWithString:(NSString *)string defaultAttributesBlock:(void(^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(string != nil);
    NSParameterAssert(attributesBlock != nil);
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    attributesBlock(attributes);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[attributes attributedDictionary]];
    HOPAttributer *attributer = [[self alloc] initWithAttributedString:attributedString defaultAttributes:attributes];
    return attributer;
}

# pragma mark - Appending

- (instancetype)appendString:(NSString *)string emptyAttributesBlock:(void(^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(string != nil);
    NSParameterAssert(attributesBlock != nil);
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    attributesBlock(attributes);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[attributes attributedDictionary]];
    NSAttributedString *combinedString = [self.attributedString hop_stringByAppendingAttributedString:attributedString];
    return [[[self class] alloc] initWithAttributedString:combinedString defaultAttributes:self.defaultAttributes];
}

# pragma mark - Cascading

- (instancetype)appendString:(NSString *)string {
    NSParameterAssert(string != nil);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[self.defaultAttributes attributedDictionary]];
    NSAttributedString *combinedString = [self.attributedString hop_stringByAppendingAttributedString:attributedString];
    return [[[self class] alloc] initWithAttributedString:combinedString defaultAttributes:self.defaultAttributes];
}

- (instancetype)appendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(string != nil);
    NSParameterAssert(attributesBlock != nil);
    HOPStringAttributes *modifiedAttributes = [self.defaultAttributes copy];
    attributesBlock(modifiedAttributes);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[modifiedAttributes attributedDictionary]];
    NSAttributedString *combinedString = [self.attributedString hop_stringByAppendingAttributedString:attributedString];
    return [[[self class] alloc] initWithAttributedString:combinedString defaultAttributes:self.defaultAttributes];
}

@end
