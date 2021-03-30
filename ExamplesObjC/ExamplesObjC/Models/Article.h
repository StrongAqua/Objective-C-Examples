//
//  Article.h
//  ExamplesObjC
//
//  Created by aprirez on 3/10/21.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *pictureView;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

