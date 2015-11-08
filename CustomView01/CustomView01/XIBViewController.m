//
//  XIBViewController.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "XIBViewController.h"
#import "VKPostView.h"
#import "VKPostView+VKPost.h"
#import "VKPostDataSource.h"

@interface XIBViewController ()

@property (strong, nonatomic) VKPostDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) VKPostView *lastPostView;

@end

@implementation XIBViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dataSource = [[VKPostDataSource alloc] init];
}

- (CGRect)randomPostFrame {
    CGFloat width = 100.f + arc4random() % (NSInteger)(CGRectGetWidth(self.view.bounds) - 100.f);
    CGFloat height = 200.f + arc4random() % MIN(500, (NSInteger)(CGRectGetHeight(self.view.bounds) - 200.f));
    CGFloat x = arc4random() % (NSInteger)(CGRectGetWidth(self.view.bounds) - width);
    CGFloat y = arc4random() % (NSInteger)(CGRectGetHeight(self.view.bounds) - height);

    return CGRectMake(x, y, width, height);
}

- (IBAction)add:(id)sender {
    VKPostView *postView = [VKPostView loadFromNib];
    [postView configureWithPost:[self.dataSource randomPost]];

    [postView.moreButton addTarget:self action:@selector(more:)
                  forControlEvents:UIControlEventTouchUpInside];
    [postView.likeButton addTarget:self action:@selector(like:)
                  forControlEvents:UIControlEventTouchUpInside];
    [postView.commentButton addTarget:self action:@selector(comment:)
                     forControlEvents:UIControlEventTouchUpInside];

    postView.frame = [self randomPostFrame];
    [self.view insertSubview:postView belowSubview:self.addButton];

    _lastPostView.alpha = 0.5f;
    _lastPostView = postView;
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
