//
//  ColorNumbersViewController.m
//  Quiz#4
//
//  Created by Cristian Fernandez on 11/19/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "ColorNumbersViewController.h"
#import "CustomTableViewCell.h"
#import "colorNumbers.h"


#define CUSTOM_CELL_IDENTIFIER @"CustomTableViewCell"


@interface ColorNumbersViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *colorNumberTableView;

@property (nonatomic,strong) NSArray *colorArray;

@end

@implementation ColorNumbersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCustomCell];
    [self initializeColorArray];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)registerCustomCell{
    //este metodo es como para inicializar la celda asociado a table
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    //
    [self.colorNumberTableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}
-(void)initializeColorArray{
    NSMutableArray *AuxArray = [NSMutableArray array];
    for (int i = 1; i<=5000; i++) {
        NSString *color = @"Rojo";
        if (i%2==(0))
            color = @"Azul";
        
        [AuxArray addObject:[[colorNumbers alloc] initWithName:[NSString stringWithFormat:@"%d",i]background:[NSString stringWithFormat:@"%@",color]]];
    }
    self.colorArray = [[NSArray alloc] initWithArray:AuxArray];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

#pragma -MARK TABLE VIEW METHODS
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.colorArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    colorNumbers *colorToShow = self.colorArray[indexPath.row];
    [cell setupCellWithColors:colorToShow];
   
    return cell;
}
@end
