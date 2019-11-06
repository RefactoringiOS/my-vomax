//
//  Lenguage.m
//  My VOmax
//
//  Created by Erinson Villarroel on 22/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "Lenguage.h"

@interface Lenguage ()
@property (strong, nonatomic) IBOutlet UILabel *Idioma;

@end

@implementation Lenguage

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)Ingles:(id)sender {
    
    _Idioma.text=@"Ingles";
    NSLog(@"%@",_Idioma.text);
    
    NSString *valueToSave = _Idioma.text;
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Idioma"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
- (IBAction)Spanol:(id)sender {
    _Idioma.text=@"Spanol";
    NSLog(@"%@",_Idioma.text);
    
    NSString *valueToSave = _Idioma.text;
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Idioma"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (IBAction)Polaco:(id)sender {
    _Idioma.text=@"Polaco";
    NSLog(@"%@",_Idioma.text);
    
    NSString *valueToSave = _Idioma.text;
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Idioma"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
