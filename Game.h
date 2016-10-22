//
//  Game.h
//  Buzzy Bee
//
//  Created by David Martin on 21/11/2015.
//  Copyright (c) 2015 codeworx. All rights reserved.
//

#import <UIKit/UIKit.h>

int BeeFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;



@interface Game : UIViewController
{
    
    IBOutlet UIImageView *Bee;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BeeMovement;
    NSTimer *TunnelMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BeeMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;


@end
