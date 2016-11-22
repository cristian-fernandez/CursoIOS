//
//  FibonacciiViewController.m
//  Tarea4
//
//  Created by Cristian Fernandez on 11/18/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import "FibonacciiViewController.h"
#import "FibonacciCustomTableViewCell.h"
#import "Fibonacci.h"


#define CUSTOM_CELL_IDENTIFIER @"FibonacciCustomTableViewCell"




@interface FibonacciiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *fiboArray;
@end


@implementation FibonacciiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self initializeFiboArray];
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
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}
-(void)initializeFiboArray{
    //no funciono el long no aguanta numeros tan largos
    /*NSMutableArray *AuxArray = [NSMutableArray array];
    
    long f1 = 1;
    long f2 = 0;
    long fn;
    
    [AuxArray addObject:[[Fibonacci alloc] initWithName:[NSString stringWithFormat:@"%d",0]]];
    for (int i = 1; i<1000; i++) {
        fn = f1 + f2;
        f1 = f2;
        f2 = fn;
        [AuxArray addObject:[[Fibonacci alloc] initWithName:[NSString stringWithFormat:@"%lld",fn]]];
     
    }
    self.fiboArray = [[NSArray alloc] initWithArray:AuxArray];*/
    
    
    NSMutableArray *AuxArray = [NSMutableArray array];
    NSMutableArray *f1 = [NSMutableArray array];
    NSMutableArray *f2 = [NSMutableArray array];
    NSMutableArray *fn = [NSMutableArray array];
    [f1 addObject:[NSNumber numberWithInt:1]];
    [f2 addObject:[NSNumber numberWithInt:0]];
    [AuxArray addObject:[[Fibonacci alloc] initWithName:[NSString stringWithFormat:@"%d",0]]];
    for (int i = 1; i<1000; i++) {
        int decena = 0, total = 0;
        int sumando1 = 0;
        int sumando2 = 0;
        [fn removeAllObjects];
        int j = 0;
        for(;j< f1.count;j++){
            sumando1 = [(NSNumber *) [f1 objectAtIndex:j] intValue];
            sumando2 = [(NSNumber *) [f2 objectAtIndex:j] intValue];
            total = sumando1 + sumando2 + decena;
            if(total>9){
                total = total%10;
                decena = 1;
            }else{
                decena = 0;
            }
            [fn addObject:[NSNumber numberWithInt:total]];
        }
        for (;j<f2.count; j++) {
            sumando2 = [(NSNumber *) [f2 objectAtIndex:j] intValue];
            total = sumando2 + decena;
            if(total>9){
                total = total%10;
                decena = 1;
            }else{
                decena = 0;
            }
            [fn addObject:[NSNumber numberWithInt:total]];
        }
        if(decena!=0){
           [fn addObject:[NSNumber numberWithInt:decena]];
        }
        
        f1 = [NSMutableArray arrayWithArray:f2];
        f2 = [NSMutableArray arrayWithArray:fn];
        [AuxArray addObject:[[Fibonacci alloc] initWithName:[NSString stringWithFormat:@"%@",[self getFn:fn]]]];
    }
    self.fiboArray = [[NSArray alloc] initWithArray:AuxArray];
}

-(NSString*) getFn:(NSMutableArray*) fn{
    NSString *result = @"";
    for (int i = fn.count-1; i>=0; i--) {
        result = [NSString stringWithFormat:@"%@%@",result, fn[i]];
    }
    return result;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

#pragma -MARK TABLE VIEW METHODS
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fiboArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FibonacciCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    Fibonacci *fiboToShow = self.fiboArray[indexPath.row];
    [cell setupCellWithFibo:fiboToShow];
    return cell;
}


@end
