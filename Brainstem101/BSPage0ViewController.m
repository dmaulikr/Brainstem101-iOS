//
//  BSPage0ViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSPage0ViewController.h"

#define LOAD_TIME 5

@implementation BSPage0ViewController{
    BSQuestionGenerator *questionObject;
    int questionCount;
    CGRect quizViewInitialFrame;
    CGRect quizViewRightFrame;
    CGRect quizviewLeftFrame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (UIButton *button in _clinicalButtons) {
        [button setEnabled:NO];
    }
    [_atlasButton setEnabled:NO];
    
}



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    _tagImageView = [[UIImageView alloc] init];
    CGRect newFrame = _backgroundImageView.bounds;
    newFrame.origin.x = newFrame.origin.x + 200;
    [_tagImageView setFrame:newFrame];
    [_tagImageView setImage:[UIImage imageNamed:@"page0-background-tag.png"]];
    [_backgroundImageView addSubview:_tagImageView];
    
    [self runFuckometer];
    
    questionCount = 0;
    [self setUpQuizViewFrames];
    
    if ([[BSModel sharedModel] isFirstLaunch]) {
        
        double delayInSeconds = LOAD_TIME;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self askUserIfTheyWantToSeeTheTutorial];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasLaunched"];
        });
    }else{
        
        if ([[BSModel sharedModel] inTutorialMode]) {
            double delayInSeconds = LOAD_TIME;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self enterTutorial:nil];
            });
        }
    }
}

-(void)askUserIfTheyWantToSeeTheTutorial{
    if (![self.view viewWithTag:8008]) {
        BSTutorialImageView *tutorialView = [BSTutorialImageView askTutorial];
        [tutorialView setDelegate:self];
        [tutorialView setTag:8008];
        [tutorialView setAlpha:0.0];
        [self.view addSubview:tutorialView];
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [tutorialView setAlpha:1.0];
        } completion:nil];
    }
}

-(IBAction) enterTutorial:(id)sender {
    if (![self.view viewWithTag:8008]) {
        BSTutorialImageView *tutorialView = [BSTutorialImageView page0Tutorial];
        [tutorialView setDelegate:self];
        [tutorialView setTag:8008];
        [tutorialView setAlpha:0.0];
        [self.view addSubview:tutorialView];
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [tutorialView setAlpha:1.0];
        } completion:nil];
    }
}

-(void) setUpQuizViewFrames{
    quizViewInitialFrame = quizviewLeftFrame = quizViewRightFrame = _quizView.frame;
    quizViewRightFrame.origin.x += 500;
    quizviewLeftFrame.origin.x -= 500;
}


-(void)runFuckometer {
    if ([[BSModel sharedModel] hasSeenFuckometer]) {
        for (UIButton *button in _clinicalButtons) {
            [button setEnabled:YES];
        }
        [_atlasButton setEnabled:YES];
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_backgroundCoverImageView setAlpha:0.0];
            [_tagImageView setFrame:_backgroundImageView.bounds];
        } completion:nil];

        return;
    }

    [_fuckometerView beginLoadingWithDuration:LOAD_TIME andCallback:^{
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [_backgroundCoverImageView setAlpha:0];
            [_fuckometerView setAlpha:0];
            [_tagImageView setFrame:_backgroundImageView.bounds];
        } completion:^(BOOL finished) {
            for (UIButton *button in _clinicalButtons) {
                [button setEnabled:YES];
            }
            [_atlasButton setEnabled:YES];
            [[BSModel sharedModel] setHasSeenFuckometer:YES];
        }];
    }];
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


- (IBAction)buttonPressed:(UIButton *)sender {
    if (sender == _atlasButton) {
        [self performSegueWithIdentifier:@"page0-to-atlas" sender:self];
    }else if ([_clinicalButtons containsObject: sender] ){
        [self performSegueWithIdentifier:@"page0-to-clinical" sender:self];
    }else{
        NSLog(@"Button action not defined");
    }
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

- (IBAction)dice:(id)sender {
    [self advanceQuestions];
}

#pragma mark BSTutorialImageViewDelegate

-(void)dissmissTutorialImageView:(id)tutorialView{
    tutorialView = nil;
}


#pragma mark System Methods
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Received Memory Warning!");
}

@end
