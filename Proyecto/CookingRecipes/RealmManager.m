//
//  RealmManager.m
//  CookingRecipes
//
//  Created by Cristian Fernandez on 12/14/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//


#import "RealmManager.h"
#import <Realm/Realm.h>
#import "Type.h"
#import "Food.h"
#import "Detail.h"

#define TYPE_NAME_KEY @"TYPE_NAME_KEY"
#define TYPE_IMAGE_NAME_KEY @"TYPE_IMAGE_NAME_KEY"
#define TYPE_IMAGE_URL_KEY @"TYPE_IMAGE_URL_KEY"
#define FOOD_NAME_KEY @"FOOD_NAME_KEY"
#define INGREDIENT_KEY @"INGREDIENT_KEY"
#define HISTORY_KEY @"HISTORY_KEY"
#define RECIPE_KEY @"RECIPE_KEY"
#define IMAGE_NAME_KEY @"IMAGE_NAME_KEY"


@implementation RealmManager
//Metodos genericos
+(void) insertObjectInDB:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}
// *** TYPES ***
+(RLMResults*)getAllTypes{
    if([self needsToInsertTypes]){
        [self createDefaultTypes];
        [self createDefaultFoods];
        [self createDefaultDetails];
    }
    return [Type allObjects];
}

+(BOOL)needsToInsertTypes{
    RLMResults<Type *> *types = [Type allObjects];// retrieves all Types from the default Realm
    if(types.count==0){
        return true;
    }
    return false;
}

+(void)createDefaultTypes{
    NSArray *typeArray = [self createTypesDictionary];
    for (NSDictionary *typeDictionary in typeArray) {
        Type *type = [Type new];
        type.typeName = [typeDictionary valueForKey:TYPE_NAME_KEY];
        type.imageName = [typeDictionary valueForKey:TYPE_IMAGE_NAME_KEY];
        type.imageUrl = [typeDictionary valueForKey:TYPE_IMAGE_URL_KEY];
        [self insertObjectInDB:type];
    }
}

+(NSArray*)createTypesDictionary{
    return [[NSArray alloc] initWithObjects:
            @{TYPE_NAME_KEY:@"Desayuno",TYPE_IMAGE_NAME_KEY:@"Desayuno",TYPE_IMAGE_URL_KEY:@"http://localhost:3000/Foods/Desayuno.jpg"},
            @{TYPE_NAME_KEY:@"Almuerzo",TYPE_IMAGE_NAME_KEY:@"Almuerzo",TYPE_IMAGE_URL_KEY:@"http://localhost:3000/Foods/Almuerzo.jpg"},
            @{TYPE_NAME_KEY:@"Bocas",TYPE_IMAGE_NAME_KEY:@"Bocas",TYPE_IMAGE_URL_KEY:@"http://localhost:3000/Foods/Bocas.jpg"},
            @{TYPE_NAME_KEY:@"Bebidas",TYPE_IMAGE_NAME_KEY:@"Bebidas",TYPE_IMAGE_URL_KEY:@"http://localhost:3000/Foods/Bebidas.jpg"},
            nil];
}

/*** FOODS ***/


+(RLMArray*)getFoodsWithTypeName:(NSString*)typeName{
    Type *type = [self getTypeWithName:typeName];
    return type.food;
}

+(Type*)getTypeWithName:(NSString*)typeName{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"typeName =%@",typeName];
    RLMResults<Type *> *types = [Type objectsWithPredicate:predicate];
    if(types.count>0){
        return types.firstObject;
    }
    return nil;
}
+(void)createDefaultFoods{
    NSArray *foodsArray = [self createFoodsDictionary];
    for (NSDictionary *foodDictionary in foodsArray) {
        [self createFoodsWithTypesName:[foodDictionary valueForKey:TYPE_NAME_KEY] foodName:[foodDictionary valueForKey:FOOD_NAME_KEY] image:[foodDictionary valueForKey:IMAGE_NAME_KEY]];
    }
}
+(NSArray*)createFoodsDictionary{
    return [[NSArray alloc] initWithObjects:
            @{TYPE_NAME_KEY:@"Desayuno",FOOD_NAME_KEY:@"Pinto", IMAGE_NAME_KEY:@"Pinto"},
            @{TYPE_NAME_KEY:@"Desayuno",FOOD_NAME_KEY:@"Frutas", IMAGE_NAME_KEY:@"Fruta"},
            @{TYPE_NAME_KEY:@"Desayuno",FOOD_NAME_KEY:@"Cereal", IMAGE_NAME_KEY:@"Cereal"},
            @{TYPE_NAME_KEY:@"Bebidas",FOOD_NAME_KEY:@"Chan", IMAGE_NAME_KEY:@"Chan"},
            @{TYPE_NAME_KEY:@"Bebidas",FOOD_NAME_KEY:@"Banano", IMAGE_NAME_KEY:@"Banano"},
            @{TYPE_NAME_KEY:@"Bebidas",FOOD_NAME_KEY:@"Frutas", IMAGE_NAME_KEY:@"Frutas"},
            @{TYPE_NAME_KEY:@"Almuerzo",FOOD_NAME_KEY:@"Casado", IMAGE_NAME_KEY:@"Casado"},
            @{TYPE_NAME_KEY:@"Almuerzo",FOOD_NAME_KEY:@"Camarones", IMAGE_NAME_KEY:@"Camarones"},
            @{TYPE_NAME_KEY:@"Almuerzo",FOOD_NAME_KEY:@"Pescado entero", IMAGE_NAME_KEY:@"Pescado"},
            @{TYPE_NAME_KEY:@"Bocas",FOOD_NAME_KEY:@"Chifrijo", IMAGE_NAME_KEY:@"Chifrijo"},
            @{TYPE_NAME_KEY:@"Bocas",FOOD_NAME_KEY:@"Alitas", IMAGE_NAME_KEY:@"Alitas"},
            @{TYPE_NAME_KEY:@"Bocas",FOOD_NAME_KEY:@"Enyucados", IMAGE_NAME_KEY:@"Enyucados"},
            nil];
}


+(void) createFoodsWithTypesName:(NSString*)typeName foodName:(NSString*)foodName image:(NSString*)image{
    Type *typeSelected = [self getTypeWithName:typeName];
    Food *food = [Food new];
    food.FoodName = foodName;
    food.type = typeSelected;
    food.Image = image;
    [self insertObjectInDB:food];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [typeSelected.food addObject:food];
    [realm commitWriteTransaction];
}


/*** DETAILS ***/

+(Detail*)getDetailsWithFoodName:(NSString*)foodName{
    Detail *detail = [self getDetailWithName:foodName];
    return detail;
}

+(Detail*)getDetailWithName:(NSString*)foodName{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"FoodName =%@",foodName];
    RLMResults<Detail *> *detail = [Detail objectsWithPredicate:predicate];
    if(detail.count>0){
        return detail.firstObject;
    }
    return nil;
}
+(void)createDefaultDetails{
    NSArray *detailsArray = [self createDetailDictionary];
    for (NSDictionary *detailDictionary in detailsArray) {
        [self createDetailWithFoodName:[detailDictionary valueForKey:FOOD_NAME_KEY] history:[detailDictionary valueForKey:HISTORY_KEY] recipe:[detailDictionary valueForKey:RECIPE_KEY] ingredient:[detailDictionary valueForKey:INGREDIENT_KEY] image:[detailDictionary valueForKey:IMAGE_NAME_KEY]];
    }
}
+(NSArray*)createDetailDictionary{
    return [[NSArray alloc] initWithObjects:
            @{IMAGE_NAME_KEY :@"Pinto", FOOD_NAME_KEY:@"Pinto",HISTORY_KEY:@"Historia del Pinto", RECIPE_KEY:@"Receta del Pinto",INGREDIENT_KEY:@"Ingredientes del Pinto"},
            @{IMAGE_NAME_KEY :@"Fruta",FOOD_NAME_KEY:@"Frutas",HISTORY_KEY:@"Historia del Frutas", RECIPE_KEY:@"Receta del Frutas",INGREDIENT_KEY:@"Ingredientes del Frutas"},
            @{IMAGE_NAME_KEY :@"Cereal",FOOD_NAME_KEY:@"Cereal",HISTORY_KEY:@"Historia del Cereal", RECIPE_KEY:@"Receta del Cereal",INGREDIENT_KEY:@"Ingredientes del Cereal"},
            @{IMAGE_NAME_KEY :@"Chan",FOOD_NAME_KEY:@"Chan",HISTORY_KEY:@"Historia del Chan", RECIPE_KEY:@"Receta del Chan",INGREDIENT_KEY:@"Ingredientes del Chan"},
            @{IMAGE_NAME_KEY :@"Banano",FOOD_NAME_KEY:@"Banano",HISTORY_KEY:@"Historia del Banano", RECIPE_KEY:@"Receta del Banano",INGREDIENT_KEY:@"Ingredientes del Banano"},
            @{IMAGE_NAME_KEY :@"Frutas",FOOD_NAME_KEY:@"Frutas",HISTORY_KEY:@"Historia del Frutas", RECIPE_KEY:@"Receta del Frutas",INGREDIENT_KEY:@"Ingredientes del Frutas"},
            @{IMAGE_NAME_KEY :@"Casado",FOOD_NAME_KEY:@"Casado",HISTORY_KEY:@"Historia del Casado", RECIPE_KEY:@"Receta del Casado",INGREDIENT_KEY:@"Ingredientes del Casado"},
            @{IMAGE_NAME_KEY :@"Camarones",FOOD_NAME_KEY:@"Camarones",HISTORY_KEY:@"Historia del Camarones", RECIPE_KEY:@"Receta del Camarones",INGREDIENT_KEY:@"Ingredientes del Camarones"},
            @{IMAGE_NAME_KEY :@"Pescado",FOOD_NAME_KEY:@"Pescado entero",HISTORY_KEY:@"Historia del Pescado entero", RECIPE_KEY:@"Receta del Pescado entero",INGREDIENT_KEY:@"Ingredientes del Pescado entero"},
            @{IMAGE_NAME_KEY :@"Chifrijo",FOOD_NAME_KEY:@"Chifrijo",HISTORY_KEY:@"Historia del Chifrijo", RECIPE_KEY:@"Receta del Chifrijo",INGREDIENT_KEY:@"Ingredientes del Chifrijo"},
            @{IMAGE_NAME_KEY :@"Alitas",FOOD_NAME_KEY:@"Alitas",HISTORY_KEY:@"Historia del Alitas", RECIPE_KEY:@"Receta del Alitas",INGREDIENT_KEY:@"Ingredientes del Alitas"},
            @{IMAGE_NAME_KEY :@"Enyucados",FOOD_NAME_KEY:@"Enyucados",HISTORY_KEY:@"Historia del Enyucados", RECIPE_KEY:@"Receta del Enyucados",INGREDIENT_KEY:@"Ingredientes del Enyucados"},
            nil];
}


+(void) createDetailWithFoodName:(NSString*)foodName history:(NSString*)history recipe:(NSString*)recipe ingredient:(NSString*)ingredient image:(NSString*)image {
    Detail *detail = [Detail new];
    detail.FoodName = foodName;
    detail.History = history;
    detail.Recipe = recipe;
    detail.Ingredient = ingredient;
    detail.Image = image;
    [self insertObjectInDB:detail];
}



@end
