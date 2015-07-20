//
//  ListItem.h
//  Every.Do it Again
//
//  Created by Cody Zazulak on 2015-07-20.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ListItem : NSManagedObject

@property (nonatomic, retain) NSString * completed;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * priority;

@end
