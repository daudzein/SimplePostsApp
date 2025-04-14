#import "APIService.h"

@implementation APIService

- (void)fetchPosts:(void (^)(NSArray<Post *> *posts))completion {
    NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/posts"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching posts: %@", error.localizedDescription);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(@[]);
            });
            return;
        }

        NSError *jsonError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (!jsonArray || jsonError) {
            NSLog(@"JSON error: %@", jsonError.localizedDescription);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(@[]);
            });
            return;
        }

        NSMutableArray<Post *> *posts = [NSMutableArray array];
        for (NSDictionary *dict in jsonArray) {
            Post *post = [[Post alloc] initWithDictionary:dict];
            [posts addObject:post];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            completion(posts);
        });
    }];
    [task resume];
}

@end
