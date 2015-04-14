//
//  Pods
//
//

#import "NSAttributedString+HOPAppend.h"


#pragma mark -

@implementation NSAttributedString (HOPAppend)

- (instancetype)hop_stringByAppendingAttributedString:(NSAttributedString *)string {
    NSParameterAssert(string != nil);
    NSMutableAttributedString *combinedString = [self mutableCopy];
    [combinedString appendAttributedString:string];
    return [combinedString copy];
}

@end
