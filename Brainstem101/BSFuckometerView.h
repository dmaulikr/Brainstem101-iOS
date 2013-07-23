//
//  BSFuckometerView.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 4/4/13.
//  Copyright (c) 2013 Brainstem101. All rights reserved.
//

@interface BSFuckometerView : UIView

@property (strong, nonatomic) UIImageView *backgroundView;
@property (strong, nonatomic) UIImageView *needleView;

-(void)beginLoadingWithDuration:(int)duration andCallback:(void (^)(void))completionBlock;

@end
