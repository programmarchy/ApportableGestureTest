//
//  TestScrollViewNode.m
//  ApportableGestureTest
//
//  Created by Donald Ness on 2/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "TestScrollViewNode.h"

@implementation TestScrollViewNode

- (void)onEnter
{
    [super onEnter];
    self.userInteractionEnabled = YES;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.opacity = 0.5;
}

- (void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.opacity = 1.0;
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.opacity = 1.0;
}

@end
