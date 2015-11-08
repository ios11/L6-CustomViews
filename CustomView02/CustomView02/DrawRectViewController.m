//
//  DrawRectViewController.m
//  CustomView02
//
//  Created by Nikolay Morev on 08/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "DrawRectViewController.h"
#import "ProgressView.h"

@interface DrawRectViewController ()

@property (weak, nonatomic) ProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DrawRectViewController

- (CGRect)randomProgressViewFrame {
    CGFloat width = 16.f + arc4random() % (256 - 16);
    CGFloat height = 16.f + arc4random() % (256 - 16);
    CGFloat x = arc4random() % (NSInteger)(CGRectGetWidth(self.view.bounds) - width);
    CGFloat y = arc4random() % (NSInteger)(CGRectGetHeight(self.view.bounds) - height);

    return CGRectMake(x, y, width, height);
}

- (IBAction)add:(id)sender {
    ProgressView *progressView = [[ProgressView alloc] initWithFrame:[self randomProgressViewFrame]];
    [progressView addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:progressView belowSubview:self.addButton];
    _progressView = progressView;
    [self updateProgressWithSliderValue];
}

- (void)updateProgressWithSliderValue {
    self.progressView.progress = self.slider.value;
}

- (IBAction)sliderValueChanged:(id)sender {
    [self updateProgressWithSliderValue];
}

- (void)stop:(id)sender {
    [self alertWithMessage:@"stop:"];
}

- (void)alertWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
