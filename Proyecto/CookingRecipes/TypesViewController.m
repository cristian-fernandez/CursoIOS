//
//  TypesViewController.m
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/13/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "TypesViewController.h"
#import "RealmManager.h"
#import "TypeCustomTableViewCell.h"
#import "Type.h"
#import "FoodViewController.h"



#define CUSTOM_CELL_IDENTIFIER @"TypeCustomTableViewCell"

@interface TypesViewController () <UITableViewDelegate,UITableViewDataSource>
@property RLMResults *typesArray;
@property (weak, nonatomic) IBOutlet UITableView *TypesTableView;
@end

@implementation TypesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self initializeCategoriaArray];
    // Do any additional setup after loading the view.
}

-(void)registerCustomCell{
    //este metodo es como para inicializar la celda asociado a table
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    //
    [self.TypesTableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}
-(void)initializeCategoriaArray{
    self.typesArray = [RealmManager getAllTypes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.typesArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TypeCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    Type *typeToShow = self.typesArray[indexPath.row];
    
    [cell setupCellWithTypes:typeToShow];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"FoodViewController"];
    //NSUInteger theinteger = [self.texto.text rangeOfString:self.texto.text].length ;
    //NSString *string = [NSString stringWithFormat:@"%d", theinteger];
    Type *typeSelected = self.typesArray[indexPath.row];
    nextViewController.TypeName = typeSelected.typeName;
    [self.navigationController pushViewController:nextViewController animated: YES];
}


@end
