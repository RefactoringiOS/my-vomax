//
//  Person.h
//  BMICalculator
//
//  Created by DonghuiLi on 16/6/29.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong) NSNumber* heightINM;
@property (strong) NSNumber* weightInKG;
@property (strong) NSNumber* ageInYear;
@property (strong) NSNumber* sex;

+(Person*) sharedPersonInstance;

-(NSNumber*) bmi;
-(NSNumber*) bmr;
-(NSString*) description;
-(NSString*) dietPlanDescription;
-(void) unitTrans;

@end
