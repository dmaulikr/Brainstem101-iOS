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

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIImageView *tagImageView;
@property (strong, nonatomic) IBOutlet UIButton *atlasButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *clinicalButtons;
@property (strong, nonatomic) IBOutlet BSFuckometerView *fuckometerView;

- (IBAction)enterTutorial:(id)sender;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)quizAction:(id)sender;

@end
