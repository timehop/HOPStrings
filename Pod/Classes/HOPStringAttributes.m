//
//  Pods
//
//

#import "HOPStringAttributes.h"


#pragma mark -

@implementation HOPStringAttributes

- (NSDictionary *)attributedDictionary {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    attributes[NSFontAttributeName] = [self.font copy];
    attributes[NSForegroundColorAttributeName] = [self.foregroundColor copy];
    attributes[NSBackgroundColorAttributeName] = [self.backgroundColor copy];
    attributes[NSLigatureAttributeName] = [self.ligature copy];
    attributes[NSKernAttributeName] = [self.kern copy];
    attributes[NSStrikethroughStyleAttributeName] = [self.strikethroughStyle copy];
    attributes[NSUnderlineStyleAttributeName] = [self.underlineStyle copy];
    attributes[NSStrokeColorAttributeName] = [self.strokeColor copy];
    attributes[NSStrokeWidthAttributeName] = [self.strokeWidth copy];
    attributes[NSShadowAttributeName] = [self.shadow copy];
    attributes[NSTextEffectAttributeName] = [self.textEffect copy];
    attributes[NSBaselineOffsetAttributeName] = [self.baselineOffset copy];
    attributes[NSUnderlineColorAttributeName] = [self.underlineColor copy];
    attributes[NSStrikethroughColorAttributeName] = [self.strikethroughColor copy];
    paragraphStyle.lineSpacing = self.lineSpacing;
    paragraphStyle.paragraphSpacing = self.paragraphSpacing;
    paragraphStyle.alignment = self.alignment;
    paragraphStyle.firstLineHeadIndent = self.firstLineHeadIndent;
    paragraphStyle.headIndent = self.headIndent;
    paragraphStyle.tailIndent = self.tailIndent;
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.minimumLineHeight = self.minimumLineHeight;
    paragraphStyle.maximumLineHeight = self.maximumLineHeight;
    paragraphStyle.baseWritingDirection = self.baseWritingDirection;
    paragraphStyle.lineHeightMultiple = self.lineHeightMultiple;
    paragraphStyle.paragraphSpacingBefore = self.paragraphSpacingBefore;
    paragraphStyle.hyphenationFactor = self.hyphenationFactor;
    paragraphStyle.tabStops = self.tabStops;
    paragraphStyle.defaultTabInterval = self.defaultTabInterval;
    attributes[NSParagraphStyleAttributeName] = [paragraphStyle copy];
    return [attributes copy];
}

@end
