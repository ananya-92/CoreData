//
//  delViewController.h
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 07/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface delViewController : UIViewController
- (IBAction)btndel:(id)sender;
@property NSManagedObjectContext *context;
@property (strong, nonatomic) IBOutlet UITextField *textname;
- (IBAction)btndelAll:(id)sender;

@end
