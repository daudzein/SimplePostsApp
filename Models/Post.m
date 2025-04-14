#import "Post.h"

@implementation Post

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _userId = [dict[@"userId"] integerValue];
        _postId = [dict[@"id"] integerValue];
        _title = dict[@"title"] ?: @"";
        _body = dict[@"body"] ?: @"";
    }
    return self;
}

@end
