//
//  Water Calculator.m
//  My VOmax
//
//  Created by Erinson Villarroel on 13/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "Water Calculator.h"

@interface Water_Calculator ()
@property (strong, nonatomic) IBOutlet UITextField *genderTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *heightTextField;
@property (strong, nonatomic) IBOutlet UITextField *pregnancyTextField;
@property (strong, nonatomic) IBOutlet UITextField *lactationTextField;
@property (strong, nonatomic) IBOutlet UITextField *lifeStyleTextField;
@property (strong, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UISwitch *pregnancy;
@property (weak, nonatomic) IBOutlet UISwitch *lactation;
@property (strong, nonatomic) IBOutlet UILabel *Pre;
@property (strong, nonatomic) IBOutlet UILabel *Lac;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gardenB;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *ButtonControl;
@property (strong, nonatomic) IBOutlet UILabel *Litres;
@property (strong, nonatomic) IBOutlet UIView *Viewcalculate;

@property (strong, nonatomic) IBOutlet UITextField *LiD001;
@property (strong, nonatomic) IBOutlet UITextField *LiD002;
@property (strong, nonatomic) IBOutlet UITextField *LiD003;

@property (strong, nonatomic) IBOutlet UITextField *Polac;


@property (strong, nonatomic) IBOutlet UILabel *Cal001;
@property (strong, nonatomic) IBOutlet UILabel *Cal002;
@property (strong, nonatomic) IBOutlet UILabel *Cal003;
@property (strong, nonatomic) IBOutlet UILabel *CalculationTotalBotle;
@property (strong, nonatomic) IBOutlet UILabel *lenguage;

@end

@implementation Water_Calculator
@synthesize genderTextField;
@synthesize ageTextField;
@synthesize heightTextField;
@synthesize pregnancyTextField;
@synthesize lactationTextField;
@synthesize lifeStyleTextField;
@synthesize weightTextField;
@synthesize ButtonControl;

int bodyHeight; // WZROST
int bodyWeight; // WAGA
NSString *lifeStyle; // TRYB ŻYCIA
NSString *gender; // PŁEĆ
int age; // WIEK
NSString *nameOfLand; // TA ZMIENNA U NAS BĘDZIE STAŁA, WARTOŚĆ TO Polska A LICZBA JEJ ODPOWIADAJĄCA TO 780
int pregnancy = 0; // CIĄŻA
int breastfeeding = 0; // LAKTACJA

double BodySurface; // POWIERZCHNIA CIAŁA
double CaloryExpendidure = 0; // WYDATEK KALORYCZNY
int LosseUrine = 1500; // UTRATA WODY PRZEZ MOCZ
int LosseFaeces = 200; // UTRATA WODY PRZEZ KUPĘ
double LossesSkin; // UTRATA WODY PRZEZ SKÓRĘ
double LossesRespiratory; // UTRATA WODY PRZEZ ODDECH
double Sweat; // UTRATA WODY PRZEZ POCENIE SIĘ
double GainMetabolicWater; // POZYSKANIE WODY W PROCESACH METABOLICZNYCH
int WaterFromFood; // WODA Z JEDZENIA
int OtherConditions; // TO JEST ZMIENNA DO CIĄŻY I LAKTACJI
int lifestyleNumber;
double result = 0;

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    _lenguage.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"Idioma"];
    
    
    if ([_lenguage.text isEqualToString:@"Spanol"]) {
        
        UIColor *Weight = [UIColor whiteColor];
        weightTextField.attributedPlaceholder =[[NSAttributedString
                                                 alloc]initWithString:@"Peso:"
                                                attributes:@{NSForegroundColorAttributeName:Weight}];
        
        UIColor *Age = [UIColor whiteColor];
        ageTextField.attributedPlaceholder =[[NSAttributedString
                                              alloc]initWithString:@"Edad:"
                                             attributes:@{NSForegroundColorAttributeName:Age}];
        
        UIColor *Height = [UIColor whiteColor];
        heightTextField.attributedPlaceholder =[[NSAttributedString
                                                 alloc]initWithString:@"Altura:"
                                                attributes:@{NSForegroundColorAttributeName:Height}];
        
        
        UIColor *lifeStyle = [UIColor whiteColor];
        lifeStyleTextField.attributedPlaceholder =[[NSAttributedString
                                                    alloc]initWithString:@"Estilo de Vida:"
                                                   attributes:@{NSForegroundColorAttributeName:lifeStyle}];
        
        
    }
    else if ([_lenguage.text isEqualToString:@"Ingles"]) {
        
        UIColor *Weight = [UIColor whiteColor];
        weightTextField.attributedPlaceholder =[[NSAttributedString
                                                 alloc]initWithString:@"Weight:"
                                                attributes:@{NSForegroundColorAttributeName:Weight}];
        
        UIColor *Age = [UIColor whiteColor];
        ageTextField.attributedPlaceholder =[[NSAttributedString
                                              alloc]initWithString:@"Age:"
                                             attributes:@{NSForegroundColorAttributeName:Age}];
        
        UIColor *Height = [UIColor whiteColor];
        heightTextField.attributedPlaceholder =[[NSAttributedString
                                                 alloc]initWithString:@"Height:"
                                                attributes:@{NSForegroundColorAttributeName:Height}];
        
        
        UIColor *lifeStyle = [UIColor whiteColor];
        lifeStyleTextField.attributedPlaceholder =[[NSAttributedString
                                                    alloc]initWithString:@"lifeStyle:"
                                                   attributes:@{NSForegroundColorAttributeName:lifeStyle}];
        
        
    }
    else if ([_lenguage.text isEqualToString:@"Polaco"]) {
        UIColor *Weight = [UIColor whiteColor];
        weightTextField.attributedPlaceholder =[[NSAttributedString
                                                 alloc]initWithString:@"Weight:"
                                                attributes:@{NSForegroundColorAttributeName:Weight}];
        
        UIColor *Age = [UIColor whiteColor];
        ageTextField.attributedPlaceholder =[[NSAttributedString
                                              alloc]initWithString:@"Age:"
                                             attributes:@{NSForegroundColorAttributeName:Age}];
        
        UIColor *Height = [UIColor whiteColor];
        heightTextField.attributedPlaceholder =[[NSAttributedString
                                                 alloc]initWithString:@"Height:"
                                                attributes:@{NSForegroundColorAttributeName:Height}];
        
        
        UIColor *lifeStyle = [UIColor whiteColor];
        lifeStyleTextField.attributedPlaceholder =[[NSAttributedString
                                                    alloc]initWithString:@"lifeStyle:"
                                                   attributes:@{NSForegroundColorAttributeName:lifeStyle}];
        
        
    }
    
    
    
    
//    [ageTextField.layer setCornerRadius:5.0f];
//    [ageTextField.layer setCornerRadius:5.0f];
//    [ageTextField.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [ageTextField.layer setBorderWidth:1.5f];
//    [self.ageTextField setValue:[UIColor grayColor]forKeyPath:@"_placeholderLabel.textColor"];
//    
//    [genderTextField.layer setCornerRadius:5.0f];
//    [genderTextField.layer setCornerRadius:5.0f];
//    [genderTextField.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [genderTextField.layer setBorderWidth:1.5f];
//    [self.genderTextField setValue:[UIColor grayColor]forKeyPath:@"_placeholderLabel.textColor"];
//    
//    [heightTextField.layer setCornerRadius:5.0f];
//    [heightTextField.layer setCornerRadius:5.0f];
//    [heightTextField.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [heightTextField.layer setBorderWidth:1.5f];
//    [self.heightTextField setValue:[UIColor grayColor]forKeyPath:@"_placeholderLabel.textColor"];
//    
//    [weightTextField.layer setCornerRadius:5.0f];
//    [weightTextField.layer setCornerRadius:5.0f];
//    [weightTextField.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [weightTextField.layer setBorderWidth:1.5f];
//    [self.weightTextField setValue:[UIColor grayColor]forKeyPath:@"_placeholderLabel.textColor"];
//    
//    [lifeStyleTextField.layer setCornerRadius:5.0f];
//    [lifeStyleTextField.layer setCornerRadius:5.0f];
//    [lifeStyleTextField.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [lifeStyleTextField.layer setBorderWidth:1.5f];
//    [self.lifeStyleTextField setValue:[UIColor grayColor]forKeyPath:@"_placeholderLabel.textColor"];
    
    
    
    
    genderTextField.delegate = self;
    ageTextField.delegate = self;
    heightTextField.delegate = self;
    weightTextField.delegate = self;
    pregnancyTextField .delegate = self;
    lactationTextField .delegate = self;
    lifeStyleTextField.delegate =self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.genderTextField resignFirstResponder];
    [self.ageTextField resignFirstResponder];
    [self.heightTextField resignFirstResponder];
    [self.weightTextField resignFirstResponder];
    [self.pregnancyTextField resignFirstResponder];
    [self.lactationTextField resignFirstResponder];
    [self.lifeStyleTextField resignFirstResponder];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)Lactation:(id)sender {
    if ([self.lactation isOn]) {
        self.lactationTextField.text = @"Yes";
        NSLog(@"Switch is on + Yes");
        
    } else {
        self.lactationTextField.text = @"No";
        NSLog(@"Switch is off + No");    }

}


- (IBAction)Pregnancy:(id)sender {
    
    if ([self.pregnancy isOn]) {
        self.pregnancyTextField.text = @"Yes";
        NSLog(@"Switch is on + Yes");
        
    } else {
        self.pregnancyTextField.text = @"No";
        NSLog(@"Switch is off + No");    }
}

- (IBAction)back:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)segmentSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.genderTextField.text = @"Male";
        _Pre.alpha=0;
        _Lac.alpha=0;
        _pregnancy.alpha=0;
        _lactation.alpha=0;
        pregnancyTextField.alpha=0;
        lactationTextField.alpha=0;
        pregnancyTextField.text=@"No";
        lactationTextField.text=@"No";
        
        
    }
    else{
       self.genderTextField.text = @"Female";
      
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"This parameter is only for people between 15 and 65 years old!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        _Pre.alpha=1;
        _Lac.alpha=1;
        _pregnancy.alpha=1;
        _lactation.alpha=1;
        pregnancyTextField.alpha=1;
        lactationTextField.alpha=1;
        
        
    }
}

- (IBAction)sitting:(id)sender {
    lifeStyleTextField.text=@"Sitting";
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         ButtonControl.frame = CGRectMake(78, 385, 179, 0);
                         
                     }
                     completion:nil];

    
}

- (IBAction)smallActive:(id)sender {
     lifeStyleTextField.text=@"Small active";
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         ButtonControl.frame = CGRectMake(78, 385, 179, 0);
                         
                     }
                     completion:nil];
}

- (IBAction)mediumActive:(id)sender {
     lifeStyleTextField.text=@"Medium active";
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         ButtonControl.frame = CGRectMake(78, 385, 179, 0);
                         
                     }
                     completion:nil];
}


- (IBAction)veryActive:(id)sender {
     lifeStyleTextField.text=@"Very active";
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         ButtonControl.frame = CGRectMake(78, 385, 179, 0);
                         
                     }
                     completion:nil];
}

- (IBAction)SelectorLifeStile:(id)sender {
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         ButtonControl.frame = CGRectMake(78, 385, 179, 129);
                         
                     }
                     completion:nil];
}


- (IBAction)Calculate:(id)sender {
     if (genderTextField.text.length <=0 )
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Provide gender." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (genderTextField.text.length <=0 )
    {
      
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Provide age." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (heightTextField.text.length <=0 )
    {
        
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Provide Heigh." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (weightTextField.text.length <=0 )
    {
       
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Provide Weight." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else {
        bodyHeight = heightTextField.text.intValue;
        bodyWeight = weightTextField.text.intValue;
        lifeStyle = lifeStyleTextField.text;
        gender = genderTextField.text;
        age = ageTextField.text.intValue;
        nameOfLand = @"Polska";
        
        BodySurface = 0.007184 * pow(bodyHeight, 0.725) * pow(bodyWeight, 0.425);
        
        if ([lifeStyleTextField.text isEqualToString:@"Small active"]) {
            lifestyleNumber = 0;
        }else if ([lifeStyleTextField.text isEqualToString:@"Medium active"]) {
            lifestyleNumber = 1;
        }else if ([lifeStyleTextField.text isEqualToString:@"Medium active"]) {
            lifestyleNumber = 2;
        }else if ([lifeStyleTextField.text isEqualToString:@"Very active"]) {
            lifestyleNumber = 3;
        }
        
        switch (lifestyleNumber) {
            case 0: // SIEDZĄCY
                if ([genderTextField.text isEqualToString:@"Male"]) { // MĘŻCZYZNA
                    if (age < 30) {
                        CaloryExpendidure = 1.4 * (15.3 * bodyWeight + 679);
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.4 * (11.6 * bodyWeight + 879);
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.4 * (13.6 * bodyWeight + 487);
                    }
                }
                if ([genderTextField.text isEqualToString:@"Female"]) { // KOBIETA
                    if (age < 30) {
                        CaloryExpendidure = 1.4 * (14.7 * bodyWeight + 496);
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.4 * (8.7 * bodyWeight + 829);
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.4 * (10.5 * bodyWeight + 596);
                    }
                }
                break;
            case 1: // MAŁO AKTYWNY
                if ([genderTextField.text isEqualToString:@"Male"]) { // MĘŻCZYZNA
                    if (age < 30) {
                        CaloryExpendidure = 1.4 * (15.3 * bodyWeight + 679);
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.4 * (11.6 * bodyWeight + 879);
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.4 * (13.6 * bodyWeight + 487);
                    }
                }
                if ([genderTextField.text isEqualToString:@"Female"]) { //KOBIETA
                    if (age < 30) {
                        CaloryExpendidure = 1.4 * (14.7 * bodyWeight + 496);
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.4 * (8.7 * bodyWeight + 829);
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.4 * (10.5 * bodyWeight + 596);
                    }
                }
                break;
            case 2: // ŚREDNIO AKTYWNY
                if ([genderTextField.text isEqualToString:@"Male"]) { // MĘŻCZYZNA
                    if (age < 30) {
                        CaloryExpendidure = 1.55 * (1.4 * (15.3 * bodyWeight + 679));
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.55 * (1.4 * (11.6 * bodyWeight + 879));
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.55 * (1.4 * (13.6 * bodyWeight + 487));
                    }
                }
                if ([genderTextField.text isEqualToString:@"Female"]) { // KOBIETA
                    if (age < 30) {
                        CaloryExpendidure = 1.56 * (1.4 * (14.7 * bodyWeight + 496));
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.56 * (1.4 * (8.7 * bodyWeight + 829));
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.56 * (1.4 * (10.5 * bodyWeight + 596));
                    }
                }
                break;
            case 3: // BARDZO AKTYWNY
                if ([genderTextField.text isEqualToString:@"Male"]) { // MĘŻCZYZNA
                    if (age < 30) {
                        CaloryExpendidure = 1.78 * (1.4 * (15.3 * bodyWeight + 679));
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.78 * (1.4 * (11.6 * bodyWeight + 879));
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.78 * (1.4 * (13.6 * bodyWeight + 487));
                    }
                }
                if ([genderTextField.text isEqualToString:@"Female"]) { // KOBIETA
                    if (age < 30) {
                        CaloryExpendidure = 1.64 * (1.4 * (14.7 * bodyWeight + 496));
                    }
                    if (age >= 30 && age < 60) {
                        CaloryExpendidure = 1.64 * (1.4 * (8.7 * bodyWeight + 829));
                    }
                    if (age >= 60) {
                        CaloryExpendidure = 1.64 * (1.4 * (10.5 * bodyWeight + 596));
                    }
                }
                break;
        }
        
        LossesSkin = BodySurface * 7 * 24;
        LossesRespiratory = (0.107 * CaloryExpendidure) + 92.2;
        
        switch (lifestyleNumber) {
            case 0: // SIEDZĄCY
                Sweat = 500 + (2 * bodyWeight * 3.5 * (5 / 1000.0) * 60 * 0.5);
                break;
            case 1: // MAŁO AKTYWNY
                Sweat = 500 + ((2 * bodyWeight * 3.5) * (5 / 1000.0) * (60 * 0.5)) + ((11 * bodyWeight * 3.5) * (5 / 1000.0) * (60 * 0.5));
                break;
            case 2: // ŚREDNIO AKTYWNY
                Sweat = 500 + ((2 * bodyWeight * 3.5) * (5 / 1000.0) * (60 * 0.5)) + ((11 * bodyWeight * 3.5) * (5 / 1000.0) * (60 * 1));
                break;
            case 3: // BARDZO AKTYWNY
                Sweat = 500 + ((2 * bodyWeight * 3.5) * (5 / 1000.0) * (60 * 0.5)) + ((11 * bodyWeight * 3.5 * (5 / 1000.0) * 60 * 2));
                break;
        }
        
        GainMetabolicWater = (0.119 * CaloryExpendidure) - 2.25;
        
        WaterFromFood = 780;
        
        if ([pregnancyTextField.text isEqualToString:@"Yes"]) {
            pregnancy = 300;
        }else if ([pregnancyTextField.text isEqualToString:@"No"]) {
            pregnancy = 0;
        }
        
        if ([lactationTextField.text isEqualToString:@"Yes"]) {
            breastfeeding = 700;
        }else if ([lactationTextField.text isEqualToString:@"No"]) {
            breastfeeding = 0;
        }
        
        result = (LosseUrine + LosseFaeces + LossesSkin + LossesRespiratory + Sweat - GainMetabolicWater - WaterFromFood + pregnancy + breastfeeding)/1000;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setMaximumFractionDigits:1];
        [formatter setRoundingMode: NSNumberFormatterRoundUp];
        
        NSString* myResult = [formatter stringFromNumber:[NSNumber numberWithFloat:result]];
        
        
        //_resultLabel.text = myResult;
        NSLog(@"MY RESULT FOR CALCULATOR IS:%@",myResult);
        _Litres.text= [NSString stringWithFormat:@"%@.Litres",myResult];
        
        
    
            double days3 = [_LiD001.text doubleValue];
            double days5 = [_LiD002.text doubleValue];
            double days10 = [_LiD003.text doubleValue];
        
            double totalLitrosToDouble = [myResult doubleValue];
     
            double litres3 = totalLitrosToDouble * days3;
            double litres5 = totalLitrosToDouble * days5;
            double litres10 = totalLitrosToDouble * days10;
            
            NSNumberFormatter *formatter1 = [[NSNumberFormatter alloc] init];
            [formatter1 setNumberStyle:NSNumberFormatterDecimalStyle];
            [formatter1 setMaximumFractionDigits:1];
            [formatter1 setRoundingMode: NSNumberFormatterRoundDown];
        
        
            NSString* litresOfWaterShortDouble = [formatter stringFromNumber:[NSNumber numberWithDouble:litres3]];
            NSString* litresOfWaterShortDouble1 = [formatter stringFromNumber:[NSNumber numberWithDouble:litres5]];
            NSString* litresOfWaterShortDouble2 = [formatter stringFromNumber:[NSNumber numberWithDouble:litres10]];
        
            NSString * litresOfWaterComaForDot = [litresOfWaterShortDouble stringByReplacingOccurrencesOfString:@"," withString:@"."];
            NSString * litresOfWaterComaForDot2 = [litresOfWaterShortDouble1 stringByReplacingOccurrencesOfString:@"," withString:@"."];
            NSString * litresOfWaterComaForDot3 = [litresOfWaterShortDouble2 stringByReplacingOccurrencesOfString:@"," withString:@"."];
        
        
           _Cal001.text = [NSString stringWithFormat:@"%@.Litres",litresOfWaterComaForDot];
           _Cal002.text = [NSString stringWithFormat:@"%@.Litres",litresOfWaterComaForDot2];
           _Cal003.text = [NSString stringWithFormat:@"%@.Litres",litresOfWaterComaForDot3];
            
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _Viewcalculate.alpha=1;
        } completion:^(BOOL finished) {
            
        }];

 

    }
    
}

- (IBAction)closedViewCalculate:(id)sender {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _Viewcalculate.alpha=0;
    } completion:^(BOOL finished) {
        
    }];
    genderTextField.text=@"";
    ageTextField.text=@"";
    heightTextField.text=@"";
    pregnancyTextField.text=@"";
    lactationTextField.text=@"";
    lifeStyleTextField.text=@"";
    weightTextField.text=@"";
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
        [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
