//
//  ViewController.h
//  Pallavi_MachineTask
//
//  Created by Student P_08 on 26/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *array;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;





@end

