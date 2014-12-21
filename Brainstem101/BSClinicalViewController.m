//
//  BSClinicalViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/30/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSClinicalViewController.h"

#define DEFAULT_ANIMATION_SPEED 0.3
#define CELLSPACING 15
#define SECTION_COLLECTION_VIEW_CENTER_OFFSET 500
#define SECTION_COLLECTION_VIEW_LEFT_EDGE_INSET 100

@implementation BSClinicalViewController
{
    BSSyndrome *currentSyndrome;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.syndromeSelectionCollectionView setAllowsMultipleSelection:NO];
    [self.descriptionView setText:@""];
    [self.descriptionView addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:nil];
    [self.sectionCollectionView setContentInset:UIEdgeInsetsMake(0, -200, 0, 0)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //tutorial
    if ([[BSModel sharedModel] inTutorialMode]) {
        if (![self.view viewWithTag:8008]) {
            BSTutorialImageView *tutorialView = [BSTutorialImageView clinicalTutorial];
            [tutorialView setDelegate:self];
            [tutorialView setTag:8008];
            [tutorialView setAlpha:0.0];
            [self.view addSubview:tutorialView];
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [tutorialView setAlpha:1.0];
            } completion:nil];
        }
    }
    
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationCurveLinear animations:^{
        [self.fadingEyeView setAlpha:0];
    } completion:nil];

}
#pragma mark BSTutorialImageViewDelegate

- (void)dissmissTutorialImageView:(id)tutorialView
{
    tutorialView = nil;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UITextView *tv = object;
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    CGPoint newContentOffset =  (CGPoint){.x = 0, .y = -topCorrect};
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED animations:^{
        [tv setContentOffset:newContentOffset];
    }];
}

-(void)switchToSyndrome:(BSSyndrome *)syn
{
    currentSyndrome = syn;
    
    [self updateDescription];
    [self updateSectionCollectionView];
    [self updateMugshots];
    [self updateSyndromeSelectionCollectionView];
    [self updateDeficitTableView];
}

- (void)updateDescription
{
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.descriptionView setAlpha:0];
    } completion:^(BOOL finished) {
        [self.descriptionView setText:[currentSyndrome desc]];
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.descriptionView setAlpha:1];
        } completion:^(BOOL finished) {
            //do nothing
        }];
    }];
}

-(void)updateSectionCollectionView
{
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.sectionCollectionView setAlpha:0];
        [self.sectionCollectionView setCenter:CGPointMake(_sectionCollectionView.center.x + SECTION_COLLECTION_VIEW_CENTER_OFFSET, _sectionCollectionView.center.y)];
        
    } completion:^(BOOL finished) {
        
        [self.sectionCollectionView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)]];
        [self.sectionCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.sectionCollectionView setAlpha:1];
            [self.sectionCollectionView setCenter:CGPointMake(self.view.center.x , self.sectionCollectionView.center.y)];
        } completion:nil];
    }];
}

- (void)updateMugshots
{
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.mugshotView setAlpha:0];
    } completion:^(BOOL finished) {
        [self.mugshotView setImage:[UIImage imageNamed:currentSyndrome.mugshotImageName]];
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.mugshotView setAlpha:1];
        } completion:nil];
    }];
}

-(void)updateSyndromeSelectionCollectionView
{
    [self.syndromeSelectionCollectionView reloadData];
    [self.syndromeSelectionCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:[[[BSModel sharedModel] Syndromes] indexOfObject:currentSyndrome] inSection:0]
                                             atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                     animated:YES];
}

- (void)updateDeficitTableView
{
    //Dynamic Sizing of deficits table
    int totalCellHeight = 0;
    for (BSDeficit *def in currentSyndrome.deficits) {
        totalCellHeight += [self calculatedTableCellHeightForDeficit:def];
    }
    int heightDelta = MAX(0, [_deficitTableView frame].size.height - totalCellHeight);
    
    if (heightDelta != 0) {
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED animations:^{
            [self.deficitTableView setContentInset:UIEdgeInsetsMake((heightDelta / 2), 0, 0, 0)];
        }];
    }else{
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED animations:^{
            [self.deficitTableView setContentInset:UIEdgeInsetsMake(CELLSPACING, 0, 0, 0)];
        }];
    }
    
    [self.deficitTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark UITableViewDelegate 

- (BSClinicalDetailsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _deficitTableView) {
        static NSString *clinicalCellIdentifier = @"ClinicalCell";
        BSClinicalDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clinicalCellIdentifier forIndexPath:indexPath];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell loadDeficit:(currentSyndrome.deficits)[indexPath.row]];
        return cell;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _deficitTableView) {
        return 1;
    }
    NSLog(@"Something went wrong in number sections in table view");
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _deficitTableView) {
        return currentSyndrome.deficits.count;
    }
    
    NSLog(@"Something went wrong in number of rows in section.");
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self calculatedTableCellHeightForDeficit:[[currentSyndrome deficits] objectAtIndex:indexPath.row]];
}

-(CGFloat) calculatedTableCellHeightForDeficit:(BSDeficit *)deficit
{
    float symptomsHeight = [[deficit symptoms] sizeWithFont:[UIFont fontWithName:@"AmericanTypewriter" size:12] constrainedToSize:CGSizeMake(343, 105)].height;
    float deficitHeight = [[deficit deficit] sizeWithFont:[UIFont fontWithName:@"AmericanTypewriter" size:12] constrainedToSize:CGSizeMake(130, 105)].height;
    
    float finalHeight = MAX(symptomsHeight, deficitHeight);
    finalHeight = MAX(finalHeight, 50);
    
    return finalHeight + CELLSPACING;
}

#pragma mark UICollectionView

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView == _syndromeSelectionCollectionView) {
        static NSString *syndromCellIdentifier = @"SyndromeCell";
        BSClinicalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:syndromCellIdentifier forIndexPath:indexPath];
        
        [cell.syndromNameLabel setText:[[[BSModel sharedModel] Syndromes][indexPath.row] name]];
        
        if (currentSyndrome == [[BSModel sharedModel] Syndromes][indexPath.row]) {
            [cell.syndromNameLabel setTextColor:[UIColor whiteColor]];
        }else{
            [cell.syndromNameLabel setTextColor:[UIColor colorWithWhite:1 alpha:0.5]];
        }
        
        return cell;
    }else if (collectionView == _sectionCollectionView){
        
        static NSString *sectionCellIdentifier = @"SectionCell";
        BSClinicalCollectionViewSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:sectionCellIdentifier forIndexPath:indexPath];
        
        [cell.imageView0 setImage:nil];
        [cell.imageView1 setImage:nil];
        

        if (indexPath.row == 2) {
            [cell.imageView0 setImage:[UIImage imageNamed:[currentSyndrome sectionImageName]]];
        }else if (indexPath.row == 3){
            [cell.imageView0 setImage:[UIImage imageNamed:[currentSyndrome perfusionDiagram]]];
            [cell.imageView1 setImage:[UIImage imageNamed:[currentSyndrome perfusionDiagramOverlay]]];
        }
        return cell;
    }
    
    NSLog(@"There was a error in collection.");
    return nil;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView == self.syndromeSelectionCollectionView) {
        return 1;
    }else if (collectionView == self.sectionCollectionView){
        return 1;
    }else{
        NSLog(@"Collection view # of sections failed");
        return 0;
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.syndromeSelectionCollectionView) {
        return [[[BSModel sharedModel] Syndromes] count];
    }else if (collectionView == self.sectionCollectionView){
        return 5;
    }else{
        NSLog(@"Collection view # of sections failed");
        return 0;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.syndromeSelectionCollectionView) {
        if ([[[BSModel sharedModel] Syndromes] objectAtIndex:indexPath.row] != currentSyndrome) {
            [[(BSClinicalCollectionViewCell *)[self.syndromeSelectionCollectionView cellForItemAtIndexPath:indexPath] syndromNameLabel] setTextColor:[UIColor whiteColor]];
            [self switchToSyndrome:[[BSModel sharedModel] Syndromes][indexPath.row]];
        }
    }
}


#pragma mark - System Methods

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end
