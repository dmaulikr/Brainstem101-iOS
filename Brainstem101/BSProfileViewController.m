//
//  BSProfileViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 12/18/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSProfileViewController.h"

@implementation BSProfileViewController{
    CGPoint originalCenter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_detailView.title setText:@""];
    [_sectionView setDelegate:self];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self switchToSectionNumber:_sectionNumber animationStyle:@"fade"];
    
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

- (void) didSelectStructure:(BSStructure *) str{
    [_detailView.title setText:[str structureName]];
    
    NSString *desc = [str structureDescription];
    if (!desc) {
        desc = @"";
    }
    
    [_detailView setData:@{@"image":[NSString stringWithFormat:@"MRI%d.JPG", _sectionNumber], @"description": desc}];
    [_detailView.collectionView reloadData];
    [_detailView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

-(void)switchToSectionNumber:(int)num animationStyle:(NSString *)animation{
    originalCenter = _sectionView.center;
    _sectionNumber = num;
    
    if ([animation isEqualToString:@"fade"]) {
        
        [_sectionView setAlpha:0];
        [_sectionView setCurrentSection:[BSSection profileSectionNumber:_sectionNumber]];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [_sectionView setAlpha:1];
        } completion:nil];
        
        
    }else if ([animation isEqualToString:@"left"]){
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [_sectionView setAlpha:0];
            [_sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].origin.x, originalCenter.y)];
        } completion:^(BOOL finished) {
            
            [_sectionView setCurrentSection:[BSSection profileSectionNumber:_sectionNumber]];
            [_sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width, originalCenter.y)];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
                
                [_sectionView setAlpha:1];
                [_sectionView setCenter:originalCenter];
                
            } completion:nil];
        }];
        
    }else if ([animation isEqualToString:@"right"]){
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [_sectionView setAlpha:0];
            [_sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width, originalCenter.y)];
            
        } completion:^(BOOL finished) {
            
            [_sectionView setCurrentSection:[BSSection profileSectionNumber:_sectionNumber]];
            [_sectionView setCenter:CGPointMake([[UIScreen mainScreen] bounds].origin.x, originalCenter.y)];
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
                
                [_sectionView setAlpha:1];
                [_sectionView setCenter:originalCenter];
                
            } completion:nil];
        }];
    }
}

-(void)setSectionNumber:(int)sxnNumber {
    _sectionNumber = sxnNumber;
    [self switchToSectionNumber:_sectionNumber animationStyle:@"fade"];
}

- (IBAction)handleRotation:(UIRotationGestureRecognizer *)sender{
    if ([sender state] == UIGestureRecognizerStateBegan) {
        if ([sender rotation] < 0) {
            [_sectionView rotateViewLeft];
        }else{
            [_sectionView rotateViewRight];
        }
    }
}

- (IBAction)handeSwipe:(UISwipeGestureRecognizer *)sender {
    if ([sender direction] == UISwipeGestureRecognizerDirectionRight){
        int nextSecNum;
        if (_sectionNumber == 8) {
            nextSecNum = 0;
        }else{
            nextSecNum = _sectionNumber + 1;
        }
        [self switchToSectionNumber:nextSecNum animationStyle:@"right"];
        
    }else if ([sender direction] == UISwipeGestureRecognizerDirectionLeft){
        
        int nextSecNum;
        if (_sectionNumber == 0) {
            nextSecNum = 8;
        }else{
            nextSecNum = _sectionNumber - 1;
        }
        [self switchToSectionNumber:nextSecNum animationStyle:@"left"];
    }
    
}


#pragma mark BSTutorialImageViewDelegate

-(void)dissmissTutorialImageView:(id)tutorialView{
    tutorialView = nil;
}


#pragma mark - System Methods

- (IBAction)goBackToAtlas:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual: @"profile-to-draw"]) {
        [UIView animateWithDuration:0.5 animations:^{
            [_sectionView setAlpha:0];
        }];
        [segue.destinationViewController setSectionNumber:_sectionNumber];
    }
}

-(NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Received Memory Warning!");
}


@end
