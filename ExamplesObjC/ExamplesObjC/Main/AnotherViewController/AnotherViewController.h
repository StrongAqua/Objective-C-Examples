//
//  AnotherViewController.h
//  ExamplesObjC
//
//  Created by aprirez on 3/10/21.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface AnotherViewController : UIViewController

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView* pictureView;
@property (nonatomic, strong) UILabel *bodyLabel;

- (void) configWithArticle: (Article*) article;


@end

