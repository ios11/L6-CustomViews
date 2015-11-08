//
//  StoryboardViewController.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "StoryboardViewController.h"
#import "VKPostView.h"
#import "VKPostView+VKPost.h"
#import "VKPostDataSource.h"

@interface StoryboardViewController ()

@property (strong, nonatomic) VKPostDataSource *dataSource;
@property (weak, nonatomic) IBOutlet VKPostView *postView;

@end

@implementation StoryboardViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dataSource = [[VKPostDataSource alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.postView configureWithPost:[self.dataSource randomPost]];
}

- (IBAction)refresh:(id)sender {
    [self.postView configureWithPost:[self.dataSource randomPost]];
}

- (IBAction)comment:(id)sender {
    [self alertWithMessage:@"comment:"];
}

- (IBAction)like:(id)sender {
    [self alertWithMessage:@"like:"];
}

- (IBAction)more:(id)sender {
    [self alertWithMessage:@"more:"];
}

- (void)alertWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
