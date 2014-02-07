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
@synthesize width1,width2,width3,height1,height2,height3;
@synthesize changeDirections,changeBalls;
@synthesize factorX1,factorX2,factorX3,factorY1,factorY2,factorY3;

// drawing
@synthesize lastPoint,moveBackTo,currentPoint,location,lastClick,drawImage;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self formatDrawingArea];
    
    [self loadBall];

    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(orbit) userInfo:nil repeats:YES];
    
}

-(void)formatDrawingArea
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    drawImage.image=[defaults objectForKey:@"drawImageKey"];
    drawImage=[[UIImageView alloc] initWithImage:nil];
    drawImage.frame=self.view.frame;
    [self.view addSubview:drawImage];
}

-(void)loadBall
{
    // ball 3
    self.width3=45;
    self.height3=45;
    self.ball3=[[UIImageView alloc]initWithFrame:CGRectMake([self randomXToValue:self.width3],[self randomYToValue:self.height3], self.width3, self.height3)];
    self.ball3.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball3];
    
    // ball 2
    self.width2=30;
    self.height2=30;
    self.ball2=[[UIImageView alloc]initWithFrame:CGRectMake([self randomXToValue:self.width2],[self randomYToValue:self.height2], self.width2, self.height2)];
    self.ball2.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball2];

    // ball 1
    self.width1=15;
    self.height1=15;
    
    // drawing usage
    self.lastPoint=CGPointMake([self randomXToValue:self.width1], [self randomYToValue:self.height1]);

    
    self.ball1=[[UIImageView alloc]initWithFrame:CGRectMake(self.lastPoint.x,self.lastPoint.y, self.width1, self.height1)];
    self.ball1.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball1];
    
    // change directions flag
    self.changeDirections=YES;
    self.changeBalls=0;
    
}

-(int)randomXToValue:(int)value
{
    int max=self.view.frame.size.width-value;
    return arc4random() %max;

}

-(int)randomYToValue:(int)value
{
    int max=self.view.frame.size.height-value;
    return arc4random() %max;
}


// Orbit in action
-(void)orbit
{
    [self ballCollision];
    
    // check the need of changing directions
    if (changeDirections) {
        [self randomizeFactor];
        self.changeDirections=NO;
    }
    
    // increment position 1
    self.ball1.center=CGPointMake(self.ball1.center.x + self.factorX1, self.ball1.center.y + self.factorY1);  // 0.65
    [self drawBall1Trail];
    
    
    // Width treatment
    if (self.ball1.center.x<self.width1/2) {
        self.factorX1=0-self.factorX1;
    }
    if (self.ball1.center.x>self.view.frame.size.width-(self.width1/2)) {
        self.factorX1=0-self.factorX1;
    }
    
    // Height treatment
    if (self.ball1.center.y<self.height1/2) {
        self.factorY1=0-self.factorY1;
    }
    if (self.ball1.center.y>self.view.frame.size.height-(self.height1/2)) {
        self.factorY1=0-self.factorY1;
    }


    // increment position 2
    self.ball2.center=CGPointMake(self.ball2.center.x + self.factorX2, self.ball2.center.y + self.factorY2);  // 1.3
    
    // Width treatment
    if (self.ball2.center.x<self.width2/2) {
        self.factorX2=0-self.factorX2;
    }
    if (self.ball2.center.x>self.view.frame.size.width-(self.width2/2)) {
        self.factorX2=0-self.factorX2;
    }
    
    // Height treatment
    if (self.ball2.center.y<self.height2/2) {
        self.factorY2=0-self.factorY2;
    }
    if (self.ball2.center.y>self.view.frame.size.height-(self.height2/2)) {
        self.factorY2=0-self.factorY2;
    }
    
    
    // increment position 3
    self.ball3.center=CGPointMake(self.ball3.center.x + self.factorX3, self.ball3.center.y + self.factorY3);  // 3.9

    // Width treatment
    if (self.ball3.center.x<self.width3/2) {
        self.factorX3=0-self.factorX3;
    }
    if (self.ball3.center.x>self.view.frame.size.width-(self.width3/2)) {
        self.factorX3=0-self.factorX3;
    }
    
    // Height treatment
    if (self.ball3.center.y<self.height3/2) {
        self.factorY3=0-self.factorY3;
    }
    if (self.ball3.center.y>self.view.frame.size.height-(self.height3/2)) {
        self.factorY3=0-self.factorY3;
    }
    
    
}


-(void)drawBall1Trail
{
    UIGraphicsBeginImageContext(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height));
    
    [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 0.30);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.00, 0.65, 0.00, 0.05);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.ball1.center.x, self.ball1.center.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    [drawImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)]; // iPhone 5 size
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //lastPoint=currentPoint;
    
    [self.view addSubview:drawImage];

}




-(void)randomizeFactor
{
    if (self.changeBalls==0) {
        self.factorX1=[self randomFactor];
        self.factorY1=[self randomFactor];
        self.factorX2=[self randomFactor];
        self.factorY2=[self randomFactor];
        self.factorX3=[self randomFactor];
        self.factorY3=[self randomFactor];
    }else if (changeBalls==12){
        self.factorX1=[self randomFactor];
        self.factorY1=[self randomFactor];
        self.factorX2=[self randomFactor];
        self.factorY2=[self randomFactor];
    }else if (changeBalls==13){
        self.factorX1=[self randomFactor];
        self.factorY1=[self randomFactor];
        self.factorX3=[self randomFactor];
        self.factorY3=[self randomFactor];
    }else if (changeBalls==23){
        self.factorX2=[self randomFactor];
        self.factorY2=[self randomFactor];
        self.factorX3=[self randomFactor];
        self.factorY3=[self randomFactor];
    }

}


-(float)randomFactor
{
    float factor=0;
    
    // extracting & transforming factor
    factor=arc4random() %3;
    factor=factor+1;
    factor=factor/4;
    // check factor's sign
    int sign=arc4random() %2;
    if (sign==0) {
        factor=factor * -1;
    }
    return factor;
    
}


-(void)ballCollision
{
    if (CGRectIntersectsRect(self.ball1.frame, self.ball2.frame)) {
        self.changeDirections=YES;
        self.changeBalls=12;
    }
    if (CGRectIntersectsRect(self.ball1.frame, self.ball3.frame)) {
        self.changeDirections=YES;
        self.changeBalls=13;
    }
    if (CGRectIntersectsRect(self.ball2.frame, self.ball3.frame)) {
        self.changeDirections=YES;
        self.changeBalls=23;
    }
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
