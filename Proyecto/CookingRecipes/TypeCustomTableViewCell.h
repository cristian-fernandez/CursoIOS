//
//  TypeCustomTableViewCell.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Type;
@interface TypeCustomTableViewCell : UITableViewCell
-(void)setupCellWithTypes:(Type*)type;
@end
