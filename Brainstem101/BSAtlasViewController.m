//
//  BSViewController.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSAtlasViewController.h"
#import "BSProfileViewController.h"

#define STEMVIEW_STYLE_FRONT 0
#define STEMVIEW_STYLE_SIDE 1
#define STEMVIEW_STYLE_FAN 2

@implementation BSAtlasViewController{
    NSArray *allSectionViews;
    NSArray *currentNuclei;
    NSArray *currentTracts;
    NSArray *currentArteries;
    NSArray *currentMiscellaneous;
    NSArray *currentCranialNerves;
    int selectedSxnView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    allSectionViews = @[
                        [BSAtlasSectionView atlasSectionViewForSection:0],
                        [BSAtlasSectionView atlasSectionViewForSection:1],
                        [BSAtlasSectionView atlasSectionViewForSection:2],
                        [BSAtlasSectionView atlasSectionViewForSection:3],
                        [BSAtlasSectionView atlasSectionViewForSection:4],
                        [BSAtlasSectionView atlasSectionViewForSection:5],
                        [BSAtlasSectionView atlasSectionViewForSection:6],
                        [BSAtlasSectionView atlasSectionViewForSection:7],
                        [BSAtlasSectionView atlasSectionViewForSection:8]];
    
    for (BSAtlasSectionView *view in allSectionViews) {
        [self.mainPanelOverlay addSubview:view];
    }
    
    self.stemView = [[BSStemView alloc] initWithFrame:self.view.bounds];
    [self.stemView setContentMode:UIViewContentModeScaleToFill];
    [self.mainPanelOverlay addSubview:_stemView];
    
    self.glassStemView = [[BSGlassStemView alloc] initWithFrame:self.view.bounds];
    [self.mainPanelOverlay addSubview:_glassStemView];
    
    self.stemViewStyle = STEMVIEW_STYLE_FRONT;
    [self.indexTable setAlpha:0];
    [self resetEverything];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(presentationAnimations) withObject:nil afterDelay:0.1];
}

-(void)presentationAnimations
{
    [self.indexTable setAlpha:1];

    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [self.doorImageView setCenter:CGPointMake( - 200 , _doorImageView.center.y)];
    } completion:^(BOOL finished) {
        [self.doorImageView setAlpha:0];
        [self.doorImageView setImage:nil];
        //tutorial
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
    }];
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
    currentNuclei = [[BSModel sharedModel] Nuclei];
    currentTracts = [[BSModel sharedModel] Tracts];
    currentArteries = [[BSModel sharedModel] Arteries];
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
    if ([structureName isEqualToString:_currentStructure.structureName]){
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
            NSLog(@"Error : something went wrong in Atlas -> view for header in section \n --> secionOffset equals %d", section);
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
    [self.searchBox setAlpha:0];
    [self.searchBox setHidden:YES];
    
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

-(void)selectSectionView:(int)sxnNum
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
    
    for(BSAtlasSectionView *view in allSectionViews){
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
    }else if ([sender direction] == UISwipeGestureRecognizerDirectionUp){
        //Disableing swipe up gesture
//        if (selectedSxnView != -1) {
//            [self performSegueWithIdentifier:@"atlas-to-profile" sender:self];
//        }
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

- (IBAction)clinicalButtonAction:(id)sender
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

#pragma mark - IBActions
- (IBAction)rotateAllSections:(id)sender
{
    for (BSAtlasSectionView *s in allSectionViews){
        [s rotateView];
    }
}

- (IBAction)minusButton:(id)sender
{
    if (selectedSxnView == -1) {
        [self selectSectionView:8];
    }else{
        int nextSecNum = selectedSxnView - 1;
        if (nextSecNum <= -1) {
            nextSecNum = 8;
        }
        [self selectSectionView:nextSecNum];
    }
}

- (IBAction)plusButton:(id)sender
{
    if (selectedSxnView == -1) {
        [self selectSectionView:0];
    }else{
        int nextSecNum = selectedSxnView + 1;
        if (nextSecNum >= 9) {
            nextSecNum = 0;
        }
        [self selectSectionView:nextSecNum];
    }
}

- (IBAction)searchButtonPressed:(id)sender
{
    [self.searchBox setHidden:NO];
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
        [_indexTable reloadData];
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
        
        [_indexTable reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, NUMBER_OF_SECTIONS)] withRowAnimation:UITableViewRowAnimationAutomatic];
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
        [self.searchBox setAlpha:0];
    } completion:^(BOOL finished) {
        [self.searchBox setHidden:YES];
    }];
    
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

    for(NSIndexPath *path in [_indexTable indexPathsForVisibleRows]){
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // maybe close door here
    if ([segue.identifier isEqualToString:@"atlas-to-profile"]) {
        [(BSProfileViewController *)[segue destinationViewController] setSectionNumber:selectedSxnView];
    }
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Received Memory Warning!");
    for (BSAtlasSectionView *view in allSectionViews) {
        [view purgeCache];
    }
}

@end
