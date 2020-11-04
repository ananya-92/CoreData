//
//  updateViewController.m
//  IOSDay22_CoreData

#import "updateViewController.h"

@interface updateViewController ()

@end

@implementation updateViewController

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

- (IBAction)btnUpdate:(id)sender
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context=delegate.persistentContainer.viewContext;
    NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
    f.numberStyle=NSNumberFormatterDecimalStyle;
    NSNumber *myNumber= [f numberFromString: self.txtid.text];
    NSPredicate *namePredicate=[NSPredicate predicateWithFormat:@"(itemId contains[cd] %@)",myNumber];
    NSError *error;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"ItemTable" inManagedObjectContext:self.context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    [request setPredicate:namePredicate];
    NSArray *allObjects=[self.context executeFetchRequest:request error:&error];
    if(allObjects.count==1)
    {
        NSManagedObject  *myobject=[allObjects firstObject];
        NSString *name,*idnum;
        name=self.txtname.text;
        idnum=self.txtid.text;
        NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
        f.numberStyle=NSNumberFormatterDecimalStyle;
        NSNumber *myNumber= [f numberFromString: self.txtid.text];
        [myobject setValue:name forKey:@"itemName"];
        [myobject setValue:myNumber forKey:@"itemId"];
        [self.context save:&error];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Updation Failed");
    }
}
@end
