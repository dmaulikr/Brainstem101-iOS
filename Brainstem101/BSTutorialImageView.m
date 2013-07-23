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

- (id)init
{
    self = [super init];
    if (self) {
        CGRect tutorialFrame = [[UIScreen mainScreen] bounds];
        [self setFrame:tutorialFrame];
        
        [self setUserInteractionEnabled:YES];
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitButton addTarget:self action:@selector(quitTutorial:) forControlEvents:UIControlEventTouchUpInside];
        [_exitButton setFrame: CGRectMake(tutorialFrame.size.width - exitButtonWidthHeight , tutorialFrame.size.height - exitButtonWidthHeight, exitButtonWidthHeight, exitButtonWidthHeight)];
        [self addSubview:_exitButton];
        
        [[BSModel sharedModel] setInTutorialMode:YES];
    }
    return self;
}

+ (BSTutorialImageView *) page0Tutorial {
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView page0Tutorial];
    return tutorialView;
}

+ (BSTutorialImageView *) atlasTutorial {
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView atlasTutorial];
    return tutorialView;
}

+ (BSTutorialImageView *) clinicalTutorial{
    BSTutorialImageView *tutorialView = [[BSTutorialImageView alloc] init];
    [tutorialView clinicalTutorial];
    return tutorialView;
}

- (void)quitTutorial:(UIButton *) sender{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        [self setAlpha:0.0];
    } completion:^(BOOL finished) {
        [[BSModel sharedModel] setInTutorialMode:NO];
        [_exitButton removeFromSuperview];
        [self removeFromSuperview];
        [_delegate dissmissTutorialImageView:self];
    }];
}

-(void) page0Tutorial {
    [self setImage:[UIImage imageNamed:@"tutorial-page0.png"]];
}

-(void) atlasTutorial{
    [self setImage:[UIImage imageNamed:@"tutorial-atlas.png"]];
}

-(void) clinicalTutorial{
    [self setImage:[UIImage imageNamed:@"tutorial-clinical.png"]];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL pointInside = NO;
    if (CGRectContainsPoint(_exitButton.frame, point)){
        pointInside = YES;
    }
    return pointInside;
}

@end
