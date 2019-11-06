//
//  UIView+NewUIView.h
//  PageStory
//
//  Created by Sznur on 23.12.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationStyle) {
    AOAnimationPop = 11,
    AOAnimationPopAndBack = 12,
    AOAnimationPopFrontAndDraw = 13,
    AOAnimationCurtineTop = 21,
    AOAnimationCurtineRight = 22,
    AOAnimationCurtineBottom = 23,
    AOAnimationCurtineLeft = 24,
    AOAnimationFlyInTop = 31,
    AOAnimationFlyInRight = 32,
    AOAnimationFlyInBottom = 33,
    AOAnimationFlyInLeft = 34,
    AOAnimationPushUp = 41,
    AOAnimationInfinitePulse = 51,
    AOAnimationInfiniteHustawka = 52,
    AOAnimationInfiniteSpin = 53,
    AOAnimationSlideTop = 61,
    AOAnimationSlideRight = 62,
    AOAnimationSlideBottom = 63,
    AOAnimationSlideLeft = 64,
    AOAnimationRotate = 71,
    AOAnimationRotationAdd = 72,
    AOAnimationLoopBlink = 81,
    AOAnimationAutoHide = 91,
    AOAnimation3DFlipLeft = 101,
    AOAnimation3DPaper = 102,
    AOAnimationTransformMakePre = 111,
    AOAnimationSpecialBalon = 121,
};

typedef NS_ENUM(NSInteger, AnimationCurtineStyle) {
    AOAnimationCurtineCurtineRight = 22,
    AOAnimationCurtineCurtineBottom = 23,
    AOAnimationCurtineCurtineChange = 11,
};

@interface UIView (NewUIView)

+ (void)anime:(UIView*)obj style:(int)style;

- (void)aoAnimation:(AnimationStyle)animationStyle option:(UIViewAnimationOptions)options duration:(float)duration delay:(float)delay startScale:(float)startScale startAlpha:(float)startAlpha angle:(float)startAngle valueOne:(float)valueOne valueTwo:(float)valueTwo;

- (void)aoAnimationCurtine:(AnimationStyle)animationStyle option:(UIViewAnimationOptions)options duration:(float)duration delay:(float)delay startScale:(float)startScale startAlpha:(float)startAlpha startValue:(float)startValue stopValue:(float)stopValue;

@end
