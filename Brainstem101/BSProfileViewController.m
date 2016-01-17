//
//  BSProfileViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 12/18/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSProfileViewController.h"

@implementation BSProfileViewController
{
    CGPoint originalCenter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.sectionView setDelegate:self];
    [self.structureDetailView setAlwaysBounceVertical:YES];
    [self didSelectStructure:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self switchToSectionNumber:self.sectionNumber animationStyle:@"fade"];
    
    if ([[BSModel sharedModel] inTutorialMode]) {
        if (![self.view viewWithTag:8008]) {
            BSTutorialImageView *tutorialView = [BSTutorialImageView profileTutorial];
            [tutorialView setDelegate:self];
            [tutorialView setTag:8008];
            [tutorialView setAlpha:0.0];
            [self.view addSubview:tutorialView];
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [tutorialView setAlpha:1.0];
            } completion:nil];
        }
    }
}


#pragma mark BSSectionViewDelegate
- (void)didSelectStructure:(BSStructure *)structure
{
    if (structure == nil) {
        [self.structureDetailView setText:@""];
        [self.structureNameLabel setText:@""];
        return;
    }
    
    NSString *title = [structure structureName];
    NSString *desc = [structure structureDescription];
    if (!desc) {
        desc = @"Description not yet available.";
    }
    
    [self.structureNameLabel setText:title];
    [self.structureDetailView setText:desc];
}

- (void)switchToSectionNumber:(NSInteger)num animationStyle:(NSString *)animation
{
    originalCenter = self.sectionView.center;
    _sectionNumber = num;
    
    if ([animation isEqualToString:@"fade"]) {
        
        [self.sectionView setAlpha:0];
        [self.sectionView setCurrentSection:[BSSection profileSectionNumber:self.sectionNumber]];
        
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [self.sectionView setAlpha:1];
        } completion:nil];
        
        
    }else if ([animation isEqualToString:@"left"]){
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.sectionView setAlpha:0];
            [self.sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].origin.x, originalCenter.y)];
        } completion:^(BOOL finished) {
            
            [self.sectionView setCurrentSection:[BSSection profileSectionNumber:self.sectionNumber]];
            [self.sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width, originalCenter.y)];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
                
                [self.sectionView setAlpha:1];
                [self.sectionView setCenter:originalCenter];
                
            } completion:nil];
        }];
        
    }else if ([animation isEqualToString:@"right"]){
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.sectionView setAlpha:0];
            [self.sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width, originalCenter.y)];
            
        } completion:^(BOOL finished) {
            
            [self.sectionView setCurrentSection:[BSSection profileSectionNumber:self.sectionNumber]];
            [self.sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].origin.x, originalCenter.y)];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
                
                [self.sectionView setAlpha:1];
                [self.sectionView setCenter:originalCenter];
                
            } completion:nil];
        }];
    }
}

- (void)setSectionNumber:(NSInteger)sxnNumber
{
    _sectionNumber = sxnNumber;
    [self switchToSectionNumber:sxnNumber animationStyle:@"fade"];
}

- (IBAction)handleRotation:(UIRotationGestureRecognizer *)sender
{
    if ([sender state] == UIGestureRecognizerStateBegan) {
        if ([sender rotation] < 0) {
            [self.sectionView rotateViewLeft];
        }else{
            [self.sectionView rotateViewRight];
        }
    }
}

- (IBAction)handeSwipe:(UISwipeGestureRecognizer *)sender
{
    if ([sender direction] == UISwipeGestureRecognizerDirectionRight){
        NSInteger nextSecNum;
        if (self.sectionNumber == 8) {
            nextSecNum = 0;
        }else{
            nextSecNum = self.sectionNumber + 1;
        }
        [self switchToSectionNumber:nextSecNum animationStyle:@"right"];
        
    }else if ([sender direction] == UISwipeGestureRecognizerDirectionLeft){
        
        NSInteger nextSecNum;
        if (self.sectionNumber == 0) {
            nextSecNum = 8;
        }else{
            nextSecNum = self.sectionNumber - 1;
        }
        [self switchToSectionNumber:nextSecNum animationStyle:@"left"];
    }
}

#pragma mark BSTutorialImageViewDelegate

- (void)dissmissTutorialImageView:(id)tutorialView
{
    tutorialView = nil;
}


#pragma mark - System Methods

- (IBAction)goBackToAtlas:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual: @"profile-to-draw"]) {
        [UIView animateWithDuration:0.5 animations:^{
            [self.sectionView setAlpha:0];
        }];
        [segue.destinationViewController setSectionNumber:self.sectionNumber];
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end
