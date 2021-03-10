//
//  CustomTableViewCell.m
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import "CustomTableViewCell.h"
#import <YYWebImage/YYWebImage.h>

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
        self.contentView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        self.contentView.layer.shadowRadius = 10.0;
        self.contentView.layer.shadowOpacity = 1.0;
        self.contentView.layer.cornerRadius = 6.0;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightBold];
        [self.contentView addSubview:_titleLabel];
        
        _pictureView = [[UIImageView alloc] initWithFrame:self.bounds];
        _pictureView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_pictureView];
        
        _bodyLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _bodyLabel.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightLight];
        _bodyLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_bodyLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(10.0, 10.0, [UIScreen mainScreen].bounds.size.width - 20.0, self.frame.size.height - 20.0);
    _titleLabel.frame = CGRectMake(10.0, 10.0, self.contentView.frame.size.width - 110.0, 60.0);
    _pictureView.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 10.0, 10.0, 80.0, 80.0);
    _bodyLabel.frame = CGRectMake(10.0, CGRectGetMaxY(_titleLabel.frame) + 16.0, 150.0, 20.0);
    
}


- (void)configWithArticle: (Article*) article
{
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.numberOfLines = 4;
    self.titleLabel.text = [NSString stringWithFormat:@"%@", article.title];
    
    self.bodyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.bodyLabel.numberOfLines = 2;
    
    if (![article.body isEqual:[NSNull null]]) {
        self.bodyLabel.text = [NSString stringWithFormat:@"%@", article.body];
    }
    
    if (![article.pictureView isEqual:[NSNull null]]) {
        NSURL *pictureURL = [NSURL URLWithString:article.pictureView];
        [_pictureView yy_setImageWithURL:pictureURL options:YYWebImageOptionSetImageWithFadeAnimation];
    }
}

@end
