//
//  BSViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSStructure.h"
#import "BSStemView.h"
#import "BSGlassStemView.h"
#import "BSAtlasSectionView.h"
#import "BSTutorialImageView.h"

@interface BSAtlasViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate, BSTutorialImageViewDelegate>

@property (weak, nonatomic)     IBOutlet UIImageView *orangeImageView;
@property (weak, nonatomic)     IBOutlet UITableView *indexTable;
@property (weak, nonatomic)     IBOutlet UIImageView *doorShadowImageView;
@property (weak, nonatomic)     IBOutlet UIImageView *doorImageView;
//@property (weak, nonatomic)     IBOutlet UIImageView *doorDisguiseImageView;
@property (weak, nonatomic)     IBOutlet UIImageView *mainPanel;
@property (weak, nonatomic)     IBOutlet UIImageView *mainPanelOverlay;
@property (weak, nonatomic)     IBOutlet UIImageView *mainPanelShadow;
@property (weak, nonatomic)     IBOutlet UITextField *searchBox;
@property (strong, nonatomic)   BSStemView *stemView;
@property (strong, nonatomic)   BSGlassStemView *glassStemView;
@property (strong, nonatomic)   BSStructure *currentStructure;
@property (assign)              int stemViewStyle;

- (IBAction)handleSingleTap:(UITapGestureRecognizer*)sender;
- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)handleRotation:(UIRotationGestureRecognizer *)sender;

- (IBAction)clinicalButtonAction:(id)sender;

- (IBAction)searchButtonPressed:(id)sender;
- (IBAction)rotateAllSections:(id)sender;
- (IBAction)minusButton:(id)sender;
- (IBAction)plusButton:(id)sender;

@end
