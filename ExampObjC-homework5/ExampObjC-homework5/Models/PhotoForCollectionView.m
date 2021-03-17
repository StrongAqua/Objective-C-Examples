//
//  PhotoForCollectionView.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import "PhotoForCollectionView.h"

@interface PhotoForCollectionView ()
@property (nonatomic, readwrite, strong) NSString* name;
@property (nonatomic, readwrite, strong) NSString* photo;
@end

@implementation PhotoForCollectionView

@synthesize name;
@synthesize photo;

-(id) initWithName:(NSString *)name
          andPhoto:(NSString *)photo
{
    self = [super init];
    if (self) {
        self.name = name;
        self.photo = photo;
    }
    return self;
}

+(instancetype) photoWithName:(NSString *)name
                     andPhoto:(NSString *)photo
{
    PhotoForCollectionView *photoForCollectionView = [[PhotoForCollectionView alloc]
                                                      initWithName:name
                                                      andPhoto:photo
                                                      ];
    return photoForCollectionView;
}

@end
