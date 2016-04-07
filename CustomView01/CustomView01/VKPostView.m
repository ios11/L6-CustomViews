//
//  VKPostView.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostView.h"

@implementation VKPostView

+ (instancetype)loadFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *nibName = @"VKPostView";
    NSArray *nibObjects = [bundle loadNibNamed:nibName owner:nil options:nil];
    return nibObjects.firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.commentButton.layer.cornerRadius = 3.f;
    self.likeButton.layer.cornerRadius = 3.f;
    self.avatarImageView.layer.cornerRadius = 21.f;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.borderWidth = 1.f;
    self.avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.cornerRadius = 4.f;
}

@end
