//
//  ViewController.m
//  Quiz#5
//
//  Created by Cristian Fernandez on 11/26/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "ViewController.h"
#import "DivisorTableViewCell.h"

#define CUSTOM_CELL_IDENTIFIER @"DivisorTableViewCell"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *divisoresArray;
@property (weak, nonatomic) IBOutlet UITextField *NumeroTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCustomCell];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)registerCustomCell{
    //este metodo es como para inicializar la celda asociado a table
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    //
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}
-(void)initializeDiviArray{
    
    NSMutableArray *AuxArray = [NSMutableArray array];
    
    int num = [self.NumeroTextField.text integerValue];
    for (int i = 1; i<num; i++) {
        if(num%i == 0)
            [AuxArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.divisoresArray = [[NSArray alloc] initWithArray:AuxArray];
    [self.tableView reloadData];
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

#pragma -MARK TABLE VIEW METHODS
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.divisoresArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DivisorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    NSString *value =  self.divisoresArray[indexPath.row];
    
    [cell setupCellWithDivi:value];
    return cell;
}
- (IBAction)procesaDivisores:(id)sender {
    [self initializeDiviArray];
}

@end
