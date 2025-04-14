#import <Foundation/Foundation.h>
#import "Post.h"

@interface APIService : NSObject

- (void)fetchPosts:(void (^)(NSArray<Post *> *posts))completion;

@end
