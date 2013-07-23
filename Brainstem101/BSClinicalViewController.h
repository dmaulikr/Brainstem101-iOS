//
//  BSClinicalViewController.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/30/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BSSyndrome.h"
#import "BSClinicalDetailsTableViewCell.h"
#import "BSClinicalCollectionViewCell.h"
#import "BSClinicalCollectionViewSectionCell.h"
#import "BSDeficit.h"
#import "BSTutorialImageView.h"

@interface BSClinicalViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, BSTutorialImageViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *syndromeSelectionCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *sectionCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *deficitTableView;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *mugshotView;
@property (weak, nonatomic) IBOutlet UIImageView *boxViewOverlay;
@property (weak, nonatomic) IBOutlet UIImageView *fadingEyeView;

@property (weak, nonatomic) IBOutlet UITextView *descriptionView;

@end
