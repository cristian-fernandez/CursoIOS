//
//  RealmManager.h
//  News
//
//  Created by Cristian Fernandez on 11/26/16.
//  Copyright © 2016 Cristian Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealmManager : NSObject
+(RLMResults*)getAllPersons;
//+(RLMArray*)getNewsWithCategoryName:(NSString*)categoryName;
//+(void) createNewsWithCategoryName:(NSString*)categoryName newsTitle:(NSString*)newsTitle newsDescription:(NSString*)newsDescription;
@end
