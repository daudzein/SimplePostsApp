#import "PostsViewController.h"
#import "PostsViewModel.h"
#import "PostDetailViewController.h"

@interface PostsViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) PostsViewModel *viewModel;

@end

@implementation PostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Posts";
    self.view.backgroundColor = [UIColor whiteColor];

    self.viewModel = [[PostsViewModel alloc] init];

    [self setupSearchBar];
    [self setupTableView];

    [self.viewModel fetchPosts:^{
        [self.tableView reloadData];
    }];
}

- (void)setupSearchBar {
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"Search title";
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfPosts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"PostCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }

    Post *post = [self.viewModel postAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"#%ld %@", (long)post.postId, post.title];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Post *selectedPost = [self.viewModel postAtIndex:indexPath.row];
    PostDetailViewController *detailVC = [[PostDetailViewController alloc] initWithPost:selectedPost];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.viewModel filterPostsWithSearchText:searchText];
    [self.tableView reloadData];
}

@end
