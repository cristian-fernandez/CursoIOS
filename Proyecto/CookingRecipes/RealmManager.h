//
//  RealmManager.h
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "Detail.h"

@interface RealmManager : NSObject
+(RLMResults*)getAllTypes;
+(RLMArray*)getFoodsWithTypeName:(NSString*)typeName;
+(Detail*)getDetailsWithFoodName:(NSString*)foodName;
@end
