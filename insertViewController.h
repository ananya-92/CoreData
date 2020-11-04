//
//  insertViewController.h
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 03/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface insertViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtID;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
- (IBAction)btnSave:(id)sender;
@property NSManagedObjectContext *context;
@end
