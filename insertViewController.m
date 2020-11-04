//
//  insertViewController.m
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 03/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "insertViewController.h"

@interface insertViewController ()

@end

@implementation insertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSave:(id)sender
{
    NSError *error;
    AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    self.context=delegate.persistentContainer.viewContext;
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"ItemTable" inManagedObjectContext:self.context];
    [object setValue:self.txtName.text forKey:@"itemName"];
    NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
    f.numberStyle=NSNumberFormatterDecimalStyle;
    NSNumber *myNumber=[f numberFromString:self.txtID.text];
    [object setValue:myNumber forKey:@"itemId"];
    [self.context save:&error];
    if(error)
    {
        NSLog(@"Error in Insert =%@",error.localizedDescription);
    }
    else
    {
        NSLog(@"YES!!!");
        [self.navigationController popViewControllerAnimated:YES];

    }
    self.txtID.text=@"";
    self.txtName.text=@"";
}
@end
