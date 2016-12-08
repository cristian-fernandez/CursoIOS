//
//  DogsViewController.m
//  Tarea#5
//
//  Created by Cristian Fernandez on 12/6/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "DogsViewController.h"
#import "Dog.h"
#import "DogCustomTableViewCell.h"
#import "RealmManager.h"
#import "AddDogViewController.h"


#define CUSTOM_CELL_IDENTIFIER @"DogCustomTableViewCell"

@interface DogsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *DogTableView;
@property RLMResults *dogsArray;
@end


@implementation DogsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self createAddNewsUIButtonItem];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadNews];
}

-(void) createAddNewsUIButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}
-(void) addItem{
    AddDogViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"AddDogViewController"];
    
    //nextViewController.categoryName = self.categoryName;
    [self.navigationController pushViewController:nextViewController animated: YES];
}

-(void)registerCustomCell{
    //este metodo es como para inicializar la celda asociado a table
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    //
    [self.DogTableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}

-(void)initializeDogsArray{
    self.dogsArray = [RealmManager getAllDogs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dogsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    Dog *dogToShow = self.dogsArray[indexPath.row];
    
    [cell setupCellWithDogs:dogToShow];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)loadNews{
    self.dogsArray = [RealmManager getAllDogs];
    [self.DogTableView reloadData];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        self.dogsArray = [RealmManager deleteDog:self.dogsArray row:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
@end
