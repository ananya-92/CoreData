//
//  ViewController.h
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 03/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "insertViewController.h"
#import "updateViewController.h"
#import "delViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)btnInsert:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)btnUpdate:(id)sender;
@property NSArray *idArray,*nameArray,*allArray;
@property NSManagedObjectContext *context;
- (IBAction)btnDelete:(id)sender;

@end

