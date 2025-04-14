#import <Foundation/Foundation.h>
#import "Post.h"
#import "APIService.h"

@interface PostsViewModel : NSObject

@property (nonatomic, strong) NSArray<Post *> *allPosts;
@property (nonatomic, strong) NSArray<Post *> *filteredPosts;

- (void)fetchPosts:(void (^)(void))completion;
- (void)filterPostsWithSearchText:(NSString *)searchText;
- (NSInteger)numberOfPosts;
- (Post *)postAtIndex:(NSInteger)index;

@end
