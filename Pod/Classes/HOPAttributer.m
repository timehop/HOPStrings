//
//  Pods
//
//

#import "HOPAttributer.h"

#import "HOPStringAttributes.h"

#import "NSAttributedString+HOPAppend.h"

#pragma mark -

@interface HOPAttributer ()

@property (nonatomic, readonly) HOPStringAttributes *cascadingAttributes;

@end

@implementation HOPAttributer

- (instancetype)init {
    NSAttributedString *attributedString = [[NSAttributedString alloc] init];
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    return [self initWithAttributedString:attributedString cascadingAttributes:attributes];
}

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString cascadingAttributes:(HOPStringAttributes *)attributes {
    NSParameterAssert(attributedString != nil);
    NSParameterAssert(attributes != nil);
    self = [super init];
    if (self != nil) {
        _cascadingAttributes = [attributes copy];
        _attributedString = [attributedString copy];
    }
    return self;
}

# pragma mark - Lifting

+ (instancetype)withCascadingAttributes:(HOPStringAttributes *)attributes {
    NSAttributedString *attributedString = [[NSAttributedString alloc] init];
    return [[self alloc] initWithAttributedString:attributedString cascadingAttributes:attributes];
}

+ (instancetype)withCascadingAttributesBlock:(void(^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(attributesBlock != nil);
    HOPAttributer *attributer = [[self alloc] init];
    attributesBlock(attributer.cascadingAttributes);
    return attributer;
}

+ (instancetype)string:(NSString *)string {
    NSParameterAssert(string != nil);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string];
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    return [[self alloc] initWithAttributedString:attributedString cascadingAttributes:attributes];
}

+ (instancetype)string:(NSString *)string withCascadingAttributesBlock:(void(^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(string != nil);
    NSParameterAssert(attributesBlock != nil);
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    attributesBlock(attributes);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[attributes attributedDictionary]];
    HOPAttributer *attributer = [[self alloc] initWithAttributedString:attributedString cascadingAttributes:attributes];
    return attributer;
}

# pragma mark - Appending

- (instancetype)appendString:(NSString *)string withAttributesBlock:(void(^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(string != nil);
    NSParameterAssert(attributesBlock != nil);
    HOPStringAttributes *attributes = [[HOPStringAttributes alloc] init];
    attributesBlock(attributes);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[attributes attributedDictionary]];
    NSAttributedString *combinedString = [self.attributedString hop_stringByAppendingAttributedString:attributedString];
    return [[[self class] alloc] initWithAttributedString:combinedString cascadingAttributes:self.cascadingAttributes];
}

# pragma mark - Cascading

- (instancetype)cascadeAppendString:(NSString *)string {
    NSParameterAssert(string != nil);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[self.cascadingAttributes attributedDictionary]];
    NSAttributedString *combinedString = [self.attributedString hop_stringByAppendingAttributedString:attributedString];
    return [[[self class] alloc] initWithAttributedString:combinedString cascadingAttributes:self.cascadingAttributes];
}

- (instancetype)cascadeAppendString:(NSString *)string attributesBlock:(void (^)(HOPStringAttributes *))attributesBlock {
    NSParameterAssert(string != nil);
    NSParameterAssert(attributesBlock != nil);
    HOPStringAttributes *modifiedAttributes = [self.cascadingAttributes copy];
    attributesBlock(modifiedAttributes);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:[modifiedAttributes attributedDictionary]];
    NSAttributedString *combinedString = [self.attributedString hop_stringByAppendingAttributedString:attributedString];
    return [[[self class] alloc] initWithAttributedString:combinedString cascadingAttributes:self.cascadingAttributes];
}

@end
