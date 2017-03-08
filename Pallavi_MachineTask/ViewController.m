//
//  ViewController.m
//  Pallavi_MachineTask
//
//  Created by Student P_08 on 26/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCellItemTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)getData
{
    NSString *string = @"https://newsapi.org/v1/articles?source=techcrunch&apiKey=efe99de73d1d49608eb3d4e87c536b26";
    NSURL *url = [NSURL URLWithString:string];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *datatask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response,NSError *error){
        if(data != nil)
        {
            NSError *error;
            //DISPATCH
           // dispatch_async(dispatch_get_main_queue(), ^{
             //   [self.tableview reloadData];
           // });
            NSDictionary  *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            array = [dict valueForKey:@"articles"];
            NSLog(@"%@",dict);
            [self.tableview reloadData];
        }
        else{
            UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:actionOk];
            [self presentViewController:alertController animated:YES completion:nil];
          // NSLog(@"%@",error.localizedDescription);
        }
    }];
    [datatask resume];
 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = @"cell";
    TableViewCellItemTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil)
    {
        cell = [[TableViewCellItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    
    }
    
    NSDictionary *obj = [array objectAtIndex:indexPath.row];
    
    
    cell.lblauthor.text = [obj  valueForKey:@"author"];
    cell.lbldecription.text =[obj valueForKey:@"description"];
   
    NSString *str1 = [obj valueForKey:@"urlToImage"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:str1]];
    cell.imageview.image =[UIImage imageWithData:data];
                           
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    DetailViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    TableViewCellItemTableViewCell *btlcell = [tableView cellForRowAtIndexPath:indexPath];
    obj.str1=btlcell.lblauthor.text;
    obj.str2=btlcell.lbldecription.text;
    obj.imageone.image=btlcell.imageview.image;
    

    [self.navigationController pushViewController:obj animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
