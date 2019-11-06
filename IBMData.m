//
//  IBMData.m
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "IBMData.h"
#import "Person.h"
@interface IBMData ()
@property (strong, nonatomic) IBOutlet UIView *Calcul;
@property (strong, nonatomic) IBOutlet UILabel *LabelResult;
@property (strong, nonatomic) IBOutlet UILabel *lenguage;

@end

@implementation IBMData
@synthesize Calcul;
@synthesize ageLabel;
@synthesize weightLabel;
@synthesize heightLabel;
@synthesize LabelResult;
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
static bool genderValue = YES;
static bool unitValue = YES;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _lenguage.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"Idioma"];
    
    
    if ([_lenguage.text isEqualToString:@"Spanol"]) {
        
        UIColor *colorDistance = [UIColor whiteColor];
        weightLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Peso:"
                                                                          attributes:@{NSForegroundColorAttributeName:colorDistance}];
        
        UIColor *colorHeight = [UIColor whiteColor];
        heightLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Altura:"
                                                                          attributes:@{NSForegroundColorAttributeName:colorHeight}];
        
        UIColor *colorageLabel = [UIColor whiteColor];
        ageLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Edad:"
                                                                       attributes:@{NSForegroundColorAttributeName:colorageLabel}];
     
    }
    else if ([_lenguage.text isEqualToString:@"Ingles"]) {
        
        UIColor *colorDistance = [UIColor whiteColor];
        weightLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Weight:"
                                                                          attributes:@{NSForegroundColorAttributeName:colorDistance}];
        
        UIColor *colorHeight = [UIColor whiteColor];
        heightLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Height:"
                                                                          attributes:@{NSForegroundColorAttributeName:colorHeight}];
        
        UIColor *colorageLabel = [UIColor whiteColor];
        ageLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Age:"
                                                                       attributes:@{NSForegroundColorAttributeName:colorageLabel}];
   
    }
    else if ([_lenguage.text isEqualToString:@"Polaco"]) {
        UIColor *colorDistance = [UIColor whiteColor];
        weightLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Waga:"
                                                                          attributes:@{NSForegroundColorAttributeName:colorDistance}];
        
        UIColor *colorHeight = [UIColor whiteColor];
        heightLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Wysokości:"
                                                                          attributes:@{NSForegroundColorAttributeName:colorHeight}];
        
        UIColor *colorageLabel = [UIColor whiteColor];
        ageLabel.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Wiek:"
                                                                       attributes:@{NSForegroundColorAttributeName:colorageLabel}];
     
    }
    

    

 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unitButton:(id)sender {
    unitValue = !unitValue;
    if (unitValue == NO) {
        self.weightUnitLabel.text = @"lb";
        self.heightUnitLabel.text = @"in";
    }
    else {
        self.weightUnitLabel.text = @"kg";
        self.heightUnitLabel.text = @"m";
    }
}

- (IBAction)genderButton:(id)sender {
    genderValue = !genderValue;
    NSLog(@"%d", genderValue);
}

- (IBAction)calculateButton:(id)sender {
    
    if (ageLabel.text.length ==0 || weightLabel.text.length ==0||heightLabel.text.length ==0 ) {
        NSLog(@"Falta imfomacion");
      
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Data required!" message:@"Please fill all fields!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else{
    
        NSString *str = heightLabel.text;
        str = [str stringByReplacingOccurrencesOfString:@"," withString:@"."];
        heightLabel.text = str;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        Calcul.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
        

        NSUserDefaults *seting =[NSUserDefaults standardUserDefaults];
        NSString* firstData = _bmiLabel.text;
        [seting setObject:firstData forKey:@"BMI"];
        [seting synchronize];

        
    [self.weightLabel resignFirstResponder];
    [self.heightLabel resignFirstResponder];
    [self.ageLabel resignFirstResponder];
    
    Person *p = [Person sharedPersonInstance];
    NSLog(@"%@", [p description]);
    
    
    
    p.weightInKG = @(self.weightLabel.text.doubleValue);
    p.heightINM = @(self.heightLabel.text.doubleValue);
    p.ageInYear = @(self.ageLabel.text.doubleValue);
    p.sex = @(genderValue);
    
    if (unitValue == NO) [p unitTrans];
    //p.weightInKg = [NSNumber numberWithFloat: self.weightLabel.text.doubleValue];
    //4.285; 0.04572
    if (p.heightINM.doubleValue != 0) {
        //NSLog(@"%@	%@", p.weightInKG, p.heightINM);
        self.bmiLabel.text = [NSString stringWithFormat:@"%0.2f",([p bmi]).doubleValue];
        double t = ([p bmi]).doubleValue;
        NSBundle* myBundle = [NSBundle mainBundle];
        NSString* path;
        if (t < 16)
            self.resultLabel.text = @"Severe Thinness";
        else if (t < 17)
            self.resultLabel.text = @"Moderate Thinness";
        else if (t < 18.5)
            self.resultLabel.text = @"Mild Thinness";
        else if (t < 25)
            self.resultLabel.text = @"Normal Range";
        else if (t < 30)
            self.resultLabel.text = @"Overweight";
        else if (t < 35)
            self.resultLabel.text = @"Obese(Moderate)";
        else if (t < 40)
            self.resultLabel.text = @"Obese(Severe)";
        else
            self.resultLabel.text = @"Obese(Very Severe)";
        
        if (p.sex.boolValue == YES)
            path = [myBundle pathForResource:@"photo" ofType:@"jpg"];
        else
            path = [myBundle pathForResource:@"photo" ofType:@"jpg"];
        
        UIImage* newImage = [UIImage imageWithContentsOfFile:path];
        
        if (t < 18.5) {
            self.picture_thin.image = newImage;
            self.picture_normal.image = nil;
            self.picture_overwgt.image = nil;
            self.picture.image = nil;
        }
        else if (t < 25) {
            self.picture_thin.image = nil;
            self.picture_normal.image = newImage;
            self.picture_overwgt.image = nil;
            self.picture.image = nil;
        }
        else if (t < 30){
            self.picture_thin.image = nil;
            self.picture_normal.image = nil;
            self.picture_overwgt.image = newImage;
            self.picture.image = nil;
        }
        else{
            self.picture_thin.image = nil;
            self.picture_normal.image = nil;
            self.picture_overwgt.image = nil;
            self.picture.image = newImage;
        }
        
        
        //self.bmiLabel.text = bmi.stringValue;
        
        self.bmrLabel.text = [NSString stringWithFormat:@"%0.2f", ([p bmr].doubleValue)];
        self.dietPlanLabel.text = [p dietPlanDescription];
    }
    else {
        self.bmiLabel.text = @"Please enter a valid number";
        
    }
    }
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.weightLabel resignFirstResponder];
    [self.heightLabel resignFirstResponder];
    [self.ageLabel resignFirstResponder];
}
- (IBAction)close:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        Calcul.alpha=0;
    } completion:^(BOOL finished) {
        
    }];
    
   ageLabel.text=@"";
   weightLabel.text=@"";
     heightLabel.text=@"";
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
        [self.navigationController popViewControllerAnimated:YES];
    });
    
  
    
    
}
- (IBAction)back:(id)sender {
[self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
[self.navigationController popViewControllerAnimated:YES];

}




@end
