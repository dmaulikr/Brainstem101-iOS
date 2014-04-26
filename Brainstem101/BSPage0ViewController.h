//
//  BSPage0ViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSFuckometerView.h"
#import "BSQuestionGenerator.h"
#import "BSTutorialImageView.h"

@interface BSPage0ViewController : UIViewController <BSTutorialImageViewDelegate>

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIImageView *backgroundOverlayImageView;
@property (strong, nonatomic) UIImageView *tagImageView;

@property (strong, nonatomic) BSFuckometerView *fuckometerView;

@property (strong, nonatomic) UIButton *atlasButton;
@property (strong, nonatomic) UIButton *clinicalButton;
@property (strong, nonatomic) UIButton *quizButton;
@property (strong, nonatomic) UIButton *tutorialButton;
@property (strong, nonatomic) UIButton *aboutButton;

@end
