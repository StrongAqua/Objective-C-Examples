//
//  AnotherViewController.m
//  ExamplesObjC
//
//  Created by aprirez on 3/10/21.
//

#import "AnotherViewController.h"
#import <YYWebImage/YYWebImage.h>

@interface AnotherViewController ()

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


-(void)configWithArticle:(Article *) article {
    
    _pictureView = [[UIImageView alloc] initWithFrame: CGRectMake(30, 90, [UIScreen mainScreen].bounds.size.width - 80.0, 200)];
    _pictureView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_pictureView];
    
    if (![article.pictureView isEqual:[NSNull null]]) {
        NSURL *pictureURL = [NSURL URLWithString:article.pictureView];
        [_pictureView yy_setImageWithURL:pictureURL options:YYWebImageOptionSetImageWithFadeAnimation];
    }
    
    _titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(30, CGRectGetMaxY(_pictureView.frame), [UIScreen mainScreen].bounds.size.width - 80.0, 200)];
    _titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 4;
    _titleLabel.textColor = [UIColor darkGrayColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = [NSString stringWithFormat:@"%@", article.title];
    [self.view addSubview: _titleLabel];

    if (![article.body isEqual:[NSNull null]]) {
        _bodyLabel = [[UILabel alloc] initWithFrame: CGRectMake(30, CGRectGetMaxY(_titleLabel.frame), [UIScreen mainScreen].bounds.size.width - 80.0, 200)];
        _bodyLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightBold];
        _bodyLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _bodyLabel.numberOfLines = 10;
        _bodyLabel.textColor = [UIColor darkGrayColor];
        //_bodyLabel.textAlignment = NSTextAlignmentCenter;
        _bodyLabel.text = [NSString stringWithFormat:@"%@", article.body];
        [self.view addSubview: _bodyLabel];
    }
    
}

    @end
    
