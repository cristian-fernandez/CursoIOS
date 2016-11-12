//
//  PrimosTableViewController.m
//  Quiz#3
//
//  Created by Cristian Fernandez on 11/12/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "PrimosTableViewController.h"

#define NUMERO_KEY @"numero"
#define PRIMO_KEY @"primo"

@interface PrimosTableViewController ()

@end

@implementation PrimosTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDictionary];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)createDictionary{
    self.numerosArray = [NSMutableArray array];
    
    for (int i = 1; i <= 1000; i++)
    {
        int div = 0;
        for (int j = 1; j <= i/2; j++){
            if(i%j==0){
                div = div +1;
                if(div > 1)
                    break;
            }
        }
        if(div == 1){
            [self.numerosArray  addObject:@{NUMERO_KEY: [NSString stringWithFormat:@"%d",i],PRIMO_KEY:@"SI"}];
        }else{
            [self.numerosArray  addObject:@{NUMERO_KEY: [NSString stringWithFormat:@"%d",i],PRIMO_KEY:@"NO"}];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *currentNumero = self.numerosArray[indexPath.row];
    cell.textLabel.text = [currentNumero valueForKey:NUMERO_KEY];
    
    cell.detailTextLabel.text=[currentNumero valueForKey:PRIMO_KEY];
    
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
