
//
//  FirstTableViewController.m
//  Locker
//
//  Created by 赵波 on 15/5/31.
//  Copyright (c) 2015年 第11组. All rights reserved.
//

#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
@interface FirstTableViewController ()
@property(nonatomic,strong)SecondTableViewController *secTVC;
@property(nonatomic,assign)BOOL show;
@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _secTVC = [[SecondTableViewController alloc]initWithStyle:UITableViewStylePlain];
    _secTVC.tableView.frame = CGRectMake(-200, 64, 200,self.navigationController.view.frame.size.height);
    [self.parentViewController.view addSubview:_secTVC.tableView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"抽屉" style:UIBarButtonItemStyleDone target:self action:@selector(show:)];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FirstTableViewCell"];
}
-(void)show:(id)sender{
    if (_show == NO) {
        [UIView animateWithDuration:0.2 animations:^{
            _secTVC.tableView.frame = CGRectMake(0, 64, 200, self.navigationController.view.frame.size.height);
            self.tableView.frame = CGRectMake(200, 0, self.tableView.frame.size.width, self.tableView.frame.size.height);
            _show = YES;
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            _secTVC.tableView.frame = CGRectMake(-200, 64, 200,self.navigationController.view.frame.size.height);
            self.tableView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height);
            _show = NO;
        }];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
