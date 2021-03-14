//
//  Student.h
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, readonly, strong) NSString *name;
@property (nonatomic, readonly) NSInteger age;

-(id) initWithName:(NSString*)name
            andAge:(NSInteger)age;


@end

NS_ASSUME_NONNULL_END
