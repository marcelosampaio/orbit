//
//  ViewController.m
//  orbit
//
//  Created by Marcelo Sampaio on 2/3/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize timer;
@synthesize ball1,ball2,ball3;
@synthesize X,Y;
@synthesize width,height;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"welcome to orbit!");
    
    [self loadBall];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(orbit) userInfo:nil repeats:YES];
    
}


-(void)loadBall
{
    // ball 3
    self.width=45;
    self.height=45;
    self.ball3=[[UIImageView alloc]initWithFrame:CGRectMake([self randomX],[self randomY], self.width, self.height)];
    self.ball3.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball3];
    
    // ball 2
    self.width=30;
    self.height=30;
    self.ball2=[[UIImageView alloc]initWithFrame:CGRectMake([self randomX],[self randomY], self.width, self.height)];
    self.ball2.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball2];

    
    // ball 1
    self.width=15;
    self.height=15;
    self.ball1=[[UIImageView alloc]initWithFrame:CGRectMake([self randomX],[self randomY], self.width, self.height)];
    self.ball1.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball1];
    
}

-(int)randomX
{
    int max=self.view.frame.size.width-self.width;
    self.X = arc4random() %max;
    return self.X;
}

-(int)randomY
{
    int max=self.view.frame.size.height-self.height;
    self.Y = arc4random() %max;
    return self.Y;
}


// Orbit in action
-(void)orbit
{
    NSLog(@"oribit");
}


// Esconder status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
