//
//  BSQuizViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/11/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSQuestionGenerator.h"
#import "BSQuizView.h"

@interface BSQuizViewController : UIViewController

@property (strong, nonatomic) IBOutlet BSQuizView *quizView;

- (IBAction)backAction:(id)sender;

@end
