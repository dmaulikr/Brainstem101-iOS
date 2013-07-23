//
//  BSClinicalDetailsTableViewCell.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSDeficit.h"

@interface BSClinicalDetailsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextView *deficitsView;
@property (strong, nonatomic) IBOutlet UITextView *symptomsView;

-(void)loadDeficit:(BSDeficit *)deficit;

@end
