//
//  ViewController.m
//  IOSDay22_CoreData
//
//  Created by Student P_10 on 03/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetch];
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.myTableView reloadData];
    [self fetch];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}

-(void)fetch
{
    self.idArray=[[NSArray alloc]init];
    self.nameArray=[[NSArray alloc]init];
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context=delegate.persistentContainer.viewContext;
    NSError *error;
    NSEntityDescription *edescription=[NSEntityDescription entityForName:@"ItemTable" inManagedObjectContext:self.context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:edescription];
    
    self.allArray=[self.context executeFetchRequest:request error:&error];
    
    if(self.allArray.count>0)
    {
        self.nameArray=[self.allArray valueForKey:@"itemName"];
        self.idArray=[self.allArray valueForKey:@"itemId"];
    }
    [self.myTableView reloadData];
    NSLog(@"is :%@    name :%@",self.idArray,self.nameArray);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    id ID=[self.idArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=[NSString stringWithFormat:@"%@",ID];
    cell.detailTextLabel.text=[self.nameArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnInsert:(id)sender
{
    insertViewController *ivc=[self.storyboard instantiateViewControllerWithIdentifier:@"insertViewController"];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)btnUpdate:(id)sender
{
    updateViewController *uvc=[self.storyboard instantiateViewControllerWithIdentifier:@"updateViewController"];
    [self.navigationController pushViewController:uvc animated:YES];
}
- (IBAction)btnDelete:(id)sender
{
  
    delViewController *dvc=[self.storyboard instantiateViewControllerWithIdentifier:@"delViewController"];
    [self.navigationController pushViewController:dvc animated:YES];
    
}
@end
