//
//  PhotoForCollectionView.h
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import <Foundation/Foundation.h>

@interface PhotoForCollectionView : NSObject

@property (nonatomic, readonly, strong) NSString *name;
@property (nonatomic, readonly) NSString *photo;

-(id) initWithName:(NSString*)name
          andPhoto:(NSString*)photo;


@end

