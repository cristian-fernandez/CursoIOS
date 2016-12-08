//
//  DogCustomTableViewCell.h
//  Tarea#5
//
//  Created by Cristian Fernandez on 12/6/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dog;

@interface DogCustomTableViewCell : UITableViewCell
-(void)setupCellWithDogs:(Dog*)dog;
@end
