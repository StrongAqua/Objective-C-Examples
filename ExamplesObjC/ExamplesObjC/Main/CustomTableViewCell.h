//
//  CustomTableViewCell.h
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

- (void) configWithStudent: (Student*) student;

@end

NS_ASSUME_NONNULL_END
