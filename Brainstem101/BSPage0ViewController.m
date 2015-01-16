//
//  BSPage0ViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSPage0ViewController.h"
#import <UIView+Positioning.h>
#import <SVProgressHUD.h>

#define LOAD_TIME 2

@implementation BSPage0ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.backgroundImageView setImage:[UIImage imageNamed:@"master-background"]];
    [self.view addSubview:self.backgroundImageView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.fuckometerView) {
        return;
    }
    
    // add fuckometer
    CGRect fuckometerFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/3.5);
    self.fuckometerView = [[BSFuckometerView alloc] initWithFrame:fuckometerFrame];
    self.fuckometerView.centerY += 270;
    self.fuckometerView.centerX -= 10;
    [self.backgroundImageView addSubview:self.fuckometerView];
    
    [self.fuckometerView beginLoadingWithDuration:LOAD_TIME andCallback:^{
        [UIView animateWithDuration:LOAD_TIME/2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.fuckometerView setAlpha:0];
        } completion:^(BOOL finished) {
            
            // add overlay
            self.backgroundOverlayImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
            [self.backgroundOverlayImageView setImage:[UIImage imageNamed:@"zero-overlay"]];
            [self.backgroundOverlayImageView setAlpha:0.0];
            [self.backgroundImageView addSubview:self.backgroundOverlayImageView];
            
            // add tag
            static CGFloat amoutToMoveTag = 200.0;
            self.tagImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
            [self.tagImageView setImage:[UIImage imageNamed:@"page0-background-tag"]];
            self.tagImageView.centerX += amoutToMoveTag;
            [self.backgroundImageView addSubview:self.tagImageView];
            
            [UIView animateWithDuration:LOAD_TIME/2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self.backgroundOverlayImageView setAlpha:1];
                self.tagImageView.centerX -= amoutToMoveTag;
                
            } completion:^(BOOL finished) {
                
                [self setupButtons];
                
            }];
        }];
    }];
    
    // Tutorial
    if ([[BSModel sharedModel] isFirstLaunch]) {
        
        double delayInSeconds = LOAD_TIME;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self askUserIfTheyWantToSeeTheTutorial];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasLaunched"];
        });
    } else {
        if ([[BSModel sharedModel] inTutorialMode]) {
            double delayInSeconds = LOAD_TIME;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self enterTutorial];
            });
        }
    }
}

- (void)setupButtons
{
    // atlas button
    self.atlasButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.atlasButton.frame = CGRectMake(0, 0, 260, 260);
    self.atlasButton.centerX = (self.view.bounds.size.width/2) - 10;
    self.atlasButton.centerY += 280;
    [self.atlasButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.atlasButton];
    
    // clinical button
    self.clinicalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clinicalButton.frame = CGRectMake(0, 0, 260, 260);
    self.clinicalButton.centerX = (self.view.bounds.size.width/2) - 10;
    self.clinicalButton.centerY += 600;
    [self.clinicalButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clinicalButton];
    
    // quiz button
    self.quizButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.quizButton.frame = CGRectMake(0, 0, 180, 45);
    //    self.quizButton.backgroundColor = [UIColor redColor];
    self.quizButton.right = self.view.bounds.size.width;
    self.quizButton.centerY += 440;
    [self.quizButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.quizButton];
    
    // tutorial button
    self.tutorialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tutorialButton.frame = CGRectMake(0, 0, 180, 45);
    //    self.tutorialButton.backgroundColor = [UIColor greenColor];
    self.tutorialButton.right = self.view.bounds.size.width;
    self.tutorialButton.centerY = self.quizButton.centerY + self.quizButton.size.height;
    [self.tutorialButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tutorialButton];
    
    // about button
    self.aboutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.aboutButton.frame = CGRectMake(0, 0, 180, 45);
    //    self.aboutButton.backgroundColor = [UIColor yellowColor];
    self.aboutButton.right = self.view.bounds.size.width;
    self.aboutButton.centerY = self.tutorialButton.centerY + self.tutorialButton.size.height;
    [self.aboutButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.aboutButton];
    
}

- (void)askUserIfTheyWantToSeeTheTutorial
{
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

- (void)enterTutorial
{
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

- (void)buttonPressed:(UIButton *)sender
{
    if (sender == self.atlasButton) {
        [SVProgressHUD show];
        [self performSegueWithIdentifier:@"page0-to-atlas" sender:self];
    }else if (sender == self.clinicalButton){
        [SVProgressHUD show];
        [self performSegueWithIdentifier:@"page0-to-clinical" sender:self];
    }else if (sender == self.quizButton){
        [self performSegueWithIdentifier:@"page0-to-quiz" sender:self];
    }else if (sender == self.tutorialButton){
        [self enterTutorial];
    }else if (sender == self.aboutButton){
        [self performSegueWithIdentifier:@"page0-to-about" sender:self];
    }else{
        NSLog(@"Button action not defined");
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}

#pragma mark BSTutorialImageViewDelegate
- (void)dissmissTutorialImageView:(id)tutorialView
{
    tutorialView = nil;
}

#pragma mark System Methods
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end
