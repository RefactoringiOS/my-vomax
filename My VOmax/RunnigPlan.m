//
//  RunnigPlan.m
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "RunnigPlan.h"

@interface RunnigPlan ()
@property (strong, nonatomic) IBOutlet UILabel *VO2;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
//Day1
@property (strong, nonatomic) IBOutlet UILabel *intervalD1;
@property (strong, nonatomic) IBOutlet UILabel *tempoD1;

//Day2
@property (strong, nonatomic) IBOutlet UILabel *intervalD2;
@property (strong, nonatomic) IBOutlet UILabel *tempoD2;

//Day3
@property (strong, nonatomic) IBOutlet UILabel *intervalD3;
@property (strong, nonatomic) IBOutlet UILabel *tempoD3;

//Day4
@property (strong, nonatomic) IBOutlet UILabel *intervalD4;
@property (strong, nonatomic) IBOutlet UILabel *tempoD4;

//Day5
@property (strong, nonatomic) IBOutlet UILabel *intervalD5;
@property (strong, nonatomic) IBOutlet UILabel *tempoD5;

//Day6
@property (strong, nonatomic) IBOutlet UILabel *intervalD6;
@property (strong, nonatomic) IBOutlet UILabel *tempoD6;

//Day7
@property (strong, nonatomic) IBOutlet UILabel *intervalD7;
@property (strong, nonatomic) IBOutlet UILabel *tempoD7;

//Day8
@property (strong, nonatomic) IBOutlet UILabel *intervalD8;
@property (strong, nonatomic) IBOutlet UILabel *tempoD8;

//Day9
@property (strong, nonatomic) IBOutlet UILabel *intervalD9;
@property (strong, nonatomic) IBOutlet UILabel *tempoD9;

//Day10
@property (strong, nonatomic) IBOutlet UILabel *intervalD10;
@property (strong, nonatomic) IBOutlet UILabel *tempoD10;

//Day11
@property (strong, nonatomic) IBOutlet UILabel *intervalD11;
@property (strong, nonatomic) IBOutlet UILabel *tempoD11;

@property (strong, nonatomic) IBOutlet UIVisualEffectView *Alert;


@end


@implementation RunnigPlan
@synthesize VO2;
@synthesize scroll;
@synthesize intervalD1;
@synthesize tempoD1;

@synthesize intervalD2;
@synthesize tempoD2;

@synthesize intervalD3;
@synthesize tempoD3;

@synthesize intervalD4;
@synthesize tempoD4;

@synthesize intervalD5;
@synthesize tempoD5;

@synthesize intervalD6;
@synthesize tempoD6;

@synthesize intervalD7;
@synthesize tempoD7;

@synthesize intervalD8;
@synthesize tempoD8;

@synthesize intervalD9;
@synthesize tempoD9;

@synthesize intervalD10;
@synthesize tempoD10;

@synthesize intervalD11;
@synthesize tempoD11;
@synthesize Alert;





- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroll.contentSize = CGSizeMake(320, 860);
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    VO2.text = [defaults objectForKey:@"VO2"];
    
    double vo2 = [VO2.text doubleValue];
    NSLog(@"%f",vo2);
    
    if (VO2.text.length ==0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You need your VO2Max!" message:@"To perform the Runnig Plan it is necessary to know your VO2Max. Please return to the main menu and select VO2Max and perform the test." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        scroll.alpha=0;
        Alert.alpha=0;
    }
    else{
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            Alert.alpha=1;
            
        } completion:^(BOOL finished) {
            
        }];   
        
     scroll.alpha=1;
    
    if (vo2 >= 20 && vo2 <=47) {
        intervalD1.text=@"8x400mts 4x200mts 4x100mts";
        tempoD1.text=@"4.0min / 4.20max";
        
        intervalD2.text=@"8x100mts 3x400mts 2x500mts";
        tempoD2.text=@"4.0min / 4.20max";
        
        intervalD3.text=@"12x50mts 3x100mts 3x200mts";
        tempoD3.text=@"3.0min / 3.10max";
        
        intervalD4.text=@"5x300mts 5x200mts 5x100mts";
        tempoD4.text=@"4.0min / 4.20max";
        
        intervalD5.text=@"4x500mts 4x200mts 4x100mts";
        tempoD5.text=@"4.0min / 4.20max";
        
        intervalD6.text=@"2x800mts 4x200mts 2x200mts";
        tempoD6.text=@"4.0min / 4.20max";
        
        intervalD7.text=@"8x400mts 4x200mts 4x100mts";
        tempoD7.text=@"4.0min / 4.20max";
        
        intervalD8.text=@"5x200mts 5x200mts 5x200mts";
        tempoD8.text=@"4.0min / 4.20max";
        
        intervalD9.text=@"2x1000mts 2800mts 2x500mts";
        tempoD9.text=@"4.0min / 4.20max";
        
        intervalD10.text=@"12x50mts 3x100mts 3x200mts";
        tempoD10.text=@"4.0min / 4.20max";
        
        intervalD11.text=@"2x2000mts 2x1000mts 5x200mts";
        tempoD11.text=@"4.0min / 4.20max";
        
    }
   
  else  if (vo2 >= 47 && vo2 <=50) {
      intervalD1.text=@"8x400mts 4x200mts 4x100mts";
      tempoD1.text=@"4.0min / 4.20max";
      
      intervalD2.text=@"8x100mts 3x400mts 2x500mts";
      tempoD2.text=@"4.0min / 4.20max";
      
      intervalD3.text=@"12x50mts 3x100mts 3x200mts";
      tempoD3.text=@"3.0min / 3.10max";
      
      intervalD4.text=@"5x300mts 5x200mts 5x100mts";
      tempoD4.text=@"4.0min / 4.20max";
      
      intervalD5.text=@"4x500mts 4x200mts 4x100mts";
      tempoD5.text=@"4.0min / 4.20max";
      
      intervalD6.text=@"2x800mts 4x200mts 2x200mts";
      tempoD6.text=@"4.0min / 4.20max";
      
      intervalD7.text=@"8x400mts 4x200mts 4x100mts";
      tempoD7.text=@"4.0min / 4.20max";
      
      intervalD8.text=@"5x200mts 5x200mts 5x200mts";
      tempoD8.text=@"4.0min / 4.20max";
      
      intervalD9.text=@"2x1000mts 2800mts 2x500mts";
      tempoD9.text=@"4.0min / 4.20max";
      
      intervalD10.text=@"12x50mts 3x100mts 3x200mts";
      tempoD10.text=@"4.0min / 4.20max";
      
      intervalD11.text=@"2x2000mts 2x1000mts 5x200mts";
      tempoD11.text=@"4.0min / 4.20max";
  }
  else  if (vo2 >= 50 && vo2 <=55) {
      intervalD1.text=@"8x400mts 4x200mts 4x100mts";
      tempoD1.text=@"3.50min / 4.00max";
      
      intervalD2.text=@"8x100mts 3x400mts 2x500mts";
      tempoD2.text=@"3.50min / 4.00max";
      
      intervalD3.text=@"12x50mts 3x100mts 3x200mts";
      tempoD3.text=@"3.50min / 4.00max";
      
      intervalD4.text=@"5x300mts 5x200mts 5x100mts";
      tempoD4.text=@"3.50min / 4.00max";
      
      intervalD5.text=@"4x500mts 4x200mts 4x100mts";
      tempoD5.text=@"3.50min / 4.00max";
      
      intervalD6.text=@"2x800mts 4x200mts 2x200mts";
      tempoD6.text=@"3.50min / 4.00max";
      
      intervalD7.text=@"8x400mts 4x200mts 4x100mts";
      tempoD7.text=@"3.50min / 4.00max";
      
      intervalD8.text=@"5x200mts 5x200mts 5x200mts";
      tempoD8.text=@"3.50min / 4.00max";
      
      intervalD9.text=@"2x1000mts 2800mts 2x500mts";
      tempoD9.text=@"3.50min / 4.00max";
      
      intervalD10.text=@"12x50mts 3x100mts 3x200mts";
      tempoD10.text=@"3.50min / 4.00max";
      
      intervalD11.text=@"2x2000mts 2x1000mts 5x200mts";
      tempoD11.text=@"3.50min / 4.00max";
  }
  else  if (vo2 >= 55 && vo2 <=60) {
      intervalD1.text=@"8x400mts 4x200mts 4x100mts";
      tempoD1.text=@"3.20min / 3.30max";
      
      intervalD2.text=@"8x100mts 3x400mts 2x500mts";
      tempoD2.text=@"3.20min / 3.30max";
      
      intervalD3.text=@"12x50mts 3x100mts 3x200mts";
      tempoD3.text=@"3.20min / 3.30max";
      
      intervalD4.text=@"5x300mts 5x200mts 5x100mts";
      tempoD4.text=@"3.20min / 3.30max";
      
      intervalD5.text=@"4x500mts 4x200mts 4x100mts";
      tempoD5.text=@"3.20min / 3.30max";
      
      intervalD6.text=@"2x800mts 4x200mts 2x200mts";
      tempoD6.text=@"3.20min / 3.30max";
      
      intervalD7.text=@"8x400mts 4x200mts 4x100mts";
      tempoD7.text=@"3.20min / 3.30max";
      
      intervalD8.text=@"5x200mts 5x200mts 5x200mts";
      tempoD8.text=@"3.20min / 3.30max";
      
      intervalD9.text=@"2x1000mts 2800mts 2x500mts";
      tempoD9.text=@"3.20min / 3.30max";
      
      intervalD10.text=@"12x50mts 3x100mts 3x200mts";
      tempoD10.text=@"3.20min / 3.30max";
      
      intervalD11.text=@"2x2000mts 2x1000mts 5x200mts";
      tempoD11.text=@"3.20min / 3.30max";

  }
  else  if (vo2 >= 60 && vo2 <=65) {
      intervalD1.text=@"8x400mts 4x200mts 4x100mts";
      tempoD1.text=@"3.20min / 3.30max";
      
      intervalD2.text=@"8x100mts 3x400mts 2x500mts";
      tempoD2.text=@"3.20min / 3.30max";
      
      intervalD3.text=@"12x50mts 3x100mts 3x200mts";
      tempoD3.text=@"3.20min / 3.30max";
      
      intervalD4.text=@"5x300mts 5x200mts 5x100mts";
      tempoD4.text=@"3.20min / 3.30max";
      
      intervalD5.text=@"4x500mts 4x200mts 4x100mts";
      tempoD5.text=@"3.20min / 3.30max";
      
      intervalD6.text=@"2x800mts 4x200mts 2x200mts";
      tempoD6.text=@"3.20min / 3.30max";
      
      intervalD7.text=@"8x400mts 4x200mts 4x100mts";
      tempoD7.text=@"3.20min / 3.30max";
      
      intervalD8.text=@"5x200mts 5x200mts 5x200mts";
      tempoD8.text=@"3.20min / 3.30max";
      
      intervalD9.text=@"2x1000mts 2800mts 2x500mts";
      tempoD9.text=@"3.20min / 3.30max";
      
      intervalD10.text=@"12x50mts 3x100mts 3x200mts";
      tempoD10.text=@"3.20min / 3.30max";
      
      intervalD11.text=@"2x2000mts 2x1000mts 5x200mts";
      tempoD11.text=@"3.20min / 3.30max";

  }
  else  if (vo2 >= 65 && vo2 <=70) {
      intervalD1.text=@"8x400mts 4x200mts 4x100mts";
      tempoD1.text=@"3.0min / 3.20max";
      
      intervalD2.text=@"8x100mts 3x400mts 2x500mts";
      tempoD2.text=@"3.0min / 3.20max";
      
      intervalD3.text=@"12x50mts 3x100mts 3x200mts";
      tempoD3.text=@"3.0min / 3.20max";
      
      intervalD4.text=@"5x300mts 5x200mts 5x100mts";
      tempoD4.text=@"3.0min / 3.20max";
      
      intervalD5.text=@"4x500mts 4x200mts 4x100mts";
      tempoD5.text=@"3.0min / 3.20max";
      
      intervalD6.text=@"2x800mts 4x200mts 2x200mts";
      tempoD6.text=@"3.0min / 3.20max";
      
      intervalD7.text=@"8x400mts 4x200mts 4x100mts";
      tempoD7.text=@"3.0min / 3.20max";
      
      intervalD8.text=@"5x200mts 5x200mts 5x200mts";
      tempoD8.text=@"3.0min / 3.20max";
      
      intervalD9.text=@"2x1000mts 2800mts 2x500mts";
      tempoD9.text=@"3.0min / 3.20max";
      
      intervalD10.text=@"12x50mts 3x100mts 3x200mts";
      tempoD10.text=@"3.0min / 3.20max";
      
      intervalD11.text=@"2x2000mts 2x1000mts 5x200mts";
      tempoD11.text=@"3.0min / 3.20max";
  }
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)Testx:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"VOMax"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)closeAlert:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
       
        Alert.alpha=0;
        
    } completion:^(BOOL finished) {
        
    }];
}
@end
