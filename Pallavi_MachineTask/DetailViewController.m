//
//  DetailViewController.m
//  Pallavi_MachineTask
//
//  Created by Student P_08 on 26/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //METHOD
    [self pasteData];
    // Do any additional setup after loading the view.
}
-(void)pasteData
{
    self.lblone.text = self.str1;
    self.lbltwo.text = self.str2;
    self.imageone.image = self.img;
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
