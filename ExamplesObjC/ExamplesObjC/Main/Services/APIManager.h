//
//  APIManager.h
//  ExamplesObjC
//
//  Created by aprirez on 3/10/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void) newsWithCompletion : (void(^)(NSArray *article))completion;

@end

NS_ASSUME_NONNULL_END
