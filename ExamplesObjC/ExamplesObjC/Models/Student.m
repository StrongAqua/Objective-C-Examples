//
//  Student.m
//  ExamplesObjC
//
//  Created by aprirez on 3/7/21.
//

#import "Student.h"

@interface Student ()
@property (nonatomic, readwrite) NSInteger age;
@property (nonatomic, readwrite, strong) NSString* name;
@end

@implementation Student

@synthesize name;
@synthesize age;

-(id) initWithName:(NSString *)name
            andAge:(NSInteger)age
{
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
    }
    return self;
}

+(instancetype) studentWithName:(NSString *)name
                         andAge:(NSInteger)age
{
    Student *student = [[Student alloc]
                        initWithName:name
                        andAge:age
                        ];
    return student;
}


@end
