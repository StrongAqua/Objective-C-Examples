//
//  ViewController.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import "ViewController.h"
#import "CustomViewCell.h"
#import "PhotoForCollectionView.h"
#import "ResultsViewController.h"

@interface ViewController() <UISearchResultsUpdating>

@property (strong, nonnull) NSArray *photos;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultsViewController *resultsViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultsViewController = [[ResultsViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsViewController];
    self.searchController.searchResultsUpdater = self;
    
    self.navigationItem.searchController = self.searchController;
    
    PhotoForCollectionView *photoForCollectionView1 = [[PhotoForCollectionView alloc] initWithName:@"mountain" andPhoto:@"photo1"];
    PhotoForCollectionView *photoForCollectionView2 = [[PhotoForCollectionView alloc] initWithName:@"lake" andPhoto:@"photo2"];
    PhotoForCollectionView *photoForCollectionView3 = [[PhotoForCollectionView alloc] initWithName:@"giraffe" andPhoto:@"photo3"];
    PhotoForCollectionView *photoForCollectionView4 = [[PhotoForCollectionView alloc] initWithName:@"weather" andPhoto:@"photo4"];
    
    self.photos = [[NSArray alloc] initWithObjects: photoForCollectionView1, photoForCollectionView2, photoForCollectionView3, photoForCollectionView4, nil];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(200.0, 200.0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CustomViewCell class] forCellWithReuseIdentifier: @"CustomViewCell"];
    
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"CustomViewCell" forIndexPath:indexPath];
    [cell configWithPhoto: self.photos[indexPath.row]];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", searchController.searchBar.text];
        self.resultsViewController.results = [self.photos filteredArrayUsingPredicate:predicate];
        [self.resultsViewController update];
        
    }
}

@end
