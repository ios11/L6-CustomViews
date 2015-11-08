//
//  ProgressView.m
//  CustomView02
//
//  Created by Nikolay Morev on 08/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (void)setup {
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    self.clipsToBounds = NO;

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tapRecognizer];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setNeedsDisplay];
}

- (void)setProgress:(float)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    switch (tap.state) {
        case UIGestureRecognizerStatePossible:
            self.highlighted = YES;
            break;

        case UIGestureRecognizerStateRecognized:
            self.highlighted = NO;
            [self sendActionsForControlEvents:UIControlEventTouchUpInside];
            break;

        default:
            break;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

    UIColor *color = (self.highlighted
                      ? [self.tintColor colorWithAlphaComponent:0.7f]
                      : self.tintColor);
    CGFloat diameter = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));

    // Круг обводки

    CGContextTranslateCTM(context, CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGContextAddArc(context, 0.f, 0.f, diameter/2.f - 1.f, 0, 2*M_PI, 0);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1.f);
    CGContextStrokePath(context);

    // Круг прогресса

    CGContextAddArc(context, 0.f, 0.f, diameter/2.f - 2.f,
                    -M_PI_2, -M_PI_2 + self.progress * 2 * M_PI, 0);
    CGContextSetLineWidth(context, 3.f);
    CGContextStrokePath(context);

    // Квадрат

    CGFloat side = diameter * 2.f / 5.f;
    CGContextTranslateCTM(context, -side/2.f, -side/2.f);
    CGContextAddRect(context, CGRectMake(0.f, 0.f, side, side));
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
}

@end
