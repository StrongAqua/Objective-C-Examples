//
//  ViewController.m
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "Student.h"

@interface ViewController () <UITableViewDataSource>
@property (strong, nonnull) NSMutableArray *students;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *student1 = [[Student alloc] initWithName: @"Tom" andAge: 20];
    Student *student2 = [[Student alloc] initWithName: @"Olga" andAge: 21];
    Student *student3 = [[Student alloc] initWithName: @"Alex" andAge: 22];
    Student *student4 = [[Student alloc] initWithName: @"Sam" andAge: 23];
    
    self.students = [[NSMutableArray alloc] initWithObjects:student1, student2, student3, student4, nil];
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];

    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    [cell configWithStudent: self.students[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.students removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
