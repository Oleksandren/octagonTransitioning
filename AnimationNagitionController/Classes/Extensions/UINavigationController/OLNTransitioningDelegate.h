//
//  OLNTransitioningDelegate.h
//  AnimationNagitionController
//
//  Created by Oleksandr Nechet on 10.04.15.
//  Copyright (c) 2015 Oleksandr Nechet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OLNTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) UINavigationControllerOperation operation;
@end
