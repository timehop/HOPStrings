//
//  Pods
//
//

@import UIKit;

#pragma mark -

@interface HOPStringAttributes : NSObject

# pragma mark - NSAttributedString Attributes

/// NSFontAttributeName
@property (nonatomic, strong) UIFont *font;

/// NSForegroundColorAttributeName
@property (nonatomic, strong) UIColor *foregroundColor;

/// NSBackgroundColorAttributeName
@property (nonatomic, strong) UIColor *backgroundColor;

/// NSLigatureAttributeName
@property (nonatomic, strong) NSNumber *ligature;

/// NSKernAttributeName
@property (nonatomic, strong) NSNumber *kern;

/// NSStrikethroughStyleAttributeName
@property (nonatomic, strong) NSNumber *strikethroughStyle;

/// NSUnderlineStyleAttributeName
@property (nonatomic, strong) NSNumber *underlineStyle;

/// NSStrokeColorAttributeName
@property (nonatomic, strong) UIColor *strokeColor;

/// NSStrokeWidthAttributeName
@property (nonatomic, strong) NSNumber *strokeWidth;

/// NSShadowAttributeName
@property (nonatomic, strong) NSShadow *shadow;

/// NSTextEffectAttributeName
@property (nonatomic, copy) NSString *textEffect;

/// NSBaselineOffsetAttributeName
@property (nonatomic, strong) NSNumber *baselineOffset;

/// NSUnderlineColorAttributeName
@property (nonatomic, strong) UIColor *underlineColor;

/// NSStrikethroughColorAttributeName
@property (nonatomic, strong) UIColor *strikethroughColor;

# pragma mark - NSParagraphStyle Attributes

@property(nonatomic, assign) CGFloat lineSpacing;
@property(nonatomic, assign) CGFloat paragraphSpacing;
@property(nonatomic, assign) NSTextAlignment alignment;
@property(nonatomic, assign) CGFloat firstLineHeadIndent;
@property(nonatomic, assign) CGFloat headIndent;
@property(nonatomic, assign) CGFloat tailIndent;
@property(nonatomic, assign) NSLineBreakMode lineBreakMode;
@property(nonatomic, assign) CGFloat minimumLineHeight;
@property(nonatomic, assign) CGFloat maximumLineHeight;
@property(nonatomic, assign) NSWritingDirection baseWritingDirection;
@property(nonatomic, assign) CGFloat lineHeightMultiple;
@property(nonatomic, assign) CGFloat paragraphSpacingBefore;
@property(nonatomic, assign) float hyphenationFactor;
@property(nonatomic, copy) NSArray *tabStops;
@property(nonatomic, assign) CGFloat defaultTabInterval;

# pragma mark - Output

/// Creates a NSDictionary to be used as a NSAttributedString's attributes
- (NSDictionary *)attributedDictionary;

@end
