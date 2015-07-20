//
//  DetailViewController.m
//  Every.Do it Again
//
//  Created by Cody Zazulak on 2015-07-20.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import "DetailViewController.h"
#import "EditorViewController.h"
#import "ListItem.h"

@interface DetailViewController ()
- (IBAction)stepperPressed:(UIStepper *)sender;
- (IBAction)switchTapped:(UISwitch *)sender;

@property(nonatomic) int priorityText;
@property(nonatomic) NSString *completedText;
@property(nonatomic) NSNumber *value;

@property (weak, nonatomic) IBOutlet UIStepper *stepperValue;
@property (weak, nonatomic) IBOutlet UISwitch *switchValue;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.itemTitleLabel.text = [[self.detailItem valueForKey:@"name"] description];
        self.itemDescriptionLabel.text = [[self.detailItem valueForKey:@"itemDescription"] description];
        
        if ([[self.detailItem valueForKey:@"priority"] intValue] == 0) {
            self.priorityText = 1;
        } else {
            self.priorityText = [[self.detailItem valueForKey:@"priority"] intValue];
        }
        self.stepperValue.value = self.priorityText;
        self.itemPriorityLabel.text = [NSString stringWithFormat:@"Priority: %i", self.priorityText];
        
        if ([[self.detailItem valueForKey:@"completed"] isEqualToString:@"No"]) {
            self.completedText = @"No";
            self.switchValue.on = NO;
        } else {
            self.itemCompletedLabel.text = [NSString stringWithFormat:@"Completed: %@", self.completedText];
            self.switchValue.on = YES;
        }
        NSLog(@"Is on: %@", self.completedText);
        self.itemCompletedLabel.text = [NSString stringWithFormat:@"Completed: %@", self.completedText];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    NSLog(@"Switch Value: %i", self.switchValue.isOn);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.itemTitleLabel.text = [[self.detailItem valueForKey:@"name"] description];
    self.itemDescriptionLabel.text = [[self.detailItem valueForKey:@"itemDescription"] description];
}

- (IBAction)stepperPressed:(UIStepper *)sender {
    NSNumber *value = [NSNumber numberWithDouble:[sender value]];
    self.detailItem.priority = value;
    
    self.itemPriorityLabel.text = [NSString stringWithFormat:@"Priority: %d", [value intValue]];
    NSError *error = nil;
    if (![self.detailItem.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (IBAction)switchTapped:(UISwitch *)sender {
    NSNumber *value = [NSNumber numberWithDouble:[sender isOn]];
    NSLog(@"Value: %@", value);
    if ([value intValue] == 1) {
        self.completedText = @"Yes";
        self.detailItem.completed = self.completedText;
        self.itemCompletedLabel.text = [NSString stringWithFormat:@"Completed: %@",self.completedText];
    } else {
        self.completedText = @"No";
        self.detailItem.completed = self.completedText;
        self.itemCompletedLabel.text = [NSString stringWithFormat:@"Completed: %@",self.completedText];
    }
    
    
    NSError *error = nil;
    if (![self.detailItem.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"editorSegue"]) {
        EditorViewController *vc = segue.destinationViewController;
        vc.listItem = self.detailItem;
    }
}

@end
