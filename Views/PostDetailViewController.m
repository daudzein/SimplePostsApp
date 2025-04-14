#import "PostDetailViewController.h"

@interface PostDetailViewController ()

@property (nonatomic, strong) Post *post;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bodyLabel;

@end

@implementation PostDetailViewController

- (instancetype)initWithPost:(Post *)post {
    self = [super init];
    if (self) {
        _post = post;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"Post #%ld", (long)self.post.postId];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
}

- (void)setupViews {
    UILabel *userIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 20)];
    userIdLabel.text = [NSString stringWithFormat:@"User ID: %ld", (long)self.post.userId];

    UILabel *idLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, self.view.bounds.size.width - 40, 20)];
    idLabel.text = [NSString stringWithFormat:@"Post ID: %ld", (long)self.post.postId];

    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, self.view.bounds.size.width - 40, 60)];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.titleLabel.text = self.post.title;

    self.bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 230, self.view.bounds.size.width - 40, 300)];
    self.bodyLabel.numberOfLines = 0;
    self.bodyLabel.text = self.post.body;

    [self.view addSubview:userIdLabel];
    [self.view addSubview:idLabel];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.bodyLabel];
}

@end
