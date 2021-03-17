//
//  ResultsViewController.h
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *results;

- (void)update;

@end

