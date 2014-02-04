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
@synthesize ball1Center,ball2Center,ball3Center;
@synthesize width,height;
@synthesize caindo,changeDirections;
@synthesize factorX1,factorX2,factorX3,factorY1,factorY2,factorY3;

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
    self.caindo=YES;
    
    // change directions flag
    self.changeDirections=YES;
    
}

-(int)randomX
{
    int max=self.view.frame.size.width-self.width;
    return arc4random() %max;

}

-(int)randomY
{
    int max=self.view.frame.size.height-self.height;
    return arc4random() %max;
}


// Orbit in action
-(void)orbit
{
    NSLog(@"oribit");
    
    [self collisions];
    
    // check the need of changing directions
    if (changeDirections) {
        factorX1=[self randomFactor];
        factorY1=[self randomFactor];
        factorX2=[self randomFactor];
        factorY2=[self randomFactor];
        factorX3=[self randomFactor];
        factorY3=[self randomFactor];
        changeDirections=NO;
    }
    
    
    // increment position 1
    self.ball1.center=CGPointMake(self.ball1.center.x + self.ball1Center.x, self.ball1.center.y + self.ball1Center.y*0.65);
    self.ball1Center=CGPointMake(self.ball1Center.x+factorX1, self.ball1Center.y+factorY1);

    // increment position 2
    self.ball2.center=CGPointMake(self.ball2.center.x + self.ball2Center.x, self.ball2.center.y + self.ball2Center.y*1.3);
    self.ball2Center=CGPointMake(self.ball2Center.x+factorX2, self.ball2Center.y+factorY2);
    
    // increment position 3
    self.ball3.center=CGPointMake(self.ball3.center.x + self.ball3Center.x, self.ball3.center.y + self.ball3Center.y*3.9);
    self.ball3Center=CGPointMake(self.ball3Center.x+factorX3, self.ball3Center.y+factorY3);


    
    
    
    //    if (ball1.center.y<=self.view.frame.size.height-7.5&&caindo) {
//        self.ball1.center=CGPointMake(self.ball1.center.x + self.X, self.ball1.center.y + self.Y*0.65);
//    }else
//    {
//        self.ball1.center=CGPointMake(self.ball1.center.x + self.X, self.ball1.center.y - self.Y*0.65);
//        self.X=self.X+0.02;
//        caindo=NO;
//    }
//    
//    
//    if (ball2.center.y<=self.view.frame.size.height-15) {
//        self.ball2.center=CGPointMake(self.ball2.center.x + self.X, self.ball2.center.y + self.Y*1.3);
//    }else{
//        self.ball2.center=CGPointMake(self.ball2.center.x - 0.30, self.ball2.center.y);
//    }
//    
//    if (ball3.center.y<=self.view.frame.size.height-22.5) {
//        self.ball3.center=CGPointMake(self.ball3.center.x + self.X, self.ball3.center.y + self.Y*3.9);
//    }else{
//        self.ball3.center=CGPointMake(self.ball3.center.x + 0.30, self.ball3.center.y);
//    }
//
//    self.Y=self.Y+0.01f;

}

-(float)randomFactor
{
    float factor=0;
    
    // extracting & transforming factor
    factor=arc4random() %3;
    factor=factor+1;
    factor=factor/100;
    // check factor's sign
    int sign=arc4random() %2;
    if (sign==0) {
        factor=factor * -1;
    }
    return factor;
    
}


-(void)collisions
{
    NSLog(@"collisions");
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
