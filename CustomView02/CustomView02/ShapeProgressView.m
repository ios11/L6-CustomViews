//
//  ShapeProgressView.m
//  CustomView02
//
//  Created by Nikolay Morev on 08/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "ShapeProgressView.h"

@interface ShapeProgressView ()

@property (weak, nonatomic) CAShapeLayer *borderCircleLayer;
@property (weak, nonatomic) CAShapeLayer *progressCircleLayer;
@property (weak, nonatomic) CAShapeLayer *squareLayer;

@end

@implementation ShapeProgressView

- (void)setup {
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    self.clipsToBounds = NO;

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tapRecognizer];

    // Добавляем слои

    CAShapeLayer *borderCircleLayer = [CAShapeLayer layer];
    [self.layer addSublayer:borderCircleLayer];
    _borderCircleLayer = borderCircleLayer;

    CAShapeLayer *progressCircleLayer = [CAShapeLayer layer];
    [self.layer addSublayer:progressCircleLayer];
    _progressCircleLayer = progressCircleLayer;

    CAShapeLayer *squareLayer = [CAShapeLayer layer];
    [self.layer addSublayer:squareLayer];
    _squareLayer = squareLayer;

    // Задаем постоянные свойства

    borderCircleLayer.lineWidth = 1.f;
    borderCircleLayer.fillColor = [UIColor clearColor].CGColor;

    progressCircleLayer.lineWidth = 3.f;
    progressCircleLayer.fillColor = [UIColor clearColor].CGColor;
    progressCircleLayer.strokeEnd = self.progress;

    [self updateColor];
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

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    if (self.layer == layer) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];

        CGFloat diameter = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGFloat side = diameter * 2.f / 5.f;

        self.borderCircleLayer.position = center;
        self.borderCircleLayer.bounds = CGRectMake(0.f, 0.f, diameter, diameter);

        UIBezierPath *borderPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(diameter/2.f, diameter/2.f)
                                                                  radius:diameter/2.f - 1.f
                                                              startAngle:0
                                                                endAngle:2 * M_PI
                                                               clockwise:YES];
        self.borderCircleLayer.path = borderPath.CGPath;

        self.progressCircleLayer.position = center;
        self.progressCircleLayer.bounds = CGRectMake(0.f, 0.f, diameter, diameter);

        UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(diameter/2.f, diameter/2.f)
                                                                    radius:diameter/2.f - 2.f
                                                                startAngle:-M_PI_2
                                                                  endAngle:-M_PI_2 + 2 * M_PI
                                                                 clockwise:YES];
        self.progressCircleLayer.path = progressPath.CGPath;

        self.squareLayer.position = center;
        self.squareLayer.bounds = CGRectMake(0.f, 0.f, side, side);

        UIBezierPath *squarePath = [UIBezierPath bezierPathWithRect:CGRectMake(0.f, 0.f, side, side)];
        self.squareLayer.path = squarePath.CGPath;

        [CATransaction commit];
    }
}

- (void)updateColor {
    UIColor *color = (self.highlighted
                      ? [self.tintColor colorWithAlphaComponent:0.7f]
                      : self.tintColor);
    self.borderCircleLayer.strokeColor = color.CGColor;
    self.progressCircleLayer.strokeColor = color.CGColor;
    self.squareLayer.fillColor = color.CGColor;
}

- (void)setProgress:(float)progress {
    _progress = progress;
    self.progressCircleLayer.strokeEnd = _progress;
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
    [self updateColor];
}

@end
