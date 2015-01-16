//
//  BSTutorialImageView.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/23/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSTutorialImageView.h"

const static int exitButtonWidthHeight = 150;

@implementation BSTutorialImageView
{
    CGRect yesButtonFrame;
    CGRect noButtonFrame;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGRect tutorialFrame = [[UIScreen mainScreen] bounds];
        [self setFrame:tutorialFrame];
        
        yesButtonFrame = CGRectMake(290, 485, 90, 90);
        noButtonFrame = CGRectMake(410, 485, 90, 90);
        
        [self setUserInteractionEnabled:YES];
        self.exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.exitButton addTarget:self action:@selector(quitTutorial:) forControlEvents:UIControlEventTouchUpInside];
        [self.exitButton setFrame: CGRectMake(tutorialFrame.size.width - exitButtonWidthHeight , tutorialFrame.size.height - exitButtonWidthHeight, exitButtonWidthHeight, exitButtonWidthHeight)];
        [self addSubview:_exitButton];
        
        [[BSModel sharedModel] setInTutorialMode:YES];
    }
    return self;
}


+ (BSTutorialImageView *)askTutorial
{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView askTutorial];
    return tutorialView;
}

+ (BSTutorialImageView *)page0Tutorial
{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView page0Tutorial];
    return tutorialView;
}

+ (BSTutorialImageView *)atlasTutorial
{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView atlasTutorial];
    return tutorialView;
}

+ (BSTutorialImageView *)clinicalTutorial
{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView clinicalTutorial];
    return tutorialView;
}

+ (BSTutorialImageView *)profileTutorial
{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView profileTutorial];
    return tutorialView;
}

+ (BSTutorialImageView *)quizTutorial
{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView quizTutorial];
    return tutorialView;
}

- (void)quitTutorial:(UIButton *)sender
{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        [self setAlpha:0.0];
    } completion:^(BOOL finished) {
        [[BSModel sharedModel] setInTutorialMode:NO];
        [_exitButton removeFromSuperview];
        [self removeFromSuperview];
        [_delegate dissmissTutorialImageView:self];
    }];
}

- (void)askTutorial
{
    [self setImage:[UIImage imageNamed:@"tutorial-ask"]];
    
    UIButton *yesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [yesButton setFrame:yesButtonFrame];
    [yesButton addTarget:self action:@selector(userRespondedYes) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:yesButton];
    
    UIButton *noButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [noButton setFrame:noButtonFrame];
    [noButton addTarget:self action:@selector(userRespondedNo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:noButton];
}

- (void)userRespondedYes
{
    for (UIView *view in self.subviews) {
        if (view != _exitButton) {
            [view removeFromSuperview];
        }
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self page0Tutorial];
        [UIView animateWithDuration:0.5 animations:^{
            [self setAlpha:1];
        }];
    }];
}

- (void)userRespondedNo
{
    [self quitTutorial:nil];
}

- (void)page0Tutorial
{
    [self setImage:[UIImage imageNamed:@"tutorial-page0"]];
}

- (void)atlasTutorial
{
    [self setImage:[UIImage imageNamed:@"tutorial-atlas"]];
}

- (void)clinicalTutorial
{
    [self setImage:[UIImage imageNamed:@"tutorial-clinical"]];
}

- (void)profileTutorial
{
    [self setImage:[UIImage imageNamed:@"tutorial-profile"]];
}

- (void)quizTutorial
{
    [self setImage:[UIImage imageNamed:@"tutorial-quiz"]];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(_exitButton.frame, point) || CGRectContainsPoint(yesButtonFrame, point) || CGRectContainsPoint(noButtonFrame, point)){
        return YES;
    }
    return NO;
}

@end
