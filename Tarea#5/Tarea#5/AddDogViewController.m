//
//  AddDogViewController.m
//  Tarea#5
//
//  Created by Cristian Fernandez on 12/6/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "AddDogViewController.h"
#import "Dog.h"
#import "RealmManager.h"
#include <stdlib.h>

@interface AddDogViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@end

@implementation AddDogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSaveUIBarButtonItem];
    // Do any additional setup after loading the view.
}
-(void) addSaveUIBarButtonItem{
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNews)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
    self.navigationItem.title = @"Add dogs";
}
-(void)saveNews{
    
    int ale = arc4random_uniform(10);
    [RealmManager createDog:self.nameTextField.text dogColor:self.colorTextField.text imageName:[NSString stringWithFormat:@"%d", ale]];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}
@end
