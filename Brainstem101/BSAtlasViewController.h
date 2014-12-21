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

@interface BSAtlasViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate, BSTutorialImageViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UITableView *indexTable;
@property (strong, nonatomic) UITextField *searchBox;
@property (strong, nonatomic) BSStemView *stemView;
@property (strong, nonatomic) BSGlassStemView *glassStemView;
@property (strong, nonatomic) UIImageView *searchImageView;
@property (strong, nonatomic) BSStructure *currentStructure;
@property (assign, nonatomic) NSInteger selectedSectionNumber;

@property (strong, nonatomic) UIButton *clinicalButton;
@property (strong, nonatomic) UIButton *backButton;

- (IBAction)handleSingleTap:(UITapGestureRecognizer*)sender;
- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)handleRotation:(UIRotationGestureRecognizer *)sender;

@end
