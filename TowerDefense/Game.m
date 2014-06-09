//
//  Game.m
//  TowerDefense
//
//  Created by luowei on 14-6-6.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "Game.h"

int tankX;
int tankY;

int creditsNumber;
BOOL tower1;
BOOL tower2;
BOOL tower3;
BOOL tower4;
BOOL tower5;

@interface Game (){
    NSTimer *movement;
}
@property (weak, nonatomic) IBOutlet UIImageView *tank;
@property (weak, nonatomic) IBOutlet UIImageView *corner1;
@property (weak, nonatomic) IBOutlet UIImageView *corner2;
@property (weak, nonatomic) IBOutlet UIButton *nextWave;

@property (weak, nonatomic) IBOutlet UIButton *tower1Space;
@property (weak, nonatomic) IBOutlet UIButton *tower2Space;
@property (weak, nonatomic) IBOutlet UIButton *tower3Space;
@property (weak, nonatomic) IBOutlet UIButton *tower4Space;
@property (weak, nonatomic) IBOutlet UIButton *tower5Space;


@property (weak, nonatomic) IBOutlet UIImageView *tower1DangerZone;
@property (weak, nonatomic) IBOutlet UIImageView *tower2DangerZone;
@property (weak, nonatomic) IBOutlet UIImageView *tower3DangerZone;
@property (weak, nonatomic) IBOutlet UIImageView *tower4DangerZone;
@property (weak, nonatomic) IBOutlet UIImageView *tower5DangerZone;

@property (weak, nonatomic) IBOutlet UIImageView *tower1Bullet;
@property (weak, nonatomic) IBOutlet UIImageView *tower2Bullet;
@property (weak, nonatomic) IBOutlet UIImageView *tower3Bullet;
@property (weak, nonatomic) IBOutlet UIImageView *tower4Bullet;
@property (weak, nonatomic) IBOutlet UIImageView *tower5Bullet;

@property (weak, nonatomic) IBOutlet UIButton *anewTower;
@property (weak, nonatomic) IBOutlet UIButton *cancelNewTower;

@property (weak, nonatomic) IBOutlet UILabel *credits;
@end

@implementation Game

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    _tower1DangerZone.hidden = YES;
    _tower2DangerZone.hidden = YES;
    _tower3DangerZone.hidden = YES;
    _tower4DangerZone.hidden = YES;
    _tower5DangerZone.hidden = YES;
}

- (IBAction)newTower:(id)sender {
    if(creditsNumber > 14){
        _anewTower.hidden = YES;
        _nextWave.hidden = YES;
        _cancelNewTower.hidden = NO;
        
        _tower1Space.hidden = NO;
        _tower2Space.hidden = NO;
        _tower3Space.hidden = NO;
        _tower4Space.hidden = NO;
        _tower5Space.hidden = NO;
        
        
    }
}
- (IBAction)cancelNewTower:(id)sender {
    _cancelNewTower.hidden = YES;
    _anewTower.hidden = NO;
    _nextWave.hidden = NO;
    
    if(tower1 == NO){
        _tower1Space.hidden = YES;
    }
    if(tower2 == NO){
        _tower2Space.hidden = YES;
    }
    if(tower3 == NO){
        _tower3Space.hidden = YES;
    }
    if(tower4 == NO){
        _tower4Space.hidden = YES;
    }
    if(tower5 == NO){
        _tower5Space.hidden = YES;
    }
    
}
- (IBAction)tower1Space:(id)sender {
    if(tower1 == YES){
        _tower1DangerZone.hidden = NO;
        _tower2DangerZone.hidden = YES;
        _tower3DangerZone.hidden = YES;
        _tower4DangerZone.hidden = YES;
        _tower5DangerZone.hidden = YES;
    }else{
        UIImage *buttonImage = [UIImage imageNamed:@"tower.png"];
        [_tower1Space setImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:_tower1Space];
        
        creditsNumber = creditsNumber -15;
        tower1 = YES;
        [self towerSpaced];
    }
}
- (IBAction)tower2Space:(id)sender {
    if(tower2 == YES){
        _tower2DangerZone.hidden = NO;
         _tower1DangerZone.hidden = YES;
         _tower3DangerZone.hidden = YES;
         _tower4DangerZone.hidden = YES;
         _tower5DangerZone.hidden = YES;
    }else{
        UIImage *buttonImage = [UIImage imageNamed:@"tower.png"];
        [_tower2Space setImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:_tower2Space];
        
        creditsNumber = creditsNumber -15;
        tower2 = YES;
        [self towerSpaced];
    }
}
- (IBAction)tower3Space:(id)sender {
    if(tower3 == YES){
        _tower3DangerZone.hidden = NO;
         _tower1DangerZone.hidden = YES;
         _tower2DangerZone.hidden = YES;
         _tower4DangerZone.hidden = YES;
         _tower5DangerZone.hidden = YES;
    }else{
        UIImage *buttonImage = [UIImage imageNamed:@"tower.png"];
        [_tower3Space setImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:_tower3Space];
        
        creditsNumber = creditsNumber -15;
        tower3 = YES;
        [self towerSpaced];
    }
}
- (IBAction)tower4Space:(id)sender {
    if(tower4 == YES){
         _tower4DangerZone.hidden = NO;
         _tower1DangerZone.hidden = YES;
         _tower2DangerZone.hidden = YES;
         _tower3DangerZone.hidden = YES;
         _tower5DangerZone.hidden = YES;
    }else{
        UIImage *buttonImage = [UIImage imageNamed:@"tower.png"];
        [_tower4Space setImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:_tower4Space];
        
        creditsNumber = creditsNumber -15;
        tower4 = YES;
        [self towerSpaced];
    }
}
- (IBAction)tower5Space:(id)sender {
    if(tower5 == YES){
        _tower5DangerZone.hidden = NO;
         _tower1DangerZone.hidden = YES;
         _tower2DangerZone.hidden = YES;
         _tower3DangerZone.hidden = YES;
         _tower4DangerZone.hidden = YES;
    }else{
        UIImage *buttonImage = [UIImage imageNamed:@"tower.png"];
        [_tower5Space setImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:_tower5Space];
        
        creditsNumber = creditsNumber -15;
        tower5 = YES;
        [self towerSpaced];
    }
}

-(void)towerSpaced{
    _nextWave.hidden = NO;
    _cancelNewTower.hidden = YES;
    _anewTower.hidden = NO;
    _credits.text = [NSString stringWithFormat:@"%i",creditsNumber];
    
    if(tower1 == NO){
        _tower1Space.hidden = YES;
    }
    if(tower2 == NO){
        _tower2Space.hidden = YES;
    }
    if(tower3 == NO){
        _tower3Space.hidden = YES;
    }
    if(tower4 == NO){
        _tower4Space.hidden = YES;
    }
    if(tower5 == NO){
        _tower5Space.hidden = YES;
    }
}


- (IBAction)nextWave:(id)sender {
    _anewTower.hidden = YES;
    _nextWave.hidden = YES;
    _tank.hidden = NO;
}

- (void)moving{
    _tank.center = CGPointMake(_tank.center.x + tankX, _tank.center.y+tankY);
    if(CGRectIntersectsRect(_tank.frame, _corner1.frame)){
        _tank.image = [UIImage imageNamed:@"tankUp.png"];
        tankX = 0;
        tankY = -2;
    }
    if(CGRectIntersectsRect(_tank.frame,_corner2.frame)){
        _tank.image = [UIImage imageNamed:@"tankRight.png"];
        tankY = 0;
        tankX = 2;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)hiddenTower:(BOOL)hidden
{
    _tower1Space.hidden = hidden;
    _tower2Space.hidden = hidden;
    _tower3Space.hidden = hidden;
    _tower4Space.hidden = hidden;
    _tower5Space.hidden = hidden;
    _tower1DangerZone.hidden = hidden;
    _tower2DangerZone.hidden = hidden;
    _tower3DangerZone.hidden = hidden;
    _tower4DangerZone.hidden = hidden;
    _tower5DangerZone.hidden = hidden;
    _tower1Bullet.hidden = hidden;
    _tower2Bullet.hidden = hidden;
    _tower3Bullet.hidden = hidden;
    _tower4Bullet.hidden = hidden;
    _tower5Bullet.hidden = hidden;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _corner1.hidden = YES;
    _corner2.hidden = YES;
    _tank.hidden = YES;
    _tank.center = CGPointMake(-26, 200);
    
    tankX = 2;
    tankY = 0;
    
    movement = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moving) userInfo:nil repeats:YES];
    
    [self hiddenTower:YES];
    
    creditsNumber = 15;
    _credits.text = [NSString stringWithFormat:@"%i",creditsNumber];
    
    tower1 = NO;
    tower2 = NO;
    tower3 = NO;
    tower4 = NO;
    tower5 = NO;
    
    _cancelNewTower.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
