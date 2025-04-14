#import "PostsViewModel.h"

@implementation PostsViewModel {
    APIService *_apiService;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _apiService = [[APIService alloc] init];
        _allPosts = @[];
        _filteredPosts = @[];
    }
    return self;
}

- (void)fetchPosts:(void (^)(void))completion {
    [_apiService fetchPosts:^(NSArray<Post *> *posts) {
        self.allPosts = posts;
        self.filteredPosts = posts;
        if (completion) {
            completion();
        }
    }];
}

- (void)filterPostsWithSearchText:(NSString *)searchText {
    if (searchText.length == 0) {
        self.filteredPosts = self.allPosts;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS[cd] %@", searchText];
        self.filteredPosts = [self.allPosts filteredArrayUsingPredicate:predicate];
    }
}

- (NSInteger)numberOfPosts {
    return self.filteredPosts.count;
}

- (Post *)postAtIndex:(NSInteger)index {
    if (index < self.filteredPosts.count) {
        return self.filteredPosts[index];
    }
    return nil;
}

@end
