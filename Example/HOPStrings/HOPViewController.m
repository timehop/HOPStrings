//
//  HOPViewController.m
//  HOPStrings
//
//  Created by Chris Trott on 04/13/2015.
//  Copyright (c) 2014 Chris Trott. All rights reserved.
//

#import "HOPViewController.h"

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
    self.label.text = @"doc troll me";
    [self.view addSubview:self.label];

    [self.segmentedControl setSelectedSegmentIndex:0];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    CGFloat const viewWidth = CGRectGetWidth(self.view.bounds);
    self.segmentedControl.frame = CGRectMake(0, 40, viewWidth, 50);

    self.label.frame = CGRectMake(0, 140, viewWidth, 300);
}

- (void)segmentDidChange:(UISegmentedControl *)control {
    NSInteger index = [control selectedSegmentIndex];
    if (index == 0) {

    } else if (index == 1) {

    } else if (index == 2) {

    } else if (index == 3) {

    } else if (index == 4) {

    }
    NSLog(@"%@", @(index));
}

@end
