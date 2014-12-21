//
//  BSViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSAtlasViewController.h"
#import "BSProfileViewController.h"
#import <UIView+Positioning.h>

#define STEMVIEW_STYLE_FRONT 0
#define STEMVIEW_STYLE_SIDE 1
#define STEMVIEW_STYLE_FAN 2

@implementation BSAtlasViewController
{
    NSArray *allSectionViews;
    NSArray *currentNuclei;
    NSArray *currentTracts;
    NSArray *currentArteries;
    NSArray *currentMiscellaneous;
    NSArray *currentCranialNerves;
    NSInteger selectedSxnView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.stemViewStyle = STEMVIEW_STYLE_FRONT;
    
    allSectionViews = @[
                        [BSAtlasSectionView atlasSectionViewForSection:0],
                        [BSAtlasSectionView atlasSectionViewForSection:1],
                        [BSAtlasSectionView atlasSectionViewForSection:2],
                        [BSAtlasSectionView atlasSectionViewForSection:3],
                        [BSAtlasSectionView atlasSectionViewForSection:4],
                        [BSAtlasSectionView atlasSectionViewForSection:5],
                        [BSAtlasSectionView atlasSectionViewForSection:6],
                        [BSAtlasSectionView atlasSectionViewForSection:7],
                        [BSAtlasSectionView atlasSectionViewForSection:8]
                        ];
    
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.backgroundImageView setImage:[UIImage imageNamed:@"atlas-background"]];
    [self.view addSubview:self.backgroundImageView];
    
    self.stemView = [[BSStemView alloc] initWithFrame:self.view.bounds];
    [self.stemView setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:self.stemView];
    
    self.glassStemView = [[BSGlassStemView alloc] initWithFrame:CGRectMake(0, 0, 250, 350)];
    [self.glassStemView setCenter:self.view.center];
    [self.view addSubview:self.glassStemView];
    
    self.searchImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.searchImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.searchImageView setImage:[UIImage imageNamed:@"search-image"]];
    [self.searchImageView setAlpha:0];
    [self.view addSubview:self.searchImageView];
    
    self.searchBox = [[UITextField alloc] initWithFrame:CGRectMake(0, 45, 411/2, 83/2)];
    [self.searchBox setDelegate:self];
    [self.searchBox setBackground:[UIImage imageNamed:@"search-blur-image"]];
    [self.searchBox setAlpha:0.1];
    [self.searchBox setSpellCheckingType:UITextSpellCheckingTypeNo];
    [self.searchBox setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.searchBox setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.searchBox setTextColor:[UIColor lightTextColor]];
    [self.searchBox setTextAlignment:NSTextAlignmentCenter];
    [self.searchBox setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:20]];
    [self.view insertSubview:self.searchBox aboveSubview:self.searchImageView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(0, 0, 75, 40);
    [self.backButton addTarget:self action:@selector(backToPage0) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    self.indexTable = [[UITableView alloc] initWithFrame:CGRectMake(7, 0, 208, 930) style:UITableViewStylePlain];
    self.indexTable.bottom = self.view.bounds.size.height;
    [self.indexTable setDelegate:self];
    [self.indexTable setDataSource:self];
    [self.indexTable setAlpha:0];
    [self.indexTable setBackgroundColor:[UIColor clearColor]];
    [self.indexTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.indexTable setSeparatorColor:[UIColor clearColor]];
    [self.indexTable setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:self.indexTable];
    
    self.clinicalButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.clinicalButton setFrame:CGRectMake(0, 0, 300, 100)];
    self.clinicalButton.centerX = self.view.center.x;
    self.clinicalButton.centerY = 770;
    [self.clinicalButton addTarget:self action:@selector(clinicalButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clinicalButton];
    
    for (BSAtlasSectionView *view in allSectionViews) {
        [view setAlpha:0];
        [self.view addSubview:view];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self resetEverything];
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self updateFadedCells];
        [self.indexTable setAlpha:1];
        [self.searchImageView setAlpha:1];
        for (BSAtlasSectionView *view in allSectionViews) {
            [view setAlpha:1];
        }
    } completion:^(BOOL finished) {
        
    }];
  
    if ([[BSModel sharedModel] inTutorialMode]) {
        if (![self.view viewWithTag:8008]) {
            BSTutorialImageView *tutorialView = [BSTutorialImageView atlasTutorial];
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

-(void)backToPage0
{
    [self performSegueWithIdentifier:@"atlas-to-page0" sender:self];
}


#pragma mark UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateFadedCells];
}

-(void)updateFadedCells
{
    NSArray *visibleCells = [self.indexTable visibleCells];
    
    for (UITableViewCell *cell in visibleCells) {
        if ( [cell isEqual:visibleCells.firstObject] || [cell isEqual:visibleCells.lastObject]) {
            [cell setAlpha:0.2];
        }else if ([cell isEqual:visibleCells[1]] || [cell isEqual:visibleCells[visibleCells.count - 2]]){
            [cell setAlpha:0.3];
        }else if ([cell isEqual:visibleCells[2]] || [cell isEqual:visibleCells[visibleCells.count - 3]]) {
            [cell setAlpha:0.5];
        }else if ([cell isEqual:visibleCells[3]] || [cell isEqual:visibleCells[visibleCells.count - 4]]) {
            [cell setAlpha:0.7];
        }else{
            [cell setAlpha:1];
        }
    }
}

- (NSArray *)currentSectionForType:(BSStructureType)type
{
    switch (type) {
        case BSStructureTypeNucleus:
            return currentNuclei;
        case BSStructureTypeTract:
            return currentTracts;
        case BSStructureTypeArtery:
            return currentArteries;
        case BSStructureTypeMiscellaneous:
            return currentMiscellaneous;
        case BSStructureTypeCranialNerve:
            return currentCranialNerves;
        default:
            NSLog(@"Something went wrong in currentSectionForType.");
            return currentNuclei;
    }
}

-(void)reloadStructresIntoLocalVariables
{
    currentNuclei        = [[BSModel sharedModel] Nuclei];
    currentTracts        = [[BSModel sharedModel] Tracts];
    currentArteries      = [[BSModel sharedModel] Arteries];
    currentMiscellaneous = [[BSModel sharedModel] Miscellaneous];
    currentCranialNerves = [[BSModel sharedModel] CranialNerves];
}

#pragma mark UITableViewDelegates
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"AtlasCell";
    NSString *structureName = [[self currentSectionForType:indexPath.section][indexPath.row] structureName];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setFont:[UIFont fontWithName:@"AmericanTypewriter" size:13]];
    [cell.textLabel setAdjustsFontSizeToFitWidth:YES];
    [cell.textLabel setAdjustsLetterSpacingToFitWidth:YES];
    [cell.textLabel setText:structureName];
    
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    if ([structureName isEqualToString:self.currentStructure.structureName]){
        [cell.textLabel setTextColor:[UIColor yellowColor]];
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NUMBER_OF_SECTIONS;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self currentSectionForType:section] count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    CGRect frame = CGRectMake(0, 0, self.indexTable.frame.size.width, 30);
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [background setBackgroundColor:[UIColor clearColor]];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, 10, _indexTable.frame.size.width, 20)];
    [header setBackgroundColor:[UIColor clearColor]];
    [header setTextAlignment:NSTextAlignmentCenter];
    [header setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:18]];
    [header setTextColor:[UIColor whiteColor]];
    
    switch (section) {
        case BSStructureTypeNucleus:
            [header setText:@"Nuclei"];
            break;
        case BSStructureTypeTract:
            [header setText:@"Tracts"];
            break;
        case BSStructureTypeArtery:
            [header setText:@"Arteries"];
            break;
        case BSStructureTypeMiscellaneous:
            [header setText:@"Miscellaneous"];
            break;
        case BSStructureTypeCranialNerve:
            [header setText:@"Cranial Nerves"];
            break;
        default:
            NSLog(@"Error : something went wrong in Atlas -> view for header in section \n --> secionOffset equals %ld", (long)section);
            break;
    }
    [background addSubview:header];
    return background;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 23;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.currentStructure = [self currentSectionForType:indexPath.section][indexPath.row];
    [self.stemView show];
    [self.glassStemView hide];
    [self.stemView loadStructure:_currentStructure];
    
    [self.searchBox resignFirstResponder];
    [self.searchBox setAlpha:0.1];
    [self.searchBox setText:@""];
    
    selectedSxnView = -1;
    int secNum = 0;
    
    for (BSAtlasSectionView *view in allSectionViews) {
        [view fade];
        [view setStructures:@[]];
        [view arteryImageNamed:nil];
        
        if (self.currentStructure.structureType == BSStructureTypeArtery) {
            if ([self.currentStructure hasArteryInSectionNumber:secNum]) {
                [view arteryImageNamed:[_currentStructure arteryImages][secNum]];
                [view unfade];
            }
        }else if ([_currentStructure isInSectionNumber:secNum]) {
            [view unfade];
            [view setStructures:@[_currentStructure]];
        }
        secNum++;
    }
    
    [[[self.indexTable cellForRowAtIndexPath:indexPath] textLabel] setTextColor:[UIColor yellowColor]];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[[self.indexTable cellForRowAtIndexPath:indexPath] textLabel] setTextColor:[UIColor whiteColor]];
}

-(void)selectSectionView:(NSInteger)sxnNum
{
    selectedSxnView = sxnNum;
    
    [self.glassStemView presentSection:selectedSxnView];
    [self.stemView hide];
    
    for (BSAtlasSectionView *view in allSectionViews) {
        [view fade];
        [view setStructures:@[]];
        [view arteryImageNamed:nil];
    }
    
    currentNuclei           = [[BSModel sharedModel] getType:BSStructureTypeNucleus inSection:selectedSxnView];
    currentTracts           = [[BSModel sharedModel] getType:BSStructureTypeTract inSection:selectedSxnView];
    currentArteries         = [[BSModel sharedModel] getType:BSStructureTypeArtery inSection:selectedSxnView];
    currentMiscellaneous    = [[BSModel sharedModel] getType:BSStructureTypeMiscellaneous inSection:selectedSxnView];
    currentCranialNerves    = [[BSModel sharedModel] getType:BSStructureTypeCranialNerve inSection:selectedSxnView];
    
    NSArray *tmpArray = [[[currentNuclei arrayByAddingObjectsFromArray:currentTracts] arrayByAddingObjectsFromArray:currentMiscellaneous] arrayByAddingObjectsFromArray:currentCranialNerves];
    
    [allSectionViews[selectedSxnView] setStructures:tmpArray];
    [allSectionViews[selectedSxnView] unfade];
    
    [self.indexTable reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, NUMBER_OF_SECTIONS)] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark UIGestutureRecognizer Methods
- (IBAction)handleSingleTap:(UITapGestureRecognizer*)sender {
    
    CGPoint point = [sender locationInView:self.view];
    BOOL touchedSectionView = NO;
    
    for (BSAtlasSectionView *view in allSectionViews){
        // If tapped again while already being selected, launch into the profile page
        if (CGRectContainsPoint(view.frame, point)) {
            if (view.section.sectionNumber == selectedSxnView) {
                [self performSegueWithIdentifier:@"atlas-to-profile" sender:self];
                return;
            }
            [self selectSectionView:view.section.sectionNumber];
            touchedSectionView = YES;
        }
    }
    //tap detected outside of any object
    if (!touchedSectionView) {
        [self resetEverything];
    }
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender
{
    if ([sender direction] == UISwipeGestureRecognizerDirectionRight) {
        [self.glassStemView hide];
        [self.stemView stemViewModeNext];
    }else if ([sender direction] == UISwipeGestureRecognizerDirectionLeft){
        [self.stemView stemViewMovePrevious];
        [self.glassStemView hide];
    }else {
        
    }
}

- (IBAction)handleRotation:(UIRotationGestureRecognizer *)sender
{
    if ([sender state] == UIGestureRecognizerStateBegan) {
        if ([sender rotation] < 0) {
            for (BSAtlasSectionView *s in allSectionViews){
                [s rotateViewLeft];
            }
        }else{
            for (BSAtlasSectionView *s in allSectionViews){
                [s rotateViewRight];
            }
        }
    }
}

- (void)clinicalButtonAction:(id)sender
{
    [self performSegueWithIdentifier:@"atlas-to-clinical" sender:self];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (CGRectContainsPoint(self.indexTable.frame, [touch locationInView:self.view])) {
        return NO;
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.searchBox setAlpha:1];
    }];
    
    [self.searchBox becomeFirstResponder];
}

#pragma mark Search -- UITextFieldDelegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSMutableString* newText = [NSMutableString new];
    [newText appendString:[textField.text substringWithRange:NSMakeRange(0, range.location)]];
    [newText appendString:string];
    
    [self performSearchWithQuery:newText];
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self reloadStructresIntoLocalVariables];
    [self.indexTable reloadData];
    return YES;
}

-(void)performSearchWithQuery:(NSString *)query
{
    if (query.length == 0) {
        [self reloadStructresIntoLocalVariables];
        [self.indexTable reloadData];
    }else{
        NSMutableArray *tmpNucs = [NSMutableArray new];
        for (BSStructure *nuc in [[BSModel sharedModel] Nuclei]) {
            if ([self does:nuc match:query]) {
                [tmpNucs addObject:nuc];
            }
        }
        
        NSMutableArray *tmpTracts = [NSMutableArray new];
        for (BSStructure *tract in [[BSModel sharedModel] Tracts]) {
            if ([self does:tract match:query]) {
                [tmpTracts addObject:tract];
            }
        }
        
        NSMutableArray *tmpArteries = [NSMutableArray new];
        for (BSStructure *artery in [[BSModel sharedModel] Arteries]) {
            if ([self does:artery match:query]) {
                [tmpArteries addObject:artery];
            }
        }
        
        NSMutableArray *tmpMisc = [NSMutableArray new];
        for (BSStructure *misc in [[BSModel sharedModel] Miscellaneous]) {
            if ([self does:misc match:query]) {
                [tmpMisc addObject:misc];
            }
        }
        
        NSMutableArray *tmpCranialNerves = [NSMutableArray new];
        for (BSStructure *cranialNerve in [[BSModel sharedModel] CranialNerves]) {
            if ([self does:cranialNerve match:query]) {
                [tmpCranialNerves addObject:cranialNerve];
            }
        }
        
        currentNuclei           = tmpNucs;
        currentTracts           = tmpTracts;
        currentArteries         = tmpArteries;
        currentMiscellaneous    = tmpMisc;
        currentCranialNerves    = tmpCranialNerves;
        
        [self.indexTable reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, NUMBER_OF_SECTIONS)] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - My Methods

-(void)resetEverything
{
    selectedSxnView = -1;
    self.currentStructure = nil;
    
    [self.searchBox setText:@""];
    [self.searchBox resignFirstResponder];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.searchBox setAlpha:0.1];
    } completion:nil];
    
    [self.glassStemView hide];
    [self.stemView show];
    [self.stemView removeOverlays];
    
    for (BSAtlasSectionView *view in allSectionViews) {
        [view unfade];
        [view setStructures:@[]];
        [view arteryImageNamed:nil];
    }
    
    if (currentNuclei.count != [[BSModel sharedModel] Nuclei].count ||
        currentTracts.count != [[BSModel sharedModel] Tracts].count ||
        currentArteries.count != [[BSModel sharedModel] Arteries].count ||
        currentMiscellaneous.count != [[BSModel sharedModel] Miscellaneous].count ||
        currentCranialNerves.count != [[BSModel sharedModel] CranialNerves].count)
    {
        [self reloadStructresIntoLocalVariables];
        [self.indexTable reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, NUMBER_OF_SECTIONS)] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    for (NSIndexPath *path in [self.indexTable indexPathsForVisibleRows]){
        [self.indexTable deselectRowAtIndexPath:path animated:YES];
    }
    
}

-(BOOL)does:(BSStructure *)structure match:(NSString *)query
{
    if ([[[structure conventionalName] stringByReplacingOccurrencesOfString:@"-" withString:@" "]
         rangeOfString:[query lowercaseString]].location == NSNotFound){
        return NO;
    }
    return YES;
}


#pragma mark BSTutorialImageViewDelegate

-(void)dissmissTutorialImageView:(id)tutorialView
{
    tutorialView = nil;
}

#pragma mark - System Methods
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // maybe close door here
    if ([segue.identifier isEqualToString:@"atlas-to-profile"]) {
        [(BSProfileViewController *)[segue destinationViewController] setSectionNumber:selectedSxnView];
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end
