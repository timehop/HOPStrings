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

@property (nonatomic) UISegmentedControl *segmentedControl;
@property (nonatomic) UILabel *label;

@end

@implementation HOPViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    NSArray *items = @[ @"1", @"2", @"3", @"4", @"5" ];
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

    CGFloat const viewWidth = CGRectGetWidth(self.view.bounds);
    self.segmentedControl.frame = CGRectMake(0, 40, viewWidth, 50);

    self.label.frame = CGRectMake(0, 140, viewWidth, 300);
}

- (void)segmentDidChange:(UISegmentedControl *)control {
    NSInteger index = [control selectedSegmentIndex];

    HOPString *string;
    if (index == 0) {
        string =
            [[[[[HOPString
                string:@"Start with some base attributes\n"
                    withCascadingAttributesBlock:^(HOPStringAttributes *attr) {
                        attr.font = [UIFont fontWithName:@"avenir" size:18];
                        attr.foregroundColor = [UIColor colorWithWhite:0.2 alpha:1];
                    }]
                cascadeAppendString:@"Add some more with the same attributes\n"]
                cascadeAppendString:@"Same thing but this time add some flair\n"
                    attributesBlock:^(HOPStringAttributes *attr) {
                        attr.underlineStyle = @(NSUnderlineStyleThick|NSUnderlinePatternDashDot);
                        attr.underlineColor = [UIColor blueColor];
                        attr.strokeWidth = @3;
                    }]
                cascadeAppendString:@"Cascade only uses the initial attributes\n"]
                cascadeAppendString:@"You can also override the cascade.\n"
                    attributesBlock:^(HOPStringAttributes *attr) {
                        attr.foregroundColor = [UIColor colorWithWhite:0.8 alpha:1];
                        attr.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
                    }];
    } else if (index == 1) {

    } else if (index == 2) {

    } else if (index == 3) {

    } else if (index == 4) {

    }
    self.label.attributedText = [string attributedString];
}

@end
