//
//  BSQuizViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/11/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSQuizViewController.h"

@interface BSQuizViewController ()

@end

@implementation BSQuizViewController
{
    BSQuestionGenerator *questionObject;
    int questionCount;
    CGRect quizViewInitialFrame;
    CGRect quizViewRightFrame;
    CGRect quizviewLeftFrame;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    questionCount = 0;
    [self setUpQuizViewFrames];
}

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) setUpQuizViewFrames{
    quizViewInitialFrame = quizviewLeftFrame = quizViewRightFrame = _quizView.frame;
    quizViewRightFrame.origin.x += 500;
    quizviewLeftFrame.origin.x -= 500;
}

- (void)advanceQuestions{
    
    // lazy load questions
    if (!questionObject) {
        questionObject = [BSQuestionGenerator new];
    }
    
    if (questionCount %2 == 0) {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [_quizView setFrame:quizViewRightFrame];
            [_quizView setAlpha:0.0];
            
        } completion:^(BOOL finished) {
            
            [_quizView setFrame:quizviewLeftFrame];
            [_quizView setAlpha:0.0];
            [_quizView loadQuestionFromDictionary:[questionObject getNextQuestion]];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [_quizView setFrame:quizViewInitialFrame];
                [_quizView setAlpha:1.0];
                
            } completion:nil];
        }];
        
    }else{
        [_quizView showAnswer];
    }
    questionCount++;
}

- (IBAction)handleGestures:(UIGestureRecognizer *)sender{
    if ([sender class] == [UITapGestureRecognizer class]) {
        if (questionCount % 2 == 1) {
            [self advanceQuestions];
        }
    }else if ([sender class] == [UISwipeGestureRecognizer class]){
        [self advanceQuestions];
        if (questionCount % 2 == 0) {
            [self advanceQuestions];
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self advanceQuestions];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
