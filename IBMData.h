//
//  IBMData.h
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBMData : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *bmiLabel;

@property (weak, nonatomic) IBOutlet UITextField *ageLabel;
@property (weak, nonatomic) IBOutlet UITextField *weightLabel;
@property (weak, nonatomic) IBOutlet UITextField *heightLabel;

@property (weak, nonatomic) IBOutlet UILabel *weightUnitLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightUnitLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmrLabel;
@property (weak, nonatomic) IBOutlet UILabel *dietPlanLabel;

@property (weak, nonatomic) IBOutlet UIImageView *picture_normal;
@property (weak, nonatomic) IBOutlet UIImageView *picture_overwgt;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIImageView *picture_thin;

- (IBAction)unitButton:(id)sender;
- (IBAction)genderButton:(id)sender;
- (IBAction)calculateButton:(id)sender;
@end

