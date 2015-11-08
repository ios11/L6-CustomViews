//
//  ProgressView.h
//  CustomView02
//
//  Created by Nikolay Morev on 08/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ProgressView : UIControl

@property (nonatomic) IBInspectable float progress;

@property (nonatomic, copy) UIColor *squareColor UI_APPEARANCE_SELECTOR;

@end
