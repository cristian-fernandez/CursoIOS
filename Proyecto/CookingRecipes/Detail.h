//
//  Detail.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/16/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Realm/Realm.h>

@interface Detail : RLMObject
@property NSString *FoodName;
@property NSString *Ingredient;
@property NSString *History;
@property NSString *Recipe;
@property NSString *Image;
@end
RLM_ARRAY_TYPE(Detail)
