//
//  VOMax.h
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface VOMax : UIViewController{
UILabel *lbl;
NSTimer *stopTimer;
NSDate *startDate;
BOOL running;
    
AVAudioPlayer* audioPlayer;
    
}

@property (strong,nonatomic) IBOutlet UILabel *lbl;

-(IBAction)startPressed:(id)sender;
-(IBAction)resetPressed:(id)sender;

-(void)updateTimer;
@end


