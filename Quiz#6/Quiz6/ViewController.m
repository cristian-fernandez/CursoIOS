//
//  ViewController.m
//  Quiz6
//
//  Created by Cristian Fernandez on 12/3/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NameTableViewCell.h"
#import "RealmManager.h"



#define CUSTOM_CELL_IDENTIFIER @"NameTableViewCell"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *NameTable;
@property RLMResults *nameArray;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCustomCell];
    [self initializeNameArray];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)registerCustomCell{
    //este metodo es como para inicializar la celda asociado a table
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    //
    [self.NameTable registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}
-(void)initializeNameArray{
    self.nameArray = [RealmManager getAllPersons];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    Person *PersonToShow = self.nameArray[indexPath.row];
    
    [cell setupCellWithPerson:PersonToShow];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (IBAction)OrderByAlphabetic:(id)sender {
//    RLMResults *sortedArray = [self.nameArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (IBAction)OrderByNum:(id)sender {
    
}

@end
