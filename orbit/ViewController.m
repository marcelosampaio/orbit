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
@synthesize changeDirections;
@synthesize factorX1,factorX2,factorX3,factorY1,factorY2,factorY3;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadBall];

    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(orbit) userInfo:nil repeats:YES];
    
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
    self.ball1=[[UIImageView alloc]initWithFrame:CGRectMake([self randomXToValue:self.width1],[self randomYToValue:self.height1], self.width1, self.height1)];
    self.ball1.image=[UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ball1];
    
    // change directions flag
    self.changeDirections=YES;
    
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
//    [self collisions];
    
    // check the need of changing directions
    if (changeDirections) {
        self.factorX1=[self randomFactor];
        self.factorY1=[self randomFactor];
        self.factorX2=[self randomFactor];
        self.factorY2=[self randomFactor];
        self.factorX3=[self randomFactor];
        self.factorY3=[self randomFactor];
        self.changeDirections=NO;
    }
    
    // increment position 1
    self.ball1.center=CGPointMake(self.ball1.center.x + self.factorX1, self.ball1.center.y + self.factorY1);  // 0.65
    
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



-(float)randomFactor
{
    float factor=0;
    
    // extracting & transforming factor
    factor=arc4random() %5;
    factor=factor+1;
    factor=factor/10;
    // check factor's sign
    int sign=arc4random() %2;
    if (sign==0) {
        factor=factor * -1;
    }
    return factor;
    
}


-(void)collisions
{
    // check borders collisions
    [self borderCollision];
    
    
    // chech balls colision
    [self ballCollision];
    
    
    
}


-(void)borderCollision
{
    // ball 1 ============
    // top border
    if (self.ball1.center.y<=self.height1/2) {
        self.factorY1=(self.factorY1 * -1)+0.05;

//        [self debugBall:1 xCoordinate:self.ball1.center.x yCoordinate:self.ball1.center.y status:@"ball1 saiu por cima"];
    }
    
    // bottom border
    if (self.ball1.center.y>=self.view.frame.size.height-(self.height1/2)) {
        [self debugBall:1 xCoordinate:self.ball1.center.x yCoordinate:self.ball1.center.y status:@"ball1 saiu por baixo"];    }
    
    // left border
    if (self.ball1.center.x<=self.width1/2) {
        [self debugBall:1 xCoordinate:self.ball1.center.x yCoordinate:self.ball1.center.y status:@"ball1 saiu pela esquerda"];
    }
    
    // right border
    if (self.ball1.center.x>=self.view.frame.size.width-(self.width1/2)) {
        [self debugBall:1 xCoordinate:self.ball1.center.x yCoordinate:self.ball1.center.y status:@"ball1 saiu pela direita"];
    }
    
    
    // ball 2 ==========
    // top border
    if (self.ball2.center.y<=self.height2/2) {
        [self debugBall:2 xCoordinate:self.ball2.center.x yCoordinate:self.ball2.center.y status:@"ball2 saiu por cima"];
    }
    
    // bottom border
    if (self.ball2.center.y>=self.view.frame.size.height-(self.height2/2)) {
        [self debugBall:2 xCoordinate:self.ball2.center.x yCoordinate:self.ball2.center.y status:@"ball2 saiu por baixo"];    }
    
    // left border
    if (self.ball2.center.x<=self.width2/2) {
        [self debugBall:2 xCoordinate:self.ball2.center.x yCoordinate:self.ball2.center.y status:@"ball2 saiu pela esquerda"];    }
    
    // right border
    if (self.ball2.center.x>=self.view.frame.size.width-(self.width2/2)) {
        [self debugBall:2 xCoordinate:self.ball2.center.x yCoordinate:self.ball2.center.y status:@"ball2 saiu pela direita"];
    }
    
    
    // ball 3 ==========
    // top border
    if (self.ball3.center.y<=self.height3/2) {
        [self debugBall:3 xCoordinate:self.ball3.center.x yCoordinate:self.ball3.center.y status:@"ball3 saiu por cima"];
    }
    
    // bottom border
    if (self.ball3.center.y>=self.view.frame.size.height-(self.height3/2)) {
        [self debugBall:3 xCoordinate:self.ball3.center.x yCoordinate:self.ball3.center.y status:@"ball3 saiu por baixo"];
    }
    
    // left border
    if (self.ball3.center.x<=self.width3/2) {
        [self debugBall:3 xCoordinate:self.ball3.center.x yCoordinate:self.ball3.center.y status:@"ball3 saiu pela esquerda"];
    }
    
    // right border
    if (self.ball3.center.x>=self.view.frame.size.width-(self.width3/2)) {
        [self debugBall:3 xCoordinate:self.ball3.center.x yCoordinate:self.ball3.center.y status:@"ball3 saiu pela direita"];
    }

}


-(void)debugBall:(int)ball xCoordinate:(float)x yCoordinate:(float)y status:(NSString *)status
{
    if (ball==2||ball==3) {
        return;
    }
    NSLog(@"ball %d x=%f  y=%f  %@",ball,x,y,status);
    NSLog(@"Limite do TOP=%d",self.height1/2);
    NSLog(@"Limite de BAIXO=%f",self.view.frame.size.height-(self.height1/2));
    NSLog(@"Limite da ESQUERDA=%d",self.width1/2);
    NSLog(@"Limite da DIREITA=%f",self.view.frame.size.width-(self.width1/2));
    NSLog(@"fator X=%f",self.factorX1);
    NSLog(@"fator Y=%f",self.factorY1);
    
    [timer invalidate];
}




-(void)ballCollision
{
    NSLog(@"ball collision");
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
