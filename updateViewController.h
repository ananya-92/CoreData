//
//  updateViewController.h
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 03/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface updateViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtid;
@property (strong, nonatomic) IBOutlet UITextField *txtname;
@property NSManagedObjectContext *context;

- (IBAction)btnUpdate:(id)sender;

@end
