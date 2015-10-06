//
//  ViewController.m
//  AnimationNagitionController
//
//  Created by Oleksandr Nechet on 21.03.15.
//  Copyright (c) 2015 Oleksandr Nechet. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (BOOL)nonAnim
{
    return YES;
}

- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
