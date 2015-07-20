//
//  MasterViewController.h
//  Every.Do it Again
//
//  Created by Cody Zazulak on 2015-07-20.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

