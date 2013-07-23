//
//  BSClinicalDetailsTableViewCell.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 3/31/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

#import "BSClinicalDetailsTableViewCell.h"

@implementation BSClinicalDetailsTableViewCell

-(void)loadDeficit:(BSDeficit *)deficit{
    [_deficitsView setText:deficit.deficit];
    [_symptomsView setText:deficit.symptoms];
}

@end
