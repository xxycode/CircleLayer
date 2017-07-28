//
//  CircleLayer.m
//  circle
//
//  Created by godlike on 17/7/28.
//  Copyright © 2017年 godlike. All rights reserved.
//

#import "CircleLayer.h"
#import <UIKit/UIKit.h>

@interface CircleLayer()

@property (nonatomic, weak) CAShapeLayer *cLayer;

@property (nonatomic, strong) UIBezierPath *cPath;

@end

@implementation CircleLayer

+ (instancetype)layer{
    CircleLayer *layer = [[self alloc] init];
    layer.frame = CGRectMake(0, 0, 80, 80);
    return layer;
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self customInit];
        
        return self;
    }
    return nil;
}

- (void)customInit{
    _cPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40 , 40)
                                                         radius:40
                                                     startAngle:0
                                                       endAngle:2 * M_PI
                                                      clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [self addSublayer:shapeLayer];
    _cLayer = shapeLayer;
    _cLayer.frame = CGRectMake(0, 0, 80, 80);
    _cLayer.strokeColor = [UIColor blueColor].CGColor;
    _cLayer.path = _cPath.CGPath;
    _cLayer.fillColor = [UIColor clearColor].CGColor;
    _cLayer.strokeStart = 0.0f;
    _cLayer.strokeEnd = 0.0f;
    _cLayer.lineWidth = 2;
    
    CABasicAnimation *endAni = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAni.fromValue = @0.0f;
    endAni.toValue = @1.0f;
    endAni.duration = 0.8;
    endAni.fillMode = kCAFillModeForwards;
    //endAni.repeatCount = INT_MAX;
    
    CABasicAnimation *startAni = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAni.fromValue = @0.0f;
    startAni.toValue = @1.0f;
    startAni.duration = 0.8;
    startAni.beginTime = 0.4;
    //startAni.repeatCount = INT_MAX;
    
    CAAnimationGroup *pathAnimation = [CAAnimationGroup animation];
    pathAnimation.animations = @[endAni,startAni];
    pathAnimation.duration = 1.2;
    pathAnimation.repeatCount = INT_MAX;
    
    CABasicAnimation *rAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rAni.fromValue = @0.0f;
    rAni.toValue = @(2 * M_PI);
    rAni.duration = 1.2;
    rAni.repeatCount = INT_MAX;
    
    [_cLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
    [_cLayer addAnimation:rAni forKey:@"rAni"];
    
    
}

@end
