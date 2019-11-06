//
//  PaceCalculator.h
//  My VOmax
//
//  Created by Erinson Villarroel on 14/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaceCalculator : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property(retain, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *DistanceArray;



@end
