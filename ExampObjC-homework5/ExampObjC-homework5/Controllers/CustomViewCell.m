//
//  CollectionViewCell.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import "CustomViewCell.h"
#import "PhotoForCollectionView.h"

@implementation CustomViewCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pictureView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.pictureView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.pictureView.clipsToBounds = YES;
        self.pictureView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.pictureView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (void) configWithPhoto:(PhotoForCollectionView *)photoForCollectionView
{
    self.titleLabel.text = [NSString stringWithFormat:@"%@", photoForCollectionView.name];
    self.pictureView.image = [UIImage imageNamed: photoForCollectionView.photo];
}


@end
