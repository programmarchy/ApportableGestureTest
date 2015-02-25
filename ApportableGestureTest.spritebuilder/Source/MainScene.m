//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@interface MainScene () <CCScrollViewDelegate>

@property (strong, nonatomic) CCScrollView *scrollView;
@property (strong, nonatomic) CCNodeColor *scrollViewBackground;

@end

@implementation MainScene

- (void)onEnter
{
    [super onEnter];
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.contentNode.userInteractionEnabled = YES;
    self.scrollView.delegate = self;
}

- (void)scrollViewWillBeginDragging:(CCScrollView *)scrollView
{
    self.scrollViewBackground.opacity = 0.5;
}

- (void)scrollViewDidEndDragging:(CCScrollView * )scrollView willDecelerate:(BOOL)decelerate
{
    self.scrollViewBackground.opacity = 0.0;
}

@end
