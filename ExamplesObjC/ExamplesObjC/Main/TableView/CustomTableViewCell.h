//
//  CustomTableViewCell.h
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import <UIKit/UIKit.h>
#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView* pictureView;
@property (nonatomic, strong) UILabel *bodyLabel;

- (void) configWithArticle: (Article*) article;

@end

NS_ASSUME_NONNULL_END
