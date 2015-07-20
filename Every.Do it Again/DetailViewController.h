//
//  DetailViewController.h
//  Every.Do it Again
//
//  Created by Cody Zazulak on 2015-07-20.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ListItem *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *itemPriorityLabel;

@property (weak, nonatomic) IBOutlet UILabel *itemCompletedLabel;

@end

