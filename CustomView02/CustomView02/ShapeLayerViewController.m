//
//  ShapeLayerViewController.m
//  CustomView02
//
//  Created by Nikolay Morev on 08/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "ShapeLayerViewController.h"
#import "ShapeProgressView.h"

@interface ShapeLayerViewController ()

@property (weak, nonatomic) IBOutlet ShapeProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateProgressWithSliderValue];
}

- (CGRect)randomProgressViewFrame {
    CGFloat width = 16.f + arc4random() % (256 - 16);
    CGFloat height = 16.f + arc4random() % (256 - 16);
    CGFloat x = arc4random() % (NSInteger)(CGRectGetWidth(self.view.bounds) - width);
    CGFloat y = arc4random() % (NSInteger)(CGRectGetHeight(self.view.bounds) - height);

    return CGRectMake(x, y, width, height);
}

- (IBAction)newFrame:(id)sender {
    self.progressView.frame = [self randomProgressViewFrame];
}

- (void)updateProgressWithSliderValue {
    self.progressView.progress = self.slider.value;
}

- (IBAction)sliderValueChanged:(id)sender {
    [self updateProgressWithSliderValue];
}

- (IBAction)stop:(id)sender {
    [self alertWithMessage:@"stop:"];
}

- (void)alertWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
