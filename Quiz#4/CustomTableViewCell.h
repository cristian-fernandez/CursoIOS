//
//  CustomTableViewCell.h
//  Quiz#4
//
//  Created by Cristian Fernandez on 11/19/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class colorNumbers;

@interface CustomTableViewCell : UITableViewCell
-(void)setupCellWithColors:(colorNumbers*)color;
@end
