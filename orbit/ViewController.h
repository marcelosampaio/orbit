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
@property int width;
@property int height;

// balls
@property (nonatomic,strong)UIImageView *ball1;
@property CGPoint ball1Center;

@property (nonatomic,strong)UIImageView *ball2;
@property CGPoint ball2Center;

@property (nonatomic,strong)UIImageView *ball3;
@property CGPoint ball3Center;


@property BOOL caindo;

// direction control
@property bool changeDirections;
@property float factorX1;
@property float factorY1;
@property float factorX2;
@property float factorY2;
@property float factorX3;
@property float factorY3;






// main timer
@property (strong,nonatomic) NSTimer *timer;


@end
