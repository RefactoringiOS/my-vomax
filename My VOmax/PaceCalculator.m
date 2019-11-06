//
//  PaceCalculator.m
//  My VOmax
//
//  Created by Erinson Villarroel on 14/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "PaceCalculator.h"

@interface PaceCalculator ()



@property (strong, nonatomic) IBOutlet UILabel *Pace;
@property (strong, nonatomic) IBOutlet UILabel *Time;
@property (strong, nonatomic) IBOutlet UITextField *DustanceTextFiedl;

@property (strong, nonatomic) IBOutlet UIPickerView *DistancePiker;
@property(retain, nonatomic) NSArray *HorPickerArray;
@property(retain, nonatomic) NSArray *MinPickerArray;
@property(retain, nonatomic) NSArray *SecPickerArray;
@property (strong, nonatomic) IBOutlet UIPickerView *TimerPiker;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *TimeView;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *ViewDistancePiker;
@property (strong, nonatomic) IBOutlet UILabel *km;
@property (strong, nonatomic) IBOutlet UITextField *Segundos;

@property (strong, nonatomic) IBOutlet UITextField *Hora;
@property (strong, nonatomic) IBOutlet UITextField *Minitu;

@property (strong, nonatomic) IBOutlet UITextField *paceField;
@property (strong, nonatomic) IBOutlet UITextField *timeField;
@property (strong, nonatomic) IBOutlet UITextField *distanceField;


@property (strong, nonatomic) IBOutlet UILabel *minTextField;
@property (strong, nonatomic) IBOutlet UILabel *secTextField;
@property (strong, nonatomic) IBOutlet UILabel *distTextField;
@property (strong, nonatomic) IBOutlet UILabel *paceLabel;

-(void) testStringToSeconds;
-(void) testSecondsToString;
- (NSString *)timeFormatted:(int) totalSeconds;

-(NSString *) convertSecondsToString:(int) seconds;
-(NSInteger) convertStringToTime:(NSString *) timeAsTextField;

-(NSInteger) convertStringToTimeNoHours:(NSString *) timeAsTextField;
-(NSInteger) convertStringToTimeNoHoursMinutes:(NSString *) timeAsTextField;

-(void) calculateDistance;
-(void) calculateTotalTime;
-(void) calculatePace;
@property (strong, nonatomic) IBOutlet UILabel *lenguage;

@end

@implementation PaceCalculator

@synthesize paceField;
@synthesize timeField;
@synthesize distanceField;
@synthesize paceLabel;


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


static bool const isMetric = YES;
static float const metersInKM = 1000;
static float const metersInMile = 1609.344;
double Hora = 60;
double Minitos = 60;
double Segundos = 60;

double Distancia = 5000;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _lenguage.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"Idioma"];
    
    
    if ([_lenguage.text isEqualToString:@"Spanol"]) {
        
        UIColor *colorTime = [UIColor whiteColor];
        timeField.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Tiempo:"
                                                                        attributes:@{NSForegroundColorAttributeName:colorTime}];
        
        UIColor *colorDistance = [UIColor whiteColor];
        _DustanceTextFiedl.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Distancia:"
                                                                                 attributes:@{NSForegroundColorAttributeName:colorDistance}];
        
    }
    else if ([_lenguage.text isEqualToString:@"Ingles"]) {
        
        UIColor *colorTime = [UIColor whiteColor];
        timeField.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Time:"
                                                                        attributes:@{NSForegroundColorAttributeName:colorTime}];
        
        UIColor *colorDistance = [UIColor whiteColor];
        _DustanceTextFiedl.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Distance:"
                                                                                 attributes:@{NSForegroundColorAttributeName:colorDistance}];
        
    }
    else if ([_lenguage.text isEqualToString:@"Polaco"]) {
        UIColor *colorTime = [UIColor whiteColor];
        timeField.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Czas:"
                                                                        attributes:@{NSForegroundColorAttributeName:colorTime}];
        
        UIColor *colorDistance = [UIColor whiteColor];
        _DustanceTextFiedl.attributedPlaceholder =[[NSAttributedString alloc]initWithString:@"Dystans:"
                                                                                 attributes:@{NSForegroundColorAttributeName:colorDistance}];
        
    }
    

    

    
    self.timeField.delegate = self;
    self.DustanceTextFiedl.delegate = self;
    self.Segundos.delegate = self;
    
//    [self testSecondsToString];
//    [self testStringToSeconds];
    
    _DistanceArray = @[@"", @"1Km",@"2Km",@"3Km",@"4Km",@"5Km",@"10Km",@"15Km",@"Half Marathon",@"Marathon",];
    
    _HorPickerArray = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24"];
    
    _MinPickerArray = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59"];
    
    _SecPickerArray = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59"];
    
    
    _DistancePiker = [[UIPickerView alloc]init];
    [_DistancePiker setDataSource:self];
    [_DistancePiker setDelegate:self];
    [_DistancePiker setShowsSelectionIndicator:YES];
    
    self.DustanceTextFiedl.inputView = _DistancePiker;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    if (pickerView.tag == 100){
        return 3;
    }
    else
        
        return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerView.tag == 100){
        if (component == 0) {
            return _HorPickerArray.count ;
        }
        else if (component == 1) {
            return _MinPickerArray.count ;
        }
        else if (component == 2) {
            return _SecPickerArray.count ;
        }
        
    }
    else (pickerView.tag == 200);{
        return _DistanceArray.count;
    }
    
    
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (pickerView.tag == 100){
        if (component == 0) {
            return [_HorPickerArray objectAtIndex:row];
        }
        else if (component == 1) {
            return [_MinPickerArray objectAtIndex:row];
        }
        else if (component == 2) {
            return [_SecPickerArray objectAtIndex:row];
        }
        return nil;
    }
    else (pickerView.tag == 200);{
        return [_DistanceArray objectAtIndex:row];
        
    }
    
}
-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (pickerView.tag == 100){
        
        timeField.text  =[NSString stringWithFormat: @"%@:%@:%@", [_HorPickerArray objectAtIndex:[_TimerPiker selectedRowInComponent:0]],[_MinPickerArray objectAtIndex:[_TimerPiker selectedRowInComponent:1]],[_SecPickerArray objectAtIndex:[_TimerPiker selectedRowInComponent:2]]];
       
      
        
    }else if (pickerView.tag == 200){
        [_DustanceTextFiedl setText:[_DistanceArray objectAtIndex:row]];
      
        if ( [_DustanceTextFiedl.text isEqualToString:@"1Km"]) {
            distanceField.text=@"1";
        }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"2Km"]) {
                distanceField.text=@"2";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"3Km"]) {
                distanceField.text=@"3";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"4Km"]) {
                distanceField.text=@"4";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"5Km"]) {
                distanceField.text=@"5";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"10Km"]) {
                distanceField.text=@"10";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"15Km"]) {
                distanceField.text=@"15";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"Half Marathon"]) {
                distanceField.text=@"21.1";
            }
        else
            if ( [_DustanceTextFiedl.text isEqualToString:@"Marathon"]) {
                distanceField.text=@"42.2";
                }
    }
    
}
- (IBAction)back:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)CallDistancePiker:(id)sender {
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _TimeView.frame = CGRectMake(0, 0, 320, 568);
                     }
                     completion:nil];

    
}

- (IBAction)Cancel02:(id)sender {
    
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _TimeView.frame = CGRectMake(0, 568, 320, 272);
                     }
                     completion:nil];
    
    timeField.text=@"";
  
    
}
- (IBAction)Done:(id)sender {
    
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _TimeView.frame = CGRectMake(0, 568, 320, 272);
                     }
                     completion:nil];

}
- (IBAction)Calculate:(id)sender {
    

    
    
}

- (IBAction)CallDistance:(id)sender {
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _ViewDistancePiker.frame = CGRectMake(0, 0, 320, 568);
                     }
                     completion:nil];
  

    
}
- (IBAction)doneDistance:(id)sender {
    
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _ViewDistancePiker.frame = CGRectMake(0, 568, 320, 272);
                     }
                     completion:nil];
    _km.alpha=1;
    
    
}
- (IBAction)CancelDistance:(id)sender {
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _ViewDistancePiker.frame = CGRectMake(0, 568, 320, 272);
                     }
                     completion:nil];
    
    _DustanceTextFiedl.text=@"";
    _km.alpha=0;
    
    
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)stringifyDistance:(float)meters
{
    float unitDivider;
    NSString *unitName;
    
    // metric
    if (isMetric) {
        unitName = @"km";
        // to get from meters to kilometers divide by this
        unitDivider = metersInKM;
        // U.S.
    } else {
        unitName = @"mi";
        // to get from meters to miles divide by this
        unitDivider = metersInMile;
    }
    
    return [NSString stringWithFormat:@"%.2f %@", (meters / unitDivider), unitName];
}

+ (NSString *)stringifySecondCount:(int)seconds usingLongFormat:(BOOL)longFormat
{
    int remainingSeconds = seconds;
    int hours = remainingSeconds / 3600;
    remainingSeconds = remainingSeconds - hours * 3600;
    int minutes = remainingSeconds / 60;
    remainingSeconds = remainingSeconds - minutes * 60;
    
    if (longFormat) {
        if (hours > 0) {
            return [NSString stringWithFormat:@"%ihr %imin %isec", hours, minutes, remainingSeconds];
        } else if (minutes > 0) {
            return [NSString stringWithFormat:@"%imin %isec", minutes, remainingSeconds];
        } else {
            return [NSString stringWithFormat:@"%isec", remainingSeconds];
        }
    } else {
        if (hours > 0) {
            return [NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, remainingSeconds];
        } else if (minutes > 0) {
            return [NSString stringWithFormat:@"%02i:%02i", minutes, remainingSeconds];
        } else {
            return [NSString stringWithFormat:@"00:%02i", remainingSeconds];
        }
    }
}

+ (NSString *)stringifyAvgPaceFromDist:(float)meters overTime:(int)seconds
{
    if (seconds == 0 || meters == 0) {
        return @"0";
    }
    
    float avgPaceSecMeters = seconds / meters;
    
    float unitMultiplier;
    NSString *unitName;
    
    // metric
    if (isMetric) {
        unitName = @"min/km";
        unitMultiplier = metersInKM;
        // U.S.
    } else {
        unitName = @"min/mi";
        unitMultiplier = metersInMile;
    }
    
    int paceMin = (int) ((avgPaceSecMeters * unitMultiplier) / 60);
    int paceSec = (int) (avgPaceSecMeters * unitMultiplier - (paceMin*60));
    
    return [NSString stringWithFormat:@"%i:%02i %@", paceMin, paceSec, unitName];
}
- (IBAction)sdfsd:(id)sender {
}



//paceInSeconds (minutes:Double, seconds: Double, distance: Double) -> Double
//return ((minutes*60) + seconds) / distance
//
//
//paceMinutes = paceInSeconds(((minTextField.text as NSString).doubleValue, seconds: (secTextField.text as NSString).doubleValue, distance: (distTextField.text as NSString).doubleValue)) / 60
//
//var roundedPaceMinutes = Double(floor(paceMinutes))
//var decimalPaceSeconds = paceMinutes - roundedPaceMinutes
//var intPaceMinutes = Int(floor(roundedPaceMinutes))
//var paceSeconds = Int(floor(decimalPaceSeconds * 60))
//var paceSecondsZero = String(format: "%02d", paceSeconds)
//
//paceLabel.text = "\(intPaceMinutes):\(paceSecondsZero)/km"
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)buttonPressed:(id)sender {
    
    
    
    // Uncomment these to hardcode data when development testing
    //   paceField.stringValue = @"8:01";
    //	distanceField.stringValue = @"8";
    //	timeField.stringValue = @"";
    
    //distance = [distanceField.stringValue floatValue];
    //if distance field is empty but time and pace is entered,
    
          [self testSecondsToString]; //to test the converter method
          [self testStringToSeconds]; //to test the converter method
    if ([_lenguage.text isEqualToString:@"Spanol"]) {
        
        
        if (_DustanceTextFiedl.text.length <=0 )
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Faltan Datos" message:@"Intrudusca Distancia." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else if (timeField.text.length <=0 )
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Faltan Datos" message:@"Intrudusca Tiempo." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
            
        {
            
            NSString *empty = @"";
            
            if ([distanceField.text isEqualToString:empty] && ![timeField.text isEqualToString:empty]  && ![paceField.text isEqualToString:empty]) {
                [self calculateDistance];
            } else if ([timeField.text isEqualToString:empty] && ![distanceField.text isEqualToString:empty]  && ![paceField.text isEqualToString:empty]) {
                //if time field is empty but distance and pace is entered,
                [self calculateTotalTime];
            } else {
                //by default, calculate pace (given you have values for distance and time - text in pace field is ignored
                [self calculatePace];
            }
            
            paceField.alpha=1;
        }
        
    }
    else if ([_lenguage.text isEqualToString:@"Ingles"]) {
        
        
        if (_DustanceTextFiedl.text.length <=0 )
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing data" message:@"Provide Distance." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else if (timeField.text.length <=0 )
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing data" message:@"Provide Time." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
            
        {
            
            NSString *empty = @"";
            
            if ([distanceField.text isEqualToString:empty] && ![timeField.text isEqualToString:empty]  && ![paceField.text isEqualToString:empty]) {
                [self calculateDistance];
            } else if ([timeField.text isEqualToString:empty] && ![distanceField.text isEqualToString:empty]  && ![paceField.text isEqualToString:empty]) {
                //if time field is empty but distance and pace is entered,
                [self calculateTotalTime];
            } else {
                //by default, calculate pace (given you have values for distance and time - text in pace field is ignored
                [self calculatePace];
            }
            
            paceField.alpha=1;
        }
        
    }
    else if ([_lenguage.text isEqualToString:@"Polaco"]) {
        
        if (_DustanceTextFiedl.text.length <=0 )
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing data" message:@"Provide Distance." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else if (timeField.text.length <=0 )
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing data" message:@"Provide Time." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
            
        {
            
            NSString *empty = @"";
            
            if ([distanceField.text isEqualToString:empty] && ![timeField.text isEqualToString:empty]  && ![paceField.text isEqualToString:empty]) {
                [self calculateDistance];
            } else if ([timeField.text isEqualToString:empty] && ![distanceField.text isEqualToString:empty]  && ![paceField.text isEqualToString:empty]) {
                //if time field is empty but distance and pace is entered,
                [self calculateTotalTime];
            } else {
                //by default, calculate pace (given you have values for distance and time - text in pace field is ignored
                [self calculatePace];
            }
            
            paceField.alpha=1;
        }
        
    }
    
    
}

//this might be best as a +
//this method has a bunch of object c centric formatting which might cause problems.
-(NSInteger) convertStringToTime:(NSString *) timeAsTextField
{
    float tSeconds = 0.0;
    
   	NSString *timeString = timeAsTextField;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //what does it do if it can't find hh or mm?
    formatter.dateFormat = @"hh:mm:ss";
    NSDate *timeDate = [formatter dateFromString:timeString];
    
    formatter.dateFormat = @"ss";
    int seconds = [[formatter stringFromDate:timeDate] intValue];
    
    formatter.dateFormat = @"hh";
    int hours = [[formatter stringFromDate:timeDate] intValue];
    if(hours == 12) { //is this because 12 is noon?
        hours = 0;
    }
    
    formatter.dateFormat = @"mm";
    int minutes = [[formatter stringFromDate:timeDate] intValue];
    
    tSeconds = seconds + (minutes * 60) + (hours * 3600);
    
    if(tSeconds == 0) {
        tSeconds = [self convertStringToTimeNoHours: timeAsTextField];
        if(tSeconds == 0) {
            tSeconds = [self convertStringToTimeNoHoursMinutes: timeAsTextField];
        }
    }
    
    return tSeconds;
    
}

-(NSInteger) convertStringToTimeNoHours:(NSString *) timeAsTextField
{
    float tSeconds = 0.0;
    
    NSString *timeString = timeAsTextField;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"mm:ss";
    NSDate *timeDate = [formatter dateFromString:timeString];
    
    formatter.dateFormat = @"ss";
    int seconds = [[formatter stringFromDate:timeDate] intValue];
    
    formatter.dateFormat = @"mm";
    int minutes = [[formatter stringFromDate:timeDate] intValue];
    
    tSeconds = seconds + (minutes * 60);
    
    return tSeconds;
}
-(NSInteger) convertStringToTimeNoHoursMinutes:(NSString *) timeAsTextField
{
    float tSeconds = 0.0;
    
    NSString *timeString = timeAsTextField;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"ss";
    NSDate *timeDate = [formatter dateFromString:timeString];
    
    int seconds = [[formatter stringFromDate:timeDate] intValue];
    
    tSeconds = seconds;
    
    return tSeconds;
    
}


//this might be best as a +
-(NSString *) convertSecondsToString:(int) seconds
{
    int m = seconds / 60;
    int s = seconds - (m * 60);
    int h = 0;
    while(m > 59) {
        h = h + 1;
        m = m - 60;
    }
    
    NSString *timerend = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", h, m, s];
    
    return timerend;
}


-(void) calculatePace
{
    int seconds = [self convertStringToTime:timeField.text];
    printf("in calculate Pace, timeInSeconds %d\n", seconds);
    float distance = [distanceField.text floatValue];
    
    if(distance != 0) {
        int sPace = seconds / distance;
        
        
        NSString *time = [self convertSecondsToString: sPace];
        
       
        NSString *str = time;
        str = [str stringByReplacingOccurrencesOfString:@":"
                                             withString:@"."];
        
        NSString *bas = str;
        if ([bas hasPrefix:@"0"] && [bas length] > 1) {
            bas = [bas substringFromIndex:1];
          
        }
      
          NSLog(@">>>>%@",bas);
        
        paceField.text = str;
        }
}



//given we have pace and distance
-(void) calculateTotalTime
{
    int sPace = [self convertStringToTime: paceField.text];
    float distance = [distanceField.text floatValue];
    int tTime = sPace * distance;
    
    NSString *time = [self convertSecondsToString: tTime];
    timeField.text = time;
}
//given we have the pace and total time
-(void) calculateDistance
{
    int sPace  = [self convertStringToTime: paceField.text];
    int sTime  = [self convertStringToTime: timeField.text];
    
    if(sPace != 0) {
        float distance = (float)sTime / sPace;
        NSString *d = [[NSString alloc] initWithFormat:@"%02.2f", distance];
        distanceField.text = d;
        
        
    }
}
-(void) testSecondsToString
{
    NSLog(@"0:00:59 - %@\n", [self convertSecondsToString:59]);
    NSLog(@"0:01:01 - %@\n", [self convertSecondsToString:61]);
    NSLog(@"0:02:00 - %@\n", [self convertSecondsToString:120]);
    NSLog(@"0:59:59 - %@\n", [self convertSecondsToString:3599]);
    NSLog(@"1:00:00 - %@\n", [self convertSecondsToString:3600]);
    NSLog(@"1:00:01 - %@\n", [self convertSecondsToString:3601]);
    NSLog(@"1:01:01 - %@\n", [self convertSecondsToString:3661]);
    NSLog(@"1:01:00 - %@\n", [self convertSecondsToString:3660]);
    NSLog(@"2:01:00 - %@\n", [self convertSecondsToString:7260]);
    NSLog(@"2:01:10 - %@\n", [self convertSecondsToString:7270]);

    
    NSLog(@"0:00:59 - %@\n", [self timeFormatted:59]);
    NSLog(@"0:01:01 - %@\n", [self timeFormatted:61]);
    NSLog(@"0:02:00 - %@\n", [self timeFormatted:120]);
    NSLog(@"0:59:59 - %@\n", [self timeFormatted:3599]);
    NSLog(@"1:00:00 - %@\n", [self timeFormatted:3600]);
    NSLog(@"1:00:01 - %@\n", [self timeFormatted:3601]);
    NSLog(@"1:01:01 - %@\n", [self timeFormatted:3661]);
    NSLog(@"1:01:00 - %@\n", [self timeFormatted:3660]);
    NSLog(@"2:01:00 - %@\n", [self timeFormatted:7260]);
    NSLog(@"2:01:10 - %@\n", [self timeFormatted:7270]);
    
}
-(void) testStringToSeconds
{
    
    NSString *time = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 0, 59];
    NSLog(@"59 - %ld\n", (long)[self convertStringToTime:time]);
    
    NSString *time2 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 1, 1];
    NSLog(@"61 - %ld\n", (long)[self convertStringToTime:time2]);
    
    NSString *time3 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 2, 0];
    NSLog(@"120 - %ld\n", (long)[self convertStringToTime:time3]);
    
    NSString *time4 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 59, 59];
    NSLog(@"3599 - %ld\n", (long)[self convertStringToTime:time4]);
    
    NSString *time5 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 1, 0, 0];
    NSLog(@"3600 - %ld\n", (long)[self  convertStringToTime:time5]);
    
    NSString *time6 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 1, 0, 1];
    NSLog(@"3601 - %ld\n", (long)[self convertStringToTime:time6]);
    
    NSString *time7 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 1,1,1];
    NSLog(@"3661 - %ld\n", (long)[self convertStringToTime:time7]);
    
    NSString *time8 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 1,1,0];
    NSLog(@"3660 - %ld\n", (long)[self convertStringToTime:time8]);
    
    NSString *time9 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 2, 1, 0];
    NSLog(@"7260 - %ld\n", (long)[self convertStringToTime:time9]);
    
    NSString *time10 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 2, 1, 10];
    NSLog(@"7270 - %ld\n", (long)[self convertStringToTime:time10]);
    
    NSString *time11 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 0, 59];
    NSLog(@"59 - %ld\n", (long)[self convertStringToTime:time11]);
    
    NSString *time12 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 1, 1];
    NSLog(@"61 - %ld\n", (long)[self convertStringToTime:time12]);
    
    NSString *time13 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 2, 0];
    NSLog(@"120 - %ld\n", (long)[self convertStringToTime:time13]);
    
    NSString *time14 = [[NSString alloc] initWithFormat:@"%2d:%02.2d:%02.2d", 0, 59, 59];
    NSLog(@"3599 - %ld\n", (long)[self convertStringToTime:time14]);
    
    NSString *time15 = [[NSString alloc] initWithFormat:@"%02.2d", 59];
    NSLog(@"59 - %ld\n", (long)[self convertStringToTime:time15]);
    
    NSString *time16 = [[NSString alloc] initWithFormat:@"%02.2d:%02.2d", 1, 1];
    NSLog(@"61 - %ld\n", (long)[self convertStringToTime:time16]);
    
    NSString *time17 = [[NSString alloc] initWithFormat:@"%02.2d:%02.2d", 2, 0];
    NSLog(@"120 - %ld\n", (long)[self convertStringToTime:time17]);
    
    NSString *time18 = [[NSString alloc] initWithFormat:@"%02.2d:%02.2d", 59, 59];
    NSLog(@"3599 - %ld\n", (long)[self convertStringToTime:time18]);
    
    NSString *time19 = [[NSString alloc] initWithFormat:@"%02.2d", 59];
    NSLog(@"59 - %ld\n", (long)[self convertStringToTime:time19]);
    
    NSString *time20 = [[NSString alloc] initWithFormat:@"%02.2d:%02.2d", 1, 1];
    NSLog(@"61 - %ld\n", (long)[self convertStringToTime:time20]);
    
}

- (NSString *)timeFormatted:(int)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

@end
