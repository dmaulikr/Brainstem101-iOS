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
#define SECTION_COLLECTION_VIEW_LEFT_EDGE_INSET 400

@implementation BSClinicalViewController{
    BSSyndrome *currentSyndrome;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_syndromeSelectionCollectionView setAllowsMultipleSelection:NO];
    [_descriptionView setText:@""];
    [_descriptionView addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:nil];
    [_sectionCollectionView setContentInset:UIEdgeInsetsMake(0, -200, 0, 0)];
}

-(void)viewDidAppear:(BOOL)animated{
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
        [_fadingEyeView setAlpha:0];
    } completion:nil];

}
#pragma mark BSTutorialImageViewDelegate

-(void)dissmissTutorialImageView:(id)tutorialView{
    tutorialView = nil;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *tv = object;
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    CGPoint newContentOffset =  (CGPoint){.x = 0, .y = -topCorrect};
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED animations:^{
        [tv setContentOffset:newContentOffset];
    }];
}

-(void)switchToSyndrome:(BSSyndrome *)syn{
    currentSyndrome = syn;
    
    [self updateDescription];
    [self updateSectionCollectionView];
    [self updateMugshots];
    [self updateSyndromeSelectionCollectionView];
    [self updateDeficitTableView];
}

-(void)updateDescription{
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [_descriptionView setAlpha:0];
    } completion:^(BOOL finished) {
        [_descriptionView setContentOffset:CGPointMake(0, -200)];
        [_descriptionView setText:[currentSyndrome description]];
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_descriptionView setAlpha:1];
        } completion:^(BOOL finished) {
            //do nothing
        }];
    }];
}

-(void)updateSectionCollectionView{
    
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [_sectionCollectionView setAlpha:0];
        [_sectionCollectionView setCenter:CGPointMake(_sectionCollectionView.center.x + SECTION_COLLECTION_VIEW_CENTER_OFFSET, _sectionCollectionView.center.y)];

    } completion:^(BOOL finished) {
        
        [_sectionCollectionView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)]];
        [_sectionCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [_sectionCollectionView setAlpha:1];
            [_sectionCollectionView setCenter:CGPointMake(self.view.center.x , _sectionCollectionView.center.y)];
        } completion:^(BOOL finished) {
            //do nothing
        }];
    }];
}

- (void)updateMugshots {
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [_mugshotView setAlpha:0];
    } completion:^(BOOL finished) {
        [_mugshotView setImage:[UIImage imageNamed:currentSyndrome.mugshotImageName]];
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [_mugshotView setAlpha:1];
        } completion:nil];
    }];
}

-(void)updateSyndromeSelectionCollectionView {
    [_syndromeSelectionCollectionView reloadData];
    [_syndromeSelectionCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:[[[BSModel sharedModel] Syndromes] indexOfObject:currentSyndrome] inSection:0]
                                             atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                     animated:YES];
}

- (void)updateDeficitTableView{
    //Dynamic Sizing of deficits table
    int totalCellHeight = 0;
    for (BSDeficit *def in currentSyndrome.deficits) {
        totalCellHeight += [self calculatedTableCellHeightForDeficit:def];
    }
    int heightDelta = MAX(0, [_deficitTableView frame].size.height - totalCellHeight);
    
    if (heightDelta != 0) {
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED animations:^{
            [_deficitTableView setContentInset:UIEdgeInsetsMake((heightDelta / 2), 0, 0, 0)];
        }];
    }else{
        [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED animations:^{
            [_deficitTableView setContentInset:UIEdgeInsetsMake(CELLSPACING, 0, 0, 0)];
        }];
    }
    
    [_deficitTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark UITableViewDelegate 

- (BSClinicalDetailsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _deficitTableView) {
        static NSString *clinicalCellIdentifier = @"ClinicalCell";
        BSClinicalDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clinicalCellIdentifier forIndexPath:indexPath];
        [cell loadDeficit:(currentSyndrome.deficits)[indexPath.row]];
        return cell;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _deficitTableView) {
        return 1;
    }
    NSLog(@"Something went wrong in number sections in table view");
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _deficitTableView) {
        return currentSyndrome.deficits.count;
    }
    
    NSLog(@"Something went wrong in number of rows in section.");
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self calculatedTableCellHeightForDeficit:[[currentSyndrome deficits] objectAtIndex:indexPath.row]];
}

-(CGFloat) calculatedTableCellHeightForDeficit:(BSDeficit *)deficit {

    float symptomsHeight = [[deficit symptoms] sizeWithFont:[UIFont fontWithName:@"AmericanTypewriter" size:12] constrainedToSize:CGSizeMake(343, 101)].height;
    float deficitHeight = [[deficit deficit] sizeWithFont:[UIFont fontWithName:@"AmericanTypewriter" size:12] constrainedToSize:CGSizeMake(130, 101)].height;
    
    float finalHeight = MAX(symptomsHeight, deficitHeight);
    finalHeight = MAX(finalHeight, 35);
    
    return finalHeight + CELLSPACING;
}

#pragma mark UICollectionView

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
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

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (collectionView == _syndromeSelectionCollectionView) {
        return 1;
    }else if (collectionView == _sectionCollectionView){
        return 1;
    }else{
        NSLog(@"Collection view # of sections failed");
        return 0;
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == _syndromeSelectionCollectionView) {
        return [[[BSModel sharedModel] Syndromes] count];
    }else if (collectionView == _sectionCollectionView){
        return 5;
    }else{
        NSLog(@"Collection view # of sections failed");
        return 0;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _syndromeSelectionCollectionView) {
        if ([[[BSModel sharedModel] Syndromes] objectAtIndex:indexPath.row] != currentSyndrome) {
            [[(BSClinicalCollectionViewCell *)[_syndromeSelectionCollectionView cellForItemAtIndexPath:indexPath] syndromNameLabel] setTextColor:[UIColor whiteColor]];
            [self switchToSyndrome:[[BSModel sharedModel] Syndromes][indexPath.row]];
        }
    }
}


#pragma mark - System Methods

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
