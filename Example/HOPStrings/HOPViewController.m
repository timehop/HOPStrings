//
//  HOPViewController.m
//  HOPStrings
//
//  Created by Chris Trott on 04/13/2015.
//  Copyright (c) 2014 Chris Trott. All rights reserved.
//

#import "HOPViewController.h"

#import <HOPStrings/HOPStrings.h>

@interface HOPViewController ()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UISegmentedControl *segmentedControl;
@property (nonatomic) UILabel *label;

@end

@implementation HOPViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"HOPStrings";
    [self.view addSubview:self.titleLabel];

    NSArray *items = @[ @"1", @"2" ];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    [self.segmentedControl addTarget:self action:@selector(segmentDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];

    self.label = [[UILabel alloc] init];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];

    [self.segmentedControl setSelectedSegmentIndex:0];
    [self segmentDidChange:self.segmentedControl];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    CGFloat const margin = 20;
    CGFloat const width = CGRectGetWidth(self.view.bounds) - margin * 2;

    self.titleLabel.frame = CGRectMake(margin, 20, width, 40);

    self.segmentedControl.frame = CGRectMake(margin, 80, width, 50);

    self.label.frame = CGRectMake(margin, 140, width, 300);
}

- (void)segmentDidChange:(UISegmentedControl *)control {
    NSInteger index = [control selectedSegmentIndex];

    __block HOPAttributer *attributer;
    if (index == 0) {
        attributer =
            [[[[[[HOPAttributer
                attributerWithString:@"Start with some default attributes\n"
                    defaultAttributesBlock:^(HOPStringAttributes *attr) {
                        attr.font = [UIFont fontWithName:@"AmericanTypewriter" size:18];
                        attr.foregroundColor = [UIColor colorWithWhite:0.2 alpha:1];
                    }]
                appendString:@"Add some more with the same attributes\n"]
                appendString:@"Same thing but this time add some flair\n"
                    attributesBlock:^(HOPStringAttributes *attr) {
                        attr.underlineStyle = @(NSUnderlineStyleThick|NSUnderlinePatternDashDot);
                        attr.underlineColor = [UIColor blueColor];
                        attr.strokeWidth = @3;
                    }]
                appendString:@"appendString only uses the initial attributes\n"]
                appendString:@"You can also override the default attributes.\n"
                    attributesBlock:^(HOPStringAttributes *attr) {
                        attr.foregroundColor = [UIColor colorWithWhite:0.8 alpha:1];
                        attr.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
                    }]
                appendString:@"Or add a string without any of the defaults."
                    emptyAttributesBlock:^(HOPStringAttributes *attr) {
                        attr.kern = @5;
                    }];
    } else if (index == 1) {
        NSArray *strings = @[ @"Here is how to concat a bunch of strings with newlines:",
                              @"You can use the `appendNewline` method.",
                              @"It will take care of the initial case for you." ];
        attributer =
            [HOPAttributer attributerWithDefaultAttributesBlock:^(HOPStringAttributes *attr) {
                attr.font = [UIFont systemFontOfSize:18];
                attr.foregroundColor = [UIColor colorWithWhite:0.4 alpha:1];
            }];

        [strings enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL *stop) {
            attributer = [[attributer appendNewline] appendString:str];
        }];
    }

    // Unbox the NSAttributedString from HOPAttributer.
    self.label.attributedText = [attributer attributedString];
}

@end
