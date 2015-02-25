//
//  TestPanRecognizerNode.m
//  ApportableGestureTest
//
//  Created by Donald Ness on 2/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "TestPanRecognizerNode.h"

@interface TestPanRecognizerNode () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIPanGestureRecognizer *panRecognizer;
@property (strong, nonatomic) CCLabelTTF *panRecognizerLabel;
@property (strong, nonatomic) CCNodeColor *backgroundNode;

@end

@implementation TestPanRecognizerNode

- (void)onEnter
{
    [super onEnter];
    self.userInteractionEnabled = YES;
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.panRecognizer.delegate = self;
}

- (void)handlePan:(UIPanGestureRecognizer *)panRecognizer
{
    switch (panRecognizer.state) {
        case UIGestureRecognizerStatePossible:
            self.panRecognizerLabel.string = @"UIGestureRecognizerStatePossible";
            break;
        case UIGestureRecognizerStateBegan:
            self.panRecognizerLabel.string = @"UIGestureRecognizerStateBegan";
            self.backgroundNode.opacity = 0.5;
            break;
        case UIGestureRecognizerStateChanged:
            self.panRecognizerLabel.string = @"UIGestureRecognizerStateChanged";
            break;
        case UIGestureRecognizerStateEnded:
            self.panRecognizerLabel.string = @"UIGestureRecognizerStateEnded";
            self.backgroundNode.opacity = 0.0;
            break;
        case UIGestureRecognizerStateCancelled:
            self.panRecognizerLabel.string = @"UIGestureRecognizerStateCancelled";
            break;
        case UIGestureRecognizerStateFailed:
            self.panRecognizerLabel.string = @"UIGestureRecognizerStateFailed";
            break;
    }
    NSLog(@"handlePan: %@", self.panRecognizerLabel.string);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (!self.visible) return NO;
    if (!self.userInteractionEnabled) return NO;

    // Check that the gesture is in the scroll view
    return [self hitTestWithWorldPos:[touch locationInWorld]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)onEnterTransitionDidFinish
{
    // Add recognizers to view
    UIView *view = [CCDirector sharedDirector].view;
    
    NSMutableArray *recognizers = [view.gestureRecognizers mutableCopy];
    if (!recognizers) recognizers = [NSMutableArray arrayWithCapacity:1];
    [recognizers insertObject:self.panRecognizer atIndex:0];
    
    view.gestureRecognizers = recognizers;
    
    [super onEnterTransitionDidFinish];
}

- (void)onExitTransitionDidStart
{
    // Remove recognizers from view
    UIView *view = [CCDirector sharedDirector].view;
    
    NSMutableArray *recognizers = [view.gestureRecognizers mutableCopy];
    [recognizers removeObject:self.panRecognizer];
    
    view.gestureRecognizers = recognizers;
    
    [super onExitTransitionDidStart];
}

@end
