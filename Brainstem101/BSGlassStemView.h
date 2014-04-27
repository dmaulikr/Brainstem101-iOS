//
//  BSGlassStemView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 6/15/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

@interface BSGlassStemView : UIView

@property (nonatomic, strong) NSMutableArray *imageLayers;

@property (assign) BOOL hidden;

-(id)initWithFrame:(CGRect)frame;
-(void)presentSection:(NSInteger)section;
-(void)show;
-(void)hide;

@end
