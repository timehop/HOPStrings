//
//  Pods
//
//

@import UIKit;

#pragma mark -

/// Property storage and arbitration between NSAttributedString dictionary attribute keys
/// and NSParagraphStyle attributes.
@interface HOPStringAttributes : NSObject <NSCopying>

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

@property(nonatomic, strong) NSNumber *lineSpacing; // CGFloat
@property(nonatomic, strong) NSNumber *paragraphSpacing; // CGFloat
@property(nonatomic, strong) NSNumber *alignment; // NSTextAlignment
@property(nonatomic, strong) NSNumber *firstLineHeadIndent; // CGFloat
@property(nonatomic, strong) NSNumber *headIndent; // CGFloat
@property(nonatomic, strong) NSNumber *tailIndent; // CGFloat
@property(nonatomic, strong) NSNumber *lineBreakMode; // NSLineBreakMode
@property(nonatomic, strong) NSNumber *minimumLineHeight; // CGFloat
@property(nonatomic, strong) NSNumber *maximumLineHeight; // CGFloat
@property(nonatomic, strong) NSNumber *baseWritingDirection; // NSWritingDirection
@property(nonatomic, strong) NSNumber *lineHeightMultiple; // CGFloat
@property(nonatomic, strong) NSNumber *paragraphSpacingBefore; // CGFloat
@property(nonatomic, strong) NSNumber *hyphenationFactor; // float
@property(nonatomic, copy) NSArray *tabStops;
@property(nonatomic, strong) NSNumber *defaultTabInterval; // CGFloat

# pragma mark - Output

/// Creates an NSDictionary to be used as a NSAttributedString's attributes
- (NSDictionary *)attributedDictionary;

@end
