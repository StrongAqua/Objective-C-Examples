//
//  CollectionViewCell.h
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import <UIKit/UIKit.h>
#import "PhotoForCollectionView.h"

@interface CustomViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView* pictureView;

- (void) configWithPhoto: (PhotoForCollectionView*) photoForCollectionView;

@end

