//
//  VOMax.m
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "VOMax.h"

@interface VOMax ()
@property (strong, nonatomic) IBOutlet UIButton *ButtonCall;
@property (strong, nonatomic) IBOutlet UIButton *Satrt;
@property (strong, nonatomic) IBOutlet UITextField *Age;
@property (strong, nonatomic) IBOutlet UITextField *genderTextField;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *ViewInfo;
@property (strong, nonatomic) IBOutlet UITextField *BMI;
@property (strong, nonatomic) IBOutlet UITextField *Revisado;
@property (strong, nonatomic) IBOutlet UITextField *TimeTO2;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UILabel *Cal001;
@property (strong, nonatomic) IBOutlet UIView *ViewCal;
@property (strong, nonatomic) IBOutlet UILabel *pace;
@property (strong, nonatomic) IBOutlet UILabel *testxt;
@property (strong, nonatomic) IBOutlet UILabel *KM05;
@property (strong, nonatomic) IBOutlet UILabel *KM10;
@property (strong, nonatomic) IBOutlet UILabel *KM21;
@property (strong, nonatomic) IBOutlet UILabel *KM42;
@property (strong, nonatomic) IBOutlet UILabel *DistaTex;
@property (strong, nonatomic) IBOutlet UILabel *Mst;
@property (strong, nonatomic) IBOutlet UILabel *Line;
@property (strong, nonatomic) IBOutlet UILabel *lastTex;
@property (strong, nonatomic) IBOutlet UILabel *intro;
@property (strong, nonatomic) IBOutlet UILabel *starting;
@property (strong, nonatomic) IBOutlet UIButton *skip;
@property (strong, nonatomic) IBOutlet UILabel *lenguage;

@end

@implementation VOMax
@synthesize Age;
@synthesize lbl;
@synthesize Satrt;
@synthesize genderTextField;
@synthesize ViewInfo;
@synthesize Cal001;
@synthesize BMI;
@synthesize Revisado;
@synthesize TimeTO2;
@synthesize ViewCal;
@synthesize pace;
@synthesize testxt;
@synthesize KM05;
@synthesize KM10;
@synthesize KM21;
@synthesize KM42;
@synthesize Line;
@synthesize Mst;
@synthesize DistaTex;
@synthesize lastTex;
@synthesize intro;
@synthesize starting;



int Male = 1;
int Female = 0;
double  TimeT = 11.288;
double  VO2 = 22.351;
double timerInterval = 1.0f;



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   lbl.text = @"00:00:00";
    running = FALSE;
    
    
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    BMI.text = [defaults objectForKey:@"BMI"];
//    
//    if (BMI.text.length ==0) {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You need your BMI!" message:@"To perform the VO2 max test it is necessary to know your BMI. Please return to the main menu and select BMI/BMR Fill in all the fields and press calculate. Then you can do the VO2max test" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:ok];
//        
//        [self presentViewController:alertController animated:YES completion:nil];
//    }
//    
//    [Satrt.layer setCornerRadius:5.0f];
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.Age resignFirstResponder];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(IBAction)startPressed:(id)sender{
    
    if (BMI.text.length ==0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You need calculate your BMI!" message:@"To perform the VO2 max test it is necessary to know your BMI. Please return to the main menu and select BMI/BMR Fill in all the fields and press calculate. Then you can do the VO2max test" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else{
        
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
           Satrt.alpha=0;
            starting.alpha=0;
        } completion:^(BOOL finished) {
            
        }];
       
        _timer = [NSTimer scheduledTimerWithTimeInterval: 721
                                                  target: self
                                                selector: @selector(updatestuff:)
                                                userInfo: nil
                                                 repeats: NO];
        
    startDate = [NSDate date];
    
    if(!running){
        running = TRUE;
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        if (stopTimer == nil) {
            stopTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
            
        }
    }else{
        running = FALSE;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        [stopTimer invalidate];
        stopTimer = nil;
    }
    }
}
-(void)updateTimer{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString=[dateFormatter stringFromDate:timerDate];
    lbl.text = timeString;
   
}

-(IBAction)resetPressed:(id)sender{
    [stopTimer invalidate];
    stopTimer = nil;
    startDate = [NSDate date];
    lbl.text = @"00:00:00";
    running = FALSE;
}

- (IBAction)segmentSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.genderTextField.text = @"1";
    
    }
    else{
        self.genderTextField.text = @"0";
        
        
    }
}



- (IBAction)Closed:(id)sender {
    
    _lenguage.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"Idioma"];
    
    if ([_lenguage.text isEqualToString:@"Spanol"]) {
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            ViewInfo.alpha =0;
            //ViewInfo.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        } completion:^(BOOL finished) {
            
        }];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Advertencias!" message:@"No ejecute una prueba de VO2 máx si está embarazada o tiene cualquier signo de una afección cardíaca. Realizar una prueba de VO2 máximo requiere el máximo esfuerzo y puede ser peligroso para algunas personas. Asegúrese de que tiene el visto bueno de su médico, para realizar una prueba tan exigente. Si usted es un atleta principiante hay actividades menos exigentes que puede hacer. Medir el VO2 max, como una prueba de caminar o nadar." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Entiendo" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if ([_lenguage.text isEqualToString:@"Ingles"]) {
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            ViewInfo.alpha =0;
            //ViewInfo.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        } completion:^(BOOL finished) {
            
        }];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warnings!" message:@"Do not do a VO2 max running test if you're pregnant or have any signs of a heart condition. Performing a VO2 max running test requires maximum effort and can be dangerous for some people. Make sure you have clearance from your doctor to perform such a vigorous task. If you're a beginner athlete there are less demanding activities that you can do to measure VO2 max, such as a walking or swimming test." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if ([_lenguage.text isEqualToString:@"Polaco"]) {
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            ViewInfo.alpha =0;
            //ViewInfo.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        } completion:^(BOOL finished) {
            
        }];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warnings!" message:@"Do not do a VO2 max running test if you're pregnant or have any signs of a heart condition. Performing a VO2 max running test requires maximum effort and can be dangerous for some people. Make sure you have clearance from your doctor to perform such a vigorous task. If you're a beginner athlete there are less demanding activities that you can do to measure VO2 max, such as a walking or swimming test." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    

    
}



- (IBAction)Calculate:(id)sender {

    double distance = [self.Age.text doubleValue];
    NSLog(@"Distance: %.f",distance);
    Cal001.text =  [NSString stringWithFormat:@"%.f", VO2 * distance - TimeT];
    
    NSUserDefaults *seting =[NSUserDefaults standardUserDefaults];
    NSString* firstData = Cal001.text;
    [seting setObject:firstData forKey:@"VO2"];
    [seting synchronize];
    
    if (distance >=0 && distance <=1.700) {
        pace.text = @"7:04";
        KM05.text= @"00:35:20";
        KM10.text= @"01:10:40";
        KM21.text= @"02:29:32";
        KM42.text= @"04:58:10.";
    }
    else  if (distance >= 1.700 && distance <=1.750 ) {
        pace.text = @"6:51";
        KM05.text= @"00:34:15";
        KM10.text= @"01:08:30";
        KM21.text= @"02:24:31";
        KM42.text= @"04:49:02";
    }
    else  if (distance  >=1.750 && distance <=1.800) {
        pace.text = @"6:40";
        KM05.text= @"00:33:20";
        KM10.text= @"01:06:40";
        KM21.text= @"02:20:38";
        KM42.text= @"04:41:17";
    }
    else  if (distance >=1.800 && distance <=1.850) {
        pace.text = @"6:29";
        KM05.text= @"00:32:30";
        KM10.text= @"01:04:50";
        KM21.text= @"02:16:46";
        KM42.text= @"04:33:44";
    }
    else  if (distance >=1.850 && distance <=1.900) {
        pace.text = @"6:19";
        KM05.text= @"00:31:35";
        KM10.text= @"01:03:01";
        KM21.text= @"02:13:15";
        KM42.text= @"04:26:33";
    }
    else  if (distance >=1.900 && distance <=1.950) {
        pace.text = @"6:09";
        KM05.text= @"00:30:45";
        KM10.text= @"01:01:30";
        KM21.text= @"02:09:44";
        KM42.text= @"04:19:29";
    }
    else  if (distance >=1.950 && distance <=2.000) {
        pace.text = @"6:00";
        KM05.text= @"00:30:00";
        KM10.text= @"01:00:00";
        KM21.text= @"02:06:35";
        KM42.text= @"04:13:10";
    }
    else  if (distance >=2.000 && distance <=2.050) {
        pace.text = @"5:51";
        KM05.text= @"00:29:15";
        KM10.text= @"00:58:30";
        KM21.text= @"02:03:25";
        KM42.text= @"04:06:50";
    }
    else  if (distance >=2.050 && distance <=2.100) {
        pace.text = @"5:43";
        KM05.text= @"00:28:30";
        KM10.text= @"00:57:10";
        KM21.text= @"02:00:28";
        KM42.text= @"04:01:12";
    }
    else  if (distance >=2.100 && distance <=2.150) {
        pace.text = @"5:35";
        KM05.text= @"00:27:55";
        KM10.text= @"00:55:50";
        KM21.text= @"01:57:40";
        KM42.text= @"03:55:50";
    }
    else  if (distance >=2.150 && distance <=2.200) {
        pace.text = @"5:27";
        KM05.text= @"00:27:15";
        KM10.text= @"00:54:30";
        KM21.text= @"01:54:58";
        KM42.text= @"03:49:57";
    }
    else  if (distance >=2.200 && distance <=2.250) {
        pace.text = @"5:20";
        KM05.text= @"00:26:40";
        KM10.text= @"00:53:20";
        KM21.text= @"01:52:31";
        KM42.text= @"03:45:02";
    }
    else  if (distance >=2.250 && distance <=2.300) {
        pace.text = @"5:13";
        KM05.text= @"00:26:05";
        KM10.text= @"00:52:10";
        KM21.text= @"01:50:03";
        KM42.text= @"03:40:07";
    }
    else  if (distance >=2.300 && distance <=2.350) {
        pace.text = @"5:06";
        KM05.text= @"00:25:30";
        KM10.text= @"00:51:00";
        KM21.text= @"01:47:35";
        KM42.text= @"03:35:11";
    }
    else  if (distance >=2.350 && distance <=2.400) {
        pace.text = @"5:00";
        KM05.text= @"00:25:00";
        KM10.text= @"00:50:00";
        KM21.text= @"01:45:29";
        KM42.text= @"03:30:58";
    }
    else  if (distance >=2.400 && distance <=2.450) {
        pace.text = @"4:54";
        KM05.text= @"00:24:30";
        KM10.text= @"00:49:00";
        KM21.text= @"01:43:22";
        KM42.text= @"03:26:45";
    }
    else  if (distance >=2.450 && distance <=2.500) {
        pace.text = @"4:48";
        KM05.text= @"00:24:00";
        KM10.text= @"00:48:00";
        KM21.text= @"01:41:16";
        KM42.text= @"03:22:32";
    }
    else  if (distance >=2.500 && distance <=2.550) {
        pace.text = @"4:42";
        KM05.text= @"00:23:30";
        KM10.text= @"00:47:00";
        KM21.text= @"01:39:09";
        KM42.text= @"03:18:18";
    }
    else  if (distance >=2.550 && distance <=2.600) {
        pace.text = @"4:37";
        KM05.text= @"00:23:05";
        KM10.text= @"00:46:10";
        KM21.text= @"01:37:24";
        KM42.text= @"03:14:48";
    }
    else  if (distance >=2.600 && distance <=2.650) {
        pace.text = @"4:32";
        KM05.text= @"00:22:40";
        KM10.text= @"00:45:20";
        KM21.text= @"01:35:38";
        KM42.text= @"03:11:17";
    }
    else  if (distance >=2.650 && distance <=2.700) {
        pace.text = @"4:27";
        KM05.text= @"00:22:15";
        KM10.text= @"00:44:30";
        KM21.text= @"01:33:53";
        KM42.text= @"03:07:46";
    }
    else  if (distance >=2.700 && distance <=2750) {
        pace.text = @"4:22";
        KM05.text= @"00:21:50";
        KM10.text= @"00:43:40";
        KM21.text= @"01:32:07";
        KM42.text= @"03:04:15";
    }
    else  if (distance >=2.750 && distance <=2.800) {
        pace.text = @"4:17";
        KM05.text= @"00:21:25";
        KM10.text= @"00:42:50";
        KM21.text= @"01:30:22";
        KM42.text= @"03:00:44";
    }
    else  if (distance >=2.800 && distance <=2.850) {
        pace.text = @"4:13";
        KM05.text= @"00:21:05";
        KM10.text= @"00:42:10";
        KM21.text= @"01:28:57";
        KM42.text= @"02:57:55";
    }
    else  if (distance >=2.850 && distance <=2.900) {
        pace.text = @"4:08";
        KM05.text= @"00:20:40";
        KM10.text= @"00:41:21";
        KM21.text= @"01:27:12";
        KM42.text= @"02:54:24";
    }else  if (distance >=2.900 && distance <=2.950) {
        pace.text = @"4:04";
        KM05.text= @"00:20:20";
        KM10.text= @"00:40:40";
        KM21.text= @"01:25:47";
        KM42.text= @"02:51:35";
    }
    else  if (distance >=2.950 && distance <=3.000) {
        pace.text = @"4:00";
        KM05.text= @"00:20:00";
        KM10.text= @"00:40:00";
        KM21.text= @"01:24:33";
        KM42.text= @"02:48:46";

    }
    else  if (distance >=3.000 && distance <=3.050) {
        pace.text = @"3:56";
        KM05.text= @"00:19:40";
        KM10.text= @"00:39:20";
        KM21.text= @"01:22:59";
        KM42.text= @"02:45:58";
    }
    else  if (distance >=3.050 && distance <=3.100) {
        pace.text = @"3:52";
        KM05.text= @"00:19:20";
        KM10.text= @"00:38:40";
        KM21.text= @"01:21:34";
        KM42.text= @"02:43:09";
    }
    else  if (distance >=3.100 && distance <=3.150) {
        pace.text = @"3:49";
        KM05.text= @"00:19:05";
        KM10.text= @"00:38:10";
        KM21.text= @"01:20:31";
        KM42.text= @"02:41:02";
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        ViewCal.alpha=1;
    } completion:^(BOOL finished) {
        
    }];

}

-(void)updatestuff:(NSTimer*)timerCalled
{
    NSLog(@"Tick...");
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Beep" ofType:@"mp3"];
    NSURL* file = [NSURL fileURLWithPath:path];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
    [audioPlayer prepareToPlay];
    
    [audioPlayer play];
    NSLog(@"PLAY");
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
      _ButtonCall.alpha=1;
        Line.alpha=1;
        Mst.alpha=1;
        DistaTex.alpha=1;
        Age.alpha=1;
        lastTex.alpha=1;
        intro.alpha=0;
       
        
    } completion:^(BOOL finished) {
        
    }];
    
    [stopTimer invalidate];
    stopTimer = nil;
}
- (IBAction)Closedviewd:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        ViewCal.alpha=0;
    } completion:^(BOOL finished) {
        
    }];
    
    Age.text=@"";
   

    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
        [self.navigationController popViewControllerAnimated:YES];
    });
}
- (IBAction)Skip:(id)sender {
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    BMI.text = [defaults objectForKey:@"BMI"];
    
    if (BMI.text.length ==0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You need your BMI!" message:@"To perform the VO2 max test it is necessary to know your BMI. Please return to the main menu and select BMI/BMR Fill in all the fields and press calculate. Then you can do the VO2max test" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else {
    
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _ButtonCall.alpha=1;
        Line.alpha=1;
        Mst.alpha=1;
        DistaTex.alpha=1;
        Age.alpha=1;
        lastTex.alpha=1;
        intro.alpha=0;
        Satrt.alpha=0;
        starting.alpha=0;
        _skip.alpha=0;
        
        lbl.text = @"00:12:00";
        
    } completion:^(BOOL finished) {
        
    }];
    
    [stopTimer invalidate];
    stopTimer = nil;
    }
}
@end
