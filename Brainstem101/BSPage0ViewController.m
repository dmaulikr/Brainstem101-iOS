//
//  BSPage0ViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSPage0ViewController.h"

#define LOAD_TIME 5

@implementation BSPage0ViewController

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
    if (![self.view viewWithTag:(int)@"settingstag"]) {
        _tagImageView = [[UIImageView alloc] init];
        [_tagImageView setTag:(int)@"settingstag"];
        CGRect newFrame = _backgroundImageView.bounds;
        newFrame.origin.x = newFrame.origin.x + 200;
        [_tagImageView setFrame:newFrame];
        [_tagImageView setImage:[UIImage imageNamed:@"page0-background-tag.png"]];
        [_backgroundImageView addSubview:_tagImageView];
    }
    
    [self runFuckometer];
    
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




-(void)runFuckometer {
    if ([[BSModel sharedModel] hasSeenFuckometer]) {
        for (UIButton *button in _clinicalButtons) {
            [button setEnabled:YES];
        }
        [_atlasButton setEnabled:YES];
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_tagImageView setFrame:_backgroundImageView.bounds];
        } completion:nil];

        return;
    }

    [_fuckometerView beginLoadingWithDuration:LOAD_TIME andCallback:^{
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
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



- (IBAction)buttonPressed:(UIButton *)sender {
    if (sender == _atlasButton) {
        [self performSegueWithIdentifier:@"page0-to-atlas" sender:self];
    }else if ([_clinicalButtons containsObject: sender] ){
        [self performSegueWithIdentifier:@"page0-to-clinical" sender:self];
    }else{
        NSLog(@"Button action not defined");
    }
}

- (IBAction)quizAction:(id)sender
{
    [self performSegueWithIdentifier:@"page0-to-quiz" sender:self];
}


- (IBAction)showAboutPage:(id)sender
{
    [self performSegueWithIdentifier:@"page0-to-about" sender:self];
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
