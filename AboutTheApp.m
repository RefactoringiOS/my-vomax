//
//  AboutTheApp.m
//  My VOmax
//
//  Created by Erinson Villarroel on 10/03/17.
//  Copyright © 2017 Erinson Villarroel. All rights reserved.
//

#import "AboutTheApp.h"

@interface AboutTheApp ()

@end

@implementation AboutTheApp
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)back:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)cloused:(id)sender {
    [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self.navigationController popViewControllerAnimated:YES];
}





@end
