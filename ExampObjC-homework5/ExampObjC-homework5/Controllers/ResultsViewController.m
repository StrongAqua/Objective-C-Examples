//
//  ResultsViewController.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import "ResultsViewController.h"
#import "CustomViewCell.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)update {
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(200.0, 200.0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CustomViewCell class] forCellWithReuseIdentifier: @"CustomViewCell"];
    
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.results.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"CustomViewCell" forIndexPath:indexPath];
    [cell configWithPhoto: self.results[indexPath.row]];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

@end
