//
//  EditorViewController.m
//  Every.Do it Again
//
//  Created by Cody Zazulak on 2015-07-20.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import "EditorViewController.h"
#import "MasterViewController.h"
#import "ListItem.h"

@interface EditorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
- (IBAction)saveButtonPressed:(UIButton *)sender;

@end

@implementation EditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(UIButton *)sender {
    if([self.titleTextField isFirstResponder]){
        [self.titleTextField resignFirstResponder];
    }
    if([self.descriptionTextField isFirstResponder]){
        [self.descriptionTextField resignFirstResponder];
    }
    
    self.listItem.name = self.titleTextField.text;
    self.listItem.itemDescription = self.descriptionTextField.text;
    
    NSLog(@"Title: %@", self.titleTextField.text);
    NSLog(@"Desc: %@", self.descriptionTextField.text);
    
    NSError *error = nil;
    if (![self.listItem.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
}

@end
