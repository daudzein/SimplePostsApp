#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger postId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
