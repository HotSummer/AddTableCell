//
//  LampLabel.m
//  AddTableCell
//
//  Created by bangqian zhu on 12-7-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LampLabel.h"

@implementation LampLabel
@synthesize motionWidth;

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        motionWidth = 200;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    float w = self.frame.size.width;
    if (motionWidth >= w) {
        return;
    }
    CGRect frame = self.frame;
    frame.origin.x = 320;
    self.frame = frame;
    
    [UIView beginAnimations:@"textAnimation" context:nil];
    [UIView setAnimationDuration:8.0f*(w<320?320:w)/320];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:LONG_MAX];
    
    frame = self.frame;
    frame.origin.x = -w;
    self.frame = frame;
    [UIView commitAnimations];
}

- (void)dealloc{
    [super dealloc];
}

@end
