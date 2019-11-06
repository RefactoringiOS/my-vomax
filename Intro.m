//
//  Intro.m
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "Intro.h"

@interface Intro ()
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (strong, nonatomic) IBOutlet UITextView *text;
@property (strong, nonatomic) IBOutlet UIView *MyView2;
@property (strong, nonatomic) IBOutlet UIView *MyView3;
@property (strong, nonatomic) IBOutlet UIView *MyView4;
@property (strong, nonatomic) IBOutlet UIButton *Cont;
@property (strong, nonatomic) IBOutlet UIView *MyView5;

@property (strong, nonatomic) IBOutlet UIButton *C001;
@property (strong, nonatomic) IBOutlet UIButton *C002;
@property (strong, nonatomic) IBOutlet UIButton *C003;
@property (strong, nonatomic) IBOutlet UIButton *C004;
@property (strong, nonatomic) IBOutlet UIButton *C005;

@property (strong, nonatomic) IBOutlet UIImageView *P001;
@property (strong, nonatomic) IBOutlet UIImageView *P002;
@property (strong, nonatomic) IBOutlet UIImageView *P003;
@property (strong, nonatomic) IBOutlet UIImageView *P004;
@property (strong, nonatomic) IBOutlet UIImageView *P005;

@end

@implementation Intro
@synthesize MyView;
@synthesize text;
@synthesize MyView2;
@synthesize MyView3;
@synthesize MyView4;
@synthesize MyView5;
@synthesize P001;
@synthesize P002;
@synthesize P003;
@synthesize P004;
@synthesize C001;
@synthesize C002;
@synthesize C003;
@synthesize C004;
@synthesize P005;
@synthesize C005;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     _lenguage.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"Idioma"];
    NSLog(@"%@",_lenguage.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BMI:(id)sender {
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
       MyView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)VOMax:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    MyView2.alpha=1;
    } completion:^(BOOL finished) {
    }];

}
- (IBAction)RunningPlan:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    MyView3.alpha=1;
    } completion:^(BOOL finished) {
    }];

}
- (IBAction)PaceCalculator:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
     MyView4.alpha=1;
           C002.alpha=1;
    } completion:^(BOOL finished) {
    }];
}

- (IBAction)WaterCalculator:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        MyView5.alpha=1;
           C002.alpha=1;
        C005.alpha=1;
    } completion:^(BOOL finished) {
    }];
}

- (IBAction)CloseView:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
      MyView.alpha=0;
      P001.alpha=1;
      C002.alpha=1;
    } completion:^(BOOL finished) {
    }];
}
- (IBAction)Close2:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    MyView2.alpha=0;
    P002.alpha=1;
    C003.alpha=1;
    } completion:^(BOOL finished) {
    }];
}
- (IBAction)Close3:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    MyView3.alpha=0;
    P003.alpha=1;
    C004.alpha=1;
    } completion:^(BOOL finished) {
    }];
}
- (IBAction)Close4:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    MyView4.alpha=0;
    P004.alpha=1;
    C005.alpha=1;

    } completion:^(BOOL finished) {
    }];
}

- (IBAction)Close5:(id)sender {
   
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            MyView5.alpha=0;
            P005.alpha=1;
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"We recommend consulting a specialist before starting a nutrition or hydration plan. Consult a specialist before starting any high-performance activity." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            _Cont.alpha=1;
        } completion:^(BOOL finished) {
        }];
    
 _Cont.alpha=1;
}


@end
