//
//  Pods
//
//

#import "HOPStringAttributes.h"


#pragma mark -

@implementation HOPStringAttributes

- (instancetype)initWithDictionary:(NSDictionary *)attributedDictionary {
    NSParameterAssert(attributedDictionary != nil);
    self = [super init];
    if (self != nil) {
        _font = attributedDictionary[NSFontAttributeName];
        _foregroundColor = attributedDictionary[NSForegroundColorAttributeName];
        _backgroundColor = attributedDictionary[NSBackgroundColorAttributeName];
        _ligature = attributedDictionary[NSLigatureAttributeName];
        _kern = attributedDictionary[NSKernAttributeName];
        _strikethroughStyle = attributedDictionary[NSStrikethroughStyleAttributeName];
        _underlineStyle = attributedDictionary[NSUnderlineStyleAttributeName];
        _strokeColor = attributedDictionary[NSStrokeColorAttributeName];
        _strokeWidth = attributedDictionary[NSStrokeWidthAttributeName];
        _shadow = attributedDictionary[NSShadowAttributeName];
        _textEffect = attributedDictionary[NSTextEffectAttributeName];
        _baselineOffset = attributedDictionary[NSBaselineOffsetAttributeName];
        _underlineColor = attributedDictionary[NSUnderlineColorAttributeName];
        _strikethroughColor = attributedDictionary[NSStrikethroughColorAttributeName];
        NSMutableParagraphStyle *paragraphStyle = attributedDictionary[NSParagraphStyleAttributeName];
        if (paragraphStyle != nil) {
            _lineSpacing = @(paragraphStyle.lineSpacing);
            _paragraphSpacing = @(paragraphStyle.paragraphSpacing);
            _alignment = @(paragraphStyle.alignment);
            _firstLineHeadIndent = @(paragraphStyle.firstLineHeadIndent);
            _headIndent = @(paragraphStyle.headIndent);
            _tailIndent = @(paragraphStyle.tailIndent);
            _lineBreakMode = @(paragraphStyle.lineBreakMode);
            _minimumLineHeight = @(paragraphStyle.minimumLineHeight);
            _maximumLineHeight = @(paragraphStyle.maximumLineHeight);
            _baseWritingDirection = @(paragraphStyle.baseWritingDirection);
            _lineHeightMultiple = @(paragraphStyle.lineHeightMultiple);
            _paragraphSpacingBefore = @(paragraphStyle.paragraphSpacingBefore);
            _hyphenationFactor = @(paragraphStyle.hyphenationFactor);
            _tabStops = [paragraphStyle.tabStops copy];
            _defaultTabInterval = @(paragraphStyle.defaultTabInterval);
        }
    }
    return self;
}

- (NSDictionary *)attributedDictionary {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    if (self.font != nil) attributes[NSFontAttributeName] = [self.font copy];
    if (self.foregroundColor != nil) attributes[NSForegroundColorAttributeName] = [self.foregroundColor copy];
    if (self.backgroundColor != nil) attributes[NSBackgroundColorAttributeName] = [self.backgroundColor copy];
    if (self.ligature != nil) attributes[NSLigatureAttributeName] = [self.ligature copy];
    if (self.kern != nil) attributes[NSKernAttributeName] = [self.kern copy];
    if (self.strikethroughStyle != nil) attributes[NSStrikethroughStyleAttributeName] = [self.strikethroughStyle copy];
    if (self.underlineStyle != nil) attributes[NSUnderlineStyleAttributeName] = [self.underlineStyle copy];
    if (self.strokeColor != nil) attributes[NSStrokeColorAttributeName] = [self.strokeColor copy];
    if (self.strokeWidth != nil) attributes[NSStrokeWidthAttributeName] = [self.strokeWidth copy];
    if (self.shadow != nil) attributes[NSShadowAttributeName] = [self.shadow copy];
    if (self.textEffect != nil) attributes[NSTextEffectAttributeName] = [self.textEffect copy];
    if (self.baselineOffset != nil) attributes[NSBaselineOffsetAttributeName] = [self.baselineOffset copy];
    if (self.underlineColor != nil) attributes[NSUnderlineColorAttributeName] = [self.underlineColor copy];
    if (self.strikethroughColor != nil) attributes[NSStrikethroughColorAttributeName] = [self.strikethroughColor copy];
    if (self.lineSpacing != nil) paragraphStyle.lineSpacing = [self.lineSpacing doubleValue];
    if (self.paragraphSpacing != nil) paragraphStyle.paragraphSpacing = [self.paragraphSpacing doubleValue];
    if (self.alignment != nil) paragraphStyle.alignment = (NSTextAlignment)[self.alignment integerValue];
    if (self.firstLineHeadIndent != nil) paragraphStyle.firstLineHeadIndent = [self.firstLineHeadIndent doubleValue];
    if (self.headIndent != nil) paragraphStyle.headIndent = [self.headIndent doubleValue];
    if (self.tailIndent != nil) paragraphStyle.tailIndent = [self.tailIndent doubleValue];
    if (self.lineBreakMode != nil) paragraphStyle.lineBreakMode = (NSLineBreakMode)[self.lineBreakMode integerValue];
    if (self.minimumLineHeight != nil) paragraphStyle.minimumLineHeight = [self.minimumLineHeight doubleValue];
    if (self.maximumLineHeight != nil) paragraphStyle.maximumLineHeight = [self.maximumLineHeight doubleValue];
    if (self.baseWritingDirection != nil) paragraphStyle.baseWritingDirection = (NSWritingDirection)[self.baseWritingDirection integerValue];
    if (self.lineHeightMultiple != nil) paragraphStyle.lineHeightMultiple = [self.lineHeightMultiple doubleValue];
    if (self.paragraphSpacingBefore != nil) paragraphStyle.paragraphSpacingBefore = [self.paragraphSpacingBefore doubleValue];
    if (self.hyphenationFactor != nil) paragraphStyle.hyphenationFactor = [self.hyphenationFactor floatValue];
    if (self.tabStops != nil) paragraphStyle.tabStops = self.tabStops;
    if (self.defaultTabInterval != nil) paragraphStyle.defaultTabInterval = [self.defaultTabInterval doubleValue];
    attributes[NSParagraphStyleAttributeName] = [paragraphStyle copy];
    return [attributes copy];
}

#pragma mark NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
	return [[[self class] allocWithZone:zone] initWithDictionary:[self attributedDictionary]];
}

@end
