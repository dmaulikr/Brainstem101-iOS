//
//  BSAboutViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/11/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSAboutViewController.h"

@implementation BSAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.linesImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.squaresImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.picturesImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    [self.linesImageView setImage:[UIImage imageNamed:@"about-line"]];
    [self.squaresImageView setImage:[UIImage imageNamed:@"about-square"]];
    [self.picturesImageView setImage:[UIImage imageNamed:@"about-picture"]];
    
    [self.squaresImageView setAlpha:0];
    [self.picturesImageView setAlpha:0];
    
    [self.view addSubview:self.linesImageView];
    [self.view addSubview:self.squaresImageView];
    [self.view addSubview:self.picturesImageView];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.squaresImageView setAlpha:1];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            [self.picturesImageView setAlpha:1];
        } completion:nil];
    }];
}

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end
