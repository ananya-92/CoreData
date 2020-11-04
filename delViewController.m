//
//  delViewController.m
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 07/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "delViewController.h"

@interface delViewController ()

@end

@implementation delViewController

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

- (IBAction)btndel:(id)sender
{
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context=delegate.persistentContainer.viewContext;
    NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
    f.numberStyle=NSNumberFormatterDecimalStyle;
    NSNumber *myNumber=[f numberFromString:self.textname.text];
    NSPredicate *namePredicate=[NSPredicate predicateWithFormat:@"(itemId contains[cd] %@)",myNumber];
    NSError *error;
    NSManagedObject *myobject;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"ItemTable" inManagedObjectContext:self.context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    [request setPredicate:namePredicate];
    NSArray *allObjects=[self.context executeFetchRequest:request error:&error];
    if(allObjects.count>=1)
    {
        myobject=[allObjects firstObject];
        [self.context deleteObject:myobject];
        [self.context save:&error];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Deletion Failed");
    }
}
- (IBAction)btndelAll:(id)sender
{
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context=delegate.persistentContainer.viewContext;
//    NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
//    f.numberStyle=NSNumberFormatterDecimalStyle;
//    NSNumber *myNumber=[f numberFromString:self.textname.text];
    //NSPredicate *namePredicate=[NSPredicate predicateWithFormat:@"(itemId contains[cd] %@)",myNumber];
    NSError *error;
    //NSManagedObject *myobject;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"ItemTable" inManagedObjectContext:self.context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    //[request setPredicate:namePredicate];
    NSArray *allObjects=[self.context executeFetchRequest:request error:&error];
    for (NSManagedObject *object in allObjects)
    {
        [self.context deleteObject:object];
    }
    NSLog(@"Deleted All Objects !!!");
    [self.navigationController popViewControllerAnimated:YES];

}
@end
