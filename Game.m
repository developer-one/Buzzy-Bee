//
//  Game.m
//  Buzzy Bee
//
//  Created by David Martin on 21/11/2015.
//  Copyright (c) 2015 codeworx. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    if(ScoreNumber > HighScoreNumber){
        
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
        
    }
    
    [TunnelMovement invalidate];
    [BeeMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bee.hidden = YES;
    
}


-(void)Score{
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
}

-(IBAction)StartGame:(id)sender{
    
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO;
    
    StartGame.hidden = YES;
    
    BeeMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BeeMoving)
                                                 userInfo:nil repeats:YES];
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}


-(void)TunnelMoving{
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if(TunnelTop.center.x < -53){
        
        [self PlaceTunnels];
        
    }
    
    if(TunnelBottom.center.x == 17){
        [self Score];
    }
    
    
    if(CGRectIntersectsRect(Bee.frame, TunnelTop.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bee.frame, TunnelBottom.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bee.frame, Top.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bee.frame, Bottom.frame)){
        [self GameOver];
    }
    
    
}

-(void)PlaceTunnels{
    
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 700;
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);
}


-(void)BeeMoving{
    
    Bee.center = CGPointMake(Bee.center.x, Bee.center.y - BeeFlight);
    
    BeeFlight = BeeFlight - 5;
    
    if(BeeFlight < -15){
        BeeFlight = -15;
    }
    
    if(BeeFlight > 0){
        Bee.image = [UIImage imageNamed:@"Bee Up.png"];
    }
    if(BeeFlight < 0){
        Bee.image = [UIImage imageNamed:@"Bee Down.png"];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BeeFlight = 30;
    
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
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
