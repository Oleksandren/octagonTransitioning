//
//  OLNTransitioningDelegate.m
//  AnimationNagitionController
//
//  Created by Oleksandr Nechet on 10.04.15.
//  Copyright (c) 2015 Oleksandr Nechet. All rights reserved.
//

#import "OLNTransitioningDelegate.h"

#define PERSPECTIVE 1.0 / 200.0
#define ROTATION_ANGLE M_PI/4

@implementation OLNTransitioningDelegate

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    
    //Calculate the direction
    int dir = self.operation == UINavigationControllerOperationPop ? -1 : 1;
    
    //Create the differents 3D animations
    CATransform3D viewFromTransform;
    CATransform3D viewToTransform;
    
    //We create a content view for do the translate animation
    UIView *generalContentView = [transitionContext containerView];
    viewFromTransform = CATransform3DMakeRotation(dir*ROTATION_ANGLE, 0.0, 1.0, 0.0);
    viewToTransform = CATransform3DMakeRotation(-dir*ROTATION_ANGLE, 0.0, 1.0, 0.0);
    [toView.layer setAnchorPoint:CGPointMake(dir==1?0:1, 0.5)];
    [fromView.layer setAnchorPoint:CGPointMake(dir==1?1:0, 0.5)];
    
    [generalContentView setTransform:CGAffineTransformMakeTranslation(dir*(generalContentView.frame.size.width)/2.0, 0)];
    
    
    
    viewFromTransform.m34 = PERSPECTIVE;
    viewToTransform.m34 = PERSPECTIVE;
    
    toView.layer.transform = viewToTransform;
    
    //Create the shadow
    UIView *fromShadow = [self addOpacityToView:fromView withColor:[UIColor clearColor]];
    UIView *toShadow = [self addOpacityToView:toView withColor:[UIColor clearColor]];
    [fromShadow setAlpha:0.0];
    [toShadow setAlpha:0.0];
    
    //Add the to- view
    [generalContentView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [generalContentView setTransform:CGAffineTransformMakeTranslation(-dir*generalContentView.frame.size.width/2.0, 0)];
        fromView.layer.transform = viewFromTransform;
        toView.layer.transform = CATransform3DIdentity;
        
        [fromShadow setAlpha:0.0];
        [toShadow setAlpha:0.0];
        
    } completion:^(BOOL finished) {
        
        //Set the final position of every elements transformed
        [generalContentView setTransform:CGAffineTransformIdentity];
        fromView.layer.transform = CATransform3DIdentity;
        toView.layer.transform = CATransform3DIdentity;
        [fromView.layer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
        [toView.layer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
        
        [fromShadow removeFromSuperview];
        [toShadow removeFromSuperview];
        
        if ([transitionContext transitionWasCancelled]) {
            [toView removeFromSuperview];
        } else {
            [fromView removeFromSuperview];
        }
        
        // inform the context of completion
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

- (UIView *)addOpacityToView:(UIView *) view withColor:(UIColor *)theColor
{
    UIView *shadowView = [[UIView alloc] initWithFrame:view.bounds];
    [shadowView setBackgroundColor:[theColor colorWithAlphaComponent:0.8]];
    [view addSubview:shadowView];
    return shadowView;
}

@end
