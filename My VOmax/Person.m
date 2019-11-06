//
//  Person.m
//  BMICalculator
//
//  Created by DonghuiLi on 16/6/29.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import "Person.h"

static Person* secretPerson;


@implementation Person
@synthesize heightINM;
@synthesize weightInKG;
@synthesize ageInYear;
@synthesize sex;
const double lowerBMI = 18.50;
const double higherBMI = 24.99;

+(Person*) sharedPersonInstance
{
	if (secretPerson == nil) {
		secretPerson = [[Person alloc] init];
	}
	
	return secretPerson;
}

-(NSNumber*) bmi
{
	return @((self.weightInKG.doubleValue) / (self.heightINM.doubleValue * self.heightINM.doubleValue));
}

-(NSNumber*) bmr
{
	if (sex.boolValue == YES) return @((13.397 * self.weightInKG.doubleValue) + (479.9 * self.heightINM.doubleValue) - (5.677 * self.ageInYear.doubleValue) + 88.362);
	else return @((9.247 * self.weightInKG.doubleValue) + (309.8 * self.heightINM.doubleValue) - (4.330 * self.ageInYear.doubleValue) + 447.593);
}

-(NSString*) dietPlanDescription
{
	double bmiValue = ([self bmi]).doubleValue;
	double bmrValue = ([self bmr]).doubleValue;
	
	if (bmiValue < lowerBMI) {
		double healthyWeight = lowerBMI * (self.heightINM.doubleValue * self.heightINM.doubleValue);
		double timeInWk = (-(self.weightInKG.doubleValue - healthyWeight)) / 0.45;
		return [NSString stringWithFormat:@"Intake at least %0.2f kcal/day for %0.0f wks to keep fit.", bmrValue + 500, timeInWk];
	}
	else if (bmiValue > higherBMI) {
		double healthyWeight = higherBMI * (self.heightINM.doubleValue * self.heightINM.doubleValue);
		double timeInWk = ((self.weightInKG.doubleValue - healthyWeight)) / 0.45;
		return [NSString stringWithFormat:@"Intake at most %0.2f kcal/day for %0.0f wks to keep fit.", bmrValue - 500, timeInWk];
	}
	else return @"Congrats! Your BMI is fine!";
}

-(NSString*) description
{
	return [NSString stringWithFormat:@"%p %@ %@", self, self.weightInKG, self.heightINM];
}

-(void) unitTrans {
	self.heightINM = @(self.heightINM.doubleValue * 0.0254);
	self.weightInKG = @(self.weightInKG.doubleValue * 0.453592);
}

@end
