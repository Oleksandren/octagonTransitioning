//
//  OLNNavigationControllerDelegate.m
//  AnimationNagitionController
//
//  Created by Oleksandr Nechet on 10.04.15.
//  Copyright (c) 2015 Oleksandr Nechet. All rights reserved.
//

#import "OLNNavigationControllerDelegate.h"
#import "OLNTransitioningDelegate.h"

@implementation OLNNavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    OLNTransitioningDelegate * delegate = [OLNTransitioningDelegate new];
    delegate.operation = operation;
    return delegate;
}

@end
