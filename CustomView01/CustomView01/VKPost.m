//
//  VKPost.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPost.h"

@implementation VKPost

- (instancetype)initWithUsername:(NSString *)username
                          avatar:(UIImage *)avatar
                            text:(NSString *)text {
    if (self = [super init]) {
        _username = [username copy];
        _avatar = avatar;
        _text = [text copy];
    }
    return self;
}

@end
