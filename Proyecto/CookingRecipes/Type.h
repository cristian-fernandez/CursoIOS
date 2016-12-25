//
//  Type.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Realm/Realm.h>
#import <Realm/Realm.h>
#import "Food.h"

@interface Type : RLMObject
@property RLMArray<Food *><Food> *food;
@property NSString *typeName;
@property NSString *imageName;
@property NSString *imageUrl;
@end
RLM_ARRAY_TYPE(Type)
