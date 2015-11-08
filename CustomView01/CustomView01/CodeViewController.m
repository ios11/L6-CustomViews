//
//  CodeViewController.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "CodeViewController.h"
#import "VKNiblessPostView.h"
#import "VKNiblessPostView+VKPost.h"
#import "VKPostDataSource.h"

@interface CodeViewController ()

@property (strong, nonatomic) VKPostDataSource *dataSource;
@property (weak, nonatomic) IBOutlet VKNiblessPostView *postView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation CodeViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dataSource = [[VKPostDataSource alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    VKNiblessPostView *postView = self.postView;
    [postView configureWithPost:[self.dataSource randomPost]];
    
    [postView.moreButton addTarget:self action:@selector(more:)
                  forControlEvents:UIControlEventTouchUpInside];
    [postView.likeButton addTarget:self action:@selector(like:)
                  forControlEvents:UIControlEventTouchUpInside];
    [postView.commentButton addTarget:self action:@selector(comment:)
                     forControlEvents:UIControlEventTouchUpInside];
}

- (CGRect)randomPostFrame {
    CGFloat width = 100.f + arc4random() % (NSInteger)(CGRectGetWidth(self.view.bounds) - 100.f);
    CGFloat height = 200.f + arc4random() % MIN(500, (NSInteger)(CGRectGetHeight(self.view.bounds) - 200.f));
    CGFloat x = arc4random() % (NSInteger)(CGRectGetWidth(self.view.bounds) - width);
    CGFloat y = arc4random() % (NSInteger)(CGRectGetHeight(self.view.bounds) - height);

    return CGRectMake(x, y, width, height);
}

- (IBAction)add:(id)sender {
    VKNiblessPostView *postView = [[VKNiblessPostView alloc] initWithFrame:[self randomPostFrame]];
    [postView configureWithPost:[self.dataSource randomPost]];

    [postView.moreButton addTarget:self action:@selector(more:)
                  forControlEvents:UIControlEventTouchUpInside];
    [postView.likeButton addTarget:self action:@selector(like:)
                  forControlEvents:UIControlEventTouchUpInside];
    [postView.commentButton addTarget:self action:@selector(comment:)
                     forControlEvents:UIControlEventTouchUpInside];

    [self.view insertSubview:postView belowSubview:self.addButton];

    _postView.alpha = 0.5f;
    _postView = postView;
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
