//
//  VKPostDataSource.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostDataSource.h"

@interface VKPostDataSource ()

@property (nonatomic, copy) NSArray *usernames;
@property (nonatomic, copy) NSArray *avatarNames;
@property (nonatomic, copy) NSString *hipsumText;

@end

@implementation VKPostDataSource

- (instancetype)init {
    if (self = [super init]) {
        _usernames = @[ @"Ксения Федотова",
                        @"Аврора Дьячкова",
                        @"Руслана Авдеева",
                        @"Катерина Медведева",
                        @"Астра Суворова",
                        @"Полина Мясникова",
                        @"Магдалина Емельянова",
                        @"Викторина Юдина",
                        @"Сюзанна Гаскарова" ];
        _avatarNames = @[ @"avatar",
                          @"avatar1",
                          @"avatar2",
                          @"avatar3",
                          @"avatar4",
                          @"avatar5",
                          @"avatar6",
                          @"avatar7" ];
        _hipsumText = @"Farm-to-table blog distillery offal, echo park lomo williamsburg. Crucifix organic quinoa, kitsch vinyl artisan dreamcatcher hashtag salvia everyday carry viral forage tumblr raw denim chambray. Banh mi tilde VHS, retro disrupt pug wolf kombucha lumbersexual meggings chia. Meh mustache sriracha franzen, flexitarian cold-pressed biodiesel ugh raw denim waistcoat green juice neutra. Hoodie celiac tofu lumbersexual meditation pop-up franzen, typewriter seitan wayfarers food truck. Normcore pinterest disrupt, fingerstache heirloom pop-up shabby chic food truck four loko meggings. Hella butcher keffiyeh keytar.";
    }
    return self;
}

- (VKPost *)randomPost {
    NSString *username = self.usernames[arc4random() % self.usernames.count];
    UIImage *avatar = [UIImage imageNamed:self.avatarNames[arc4random() % self.avatarNames.count]];
    NSString *text = [self.hipsumText substringToIndex:arc4random() % self.hipsumText.length];

    return [[VKPost alloc] initWithUsername:username avatar:avatar text:text];
}

@end
