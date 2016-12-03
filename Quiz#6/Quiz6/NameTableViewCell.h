//
//  NameTableViewCell.h
//  
//
//  Created by Cristian Fernandez on 12/3/16.
//
//

#import <UIKit/UIKit.h>
@class Person;

@interface NameTableViewCell : UITableViewCell
-(void)setupCellWithPerson:(Person*)person;
@end
