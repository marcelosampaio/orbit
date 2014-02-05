//
//  ViewController.h
//  orbit
//
//  Created by Marcelo Sampaio on 2/3/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// base coordinates
@property int width1;
@property int height1;

@property int width2;
@property int height2;

@property int width3;
@property int height3;


// balls
@property (nonatomic,strong)UIImageView *ball1;

@property (nonatomic,strong)UIImageView *ball2;

@property (nonatomic,strong)UIImageView *ball3;

// direction control
@property bool changeDirections;
@property int changeBalls;
@property float factorX1;
@property float factorY1;
@property float factorX2;
@property float factorY2;
@property float factorX3;
@property float factorY3;






// main timer
@property (strong,nonatomic) NSTimer *timer;


@end
