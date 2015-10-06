//
//  AppDelegate.m
//  AnimationNagitionController
//
//  Created by Oleksandr Nechet on 21.03.15.
//  Copyright (c) 2015 Oleksandr Nechet. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIImageView *bckg = [[UIImageView alloc]initWithFrame:self.window.frame];
    bckg.image =[UIImage imageNamed:@"backgroundVC1080x1920"];
    [self.window addSubview:bckg];
    return YES;
}

@end
