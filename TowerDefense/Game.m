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

@interface Game (){
    NSTimer *movement;
}
@property (weak, nonatomic) IBOutlet UIImageView *tank;
@property (weak, nonatomic) IBOutlet UIImageView *corner1;
@property (weak, nonatomic) IBOutlet UIImageView *corner2;
@property (weak, nonatomic) IBOutlet UIButton *nextWave;

@end

@implementation Game

- (IBAction)nextWave:(id)sender {
    _nextWave.hidden = YES;
    _tank.hidden = NO;
}

- (void)moving{
    _tank.center = CGPointMake(_tank.center.x + tankX, _tank.center.y+tankY);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _corner1.hidden = YES;
    _corner2.hidden = YES;
    _tank.hidden = YES;
    _tank.center = CGPointMake(-26, 200);
    
    movement = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moving) userInfo:nil repeats:YES];
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
