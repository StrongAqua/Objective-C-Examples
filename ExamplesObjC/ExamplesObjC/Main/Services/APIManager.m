//
//  APIManager.m
//  ExamplesObjC
//
//  Created by aprirez on 3/10/21.
//

#import "APIManager.h"
#import "Article.h"

#define API_URL @"https://newsapi.org/v2/top-headlines"
#define API_TOKEN @"243c979c6ee74270bd6eb5f3b39fa381"

@implementation APIManager

+ (instancetype)sharedInstance {
    static APIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[APIManager alloc] init];
    });
    return instance;
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // TODO: UI completion
        });
        completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
    }] resume] ;
}

- (void)newsWithCompletion:(void (^)(NSArray *news))completion {
    NSString *urlString = [NSString stringWithFormat:@"%@?country=ru&apiKey=%@", API_URL, API_TOKEN];
    [self load:urlString withCompletion:^(id _Nullable result) {
        NSDictionary *response = result;
        if (response) {
            NSArray* articles = [response valueForKey:@"articles"];
            NSMutableArray *parsedArticles = [NSMutableArray new];
            for (NSDictionary* article in articles) {
                Article* art = [[Article alloc] initWithDictionary:article];
                NSString* title = [article valueForKey:@"title"];
                NSString* body = [article valueForKey:@"description"];
                NSString* pictureView = [article valueForKey:@"urlToImage"];
                NSLog(@"Title: %@\n Body: %@\n Picture: %@\n", title, body, pictureView);
                [parsedArticles addObject: art];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(parsedArticles);
            });
        }
    }];
}

@end
