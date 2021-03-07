//
//  CustomTableViewCell.m
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
        self.leftLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.leftLabel];
        
        self.rightLabel = [[UILabel alloc] initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
        self.rightLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.rightLabel];
    }
    return self;
}

- (void) configWithStudent: (Student*) student
{
    self.leftLabel.text = [NSString stringWithFormat:@"%@", student.name];
    self.rightLabel.text = [NSString stringWithFormat:@"%ld", student.age];
}

@end
