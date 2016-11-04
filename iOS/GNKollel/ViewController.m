//
//  ViewController.m
//  Mishkan Torah
//
//  Created by TUNG on 10/14/16.
//  Copyright © 2016 com.example. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)firstBtn:(id)sender {
    [self showTabBarController:0];
}
- (IBAction)secondBtn:(id)sender {
    [self showTabBarController:1];
}
- (IBAction)thirdBtn:(id)sender {
    [self showTabBarController:2];
}
- (IBAction)fourBtn:(id)sender {
    [self showTabBarController:3];
}
- (IBAction)fiveBtn:(id)sender {
    [self showTabBarController:4];
}

- (void)showTabBarController:(NSUInteger) index
{
    UITabBarController *vc;

    vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tabbarID"];
    
    [vc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:vc animated:YES completion:nil];
    [vc setSelectedIndex:index];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
