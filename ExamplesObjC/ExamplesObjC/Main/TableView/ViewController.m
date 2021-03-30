//
//  ViewController.m
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "Article.h"
#import "APIManager.h"
#import "AnotherViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *articles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [[APIManager sharedInstance] newsWithCompletion:^(NSArray *news) {
        self.articles = news;
        [self.tableView reloadData];
        NSLog(@"News loaded");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];

    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    [cell configWithArticle: self.articles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnotherViewController *anotherViewController = [[AnotherViewController alloc] init];
    [anotherViewController configWithArticle:self.articles[indexPath.row]];
    [self.navigationController pushViewController: anotherViewController animated: YES];
}


@end
