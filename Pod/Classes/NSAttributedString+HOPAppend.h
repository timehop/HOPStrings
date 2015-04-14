//
//  Pods
//
//

@import Foundation;

#pragma mark -

@interface NSAttributedString (HOPAppend)

/// Create a new NSAttributedString by appending `string` to the receiver.
- (instancetype)hop_stringByAppendingAttributedString:(NSAttributedString *)string;

@end
