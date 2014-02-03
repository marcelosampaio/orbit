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
@property int X;
@property int Y;
@property int width;
@property int height;

// balls
@property (nonatomic,strong)UIImageView *ball1;
@property (nonatomic,strong)UIImageView *ball2;
@property (nonatomic,strong)UIImageView *ball3;

// main timer
@property (strong,nonatomic) NSTimer *timer;


@end
