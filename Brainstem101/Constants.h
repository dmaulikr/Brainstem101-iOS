//
//  Constants.h
//  Brainstem101
//
//  Created by Cameron Ehrlich on 11/13/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#ifndef Brainstem101_Constants_h
#define Brainstem101_Constants_h

typedef NS_ENUM(NSUInteger, BSStructureType) {
    BSStructureTypeNucleus = 0,
    BSStructureTypeTract,
    BSStructureTypeArtery,
    BSStructureTypeMiscellaneous,
    BSStructureTypeCranialNerve,
};

#define DegreesToRadians(x) ((x) * M_PI / 180.0)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define TICK   NSDate *startTime = [NSDate date]; NSLog(@"start");
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])


#define CAPTUREDEVICESCALEFACTOR 0.78
#define CAPTURE_DEVICE_WIDTH 1314
#define CAPTURE_DEVICE_HEIGHT 868


#define NUMBER_OF_SECTIONS 5

#define DEFAULT_CORNER_RADIUS 5
#define PATH_THICKNESS_PROFILE 5
#define PATH_THICKNESS_ATLAS 8
#define PATH_COLOR_ALPHA .6
#define PATH_COLOR_DIVISOR 255

#define STEM_TRANSITION_ANIMATION_SPEED 0.50

#endif
