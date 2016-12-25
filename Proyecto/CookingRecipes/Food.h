//
//  Food.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/15/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Realm/Realm.h>
@class Type;
@interface Food : RLMObject
    @property NSString *FoodName;
    @property Type *type;
@property NSString *Image;
@end
RLM_ARRAY_TYPE(Food)


