//
//  ViewController.h
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

