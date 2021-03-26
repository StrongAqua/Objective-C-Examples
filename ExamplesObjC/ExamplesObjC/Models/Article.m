//
//  Article.m
//  ExamplesObjC
//
//  Created by aprirez on 3/10/21.
//

#import "Article.h"

@implementation Article

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = [dictionary valueForKey:@"title"];
        _body = [dictionary valueForKey:@"description"];
        _pictureView = [dictionary valueForKey:@"urlToImage"];
    }
    return self;
}

@end
