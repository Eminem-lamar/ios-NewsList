//
//  ViewController.m
//  newsList_week1demo
//
//  Created by waychen on 2025/9/2.
//

#import "ViewController.h"
#import "NewsModel.h"
#import <Masonry/Masonry.h>
#import "NewsTableViewCell.h"
#import <YYModel/YYModel.h>


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray<NewsModel *> *newsList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"新闻列表";
    
    [self setupTableView];
    [self loadData];
}
- (void)setupTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"NewsCell"];
    [self.view addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)loadData {
    //先用返回数据试试
    NSArray *fakeDictArray = @[
            @{
                @"title":   @"发布一箭11星，我国成功发射吉利星座05组卫星",
                @"summary": @"2025年9月9日，我国太原卫星发射中心在山东日照附近海域使用捷龙三号运载火箭，成功将吉利星座05组卫星发射升空，卫星顺利进入预定轨道，发射任务获得圆满成功",
                @"image_url": @"https://n.sinaimg.cn/news/1_img/upload/d8010f78/213/w2048h1365/20250909/b90a-719eda50dba865b4c1509997bef88093.jpg",
                @"id": @"1001"
            },
            @{
                @"title":   @"政治豪赌失败！法国总理贝鲁下台",
                @"summary": @"当地时间9月8日晚（北京时间9日凌晨），法国总理贝鲁领导的政府在法国国民议会（议会下院）举行的信任投票中未能过关。",
                @"image_url": @"https://k.sinaimg.cn/n/sinakd20250909s/200/w1080h720/20250909/a85a-35b758eb30d54660166c4d35f66eac9a.jpg/w700d1q75cms.jpg?by=cms_fixed_width",
                @"id": @"1002"
            },
            @{
                @"title":   @"中俄蒙举行“边防合作-2025”联合演练",
                @"summary": @"9月8日至9日，中俄蒙以“联合防范打击边境地区恐怖破坏活动”为课题，在中俄蒙边境某区域组织“边防合作-2025”联合演练，这是三方首次组织边防部队参加联合演习。",
                @"image_url": @"https://k.sinaimg.cn/n/sni/600/w1920h1080/20250909/8fff-1f7f02acaf5b11825c1ef667372a43f7.jpg/w700d1q75cms.jpg?by=cms_fixed_width",
                @"id": @"1003"
            }
        ];
    self.newsList = [NewsModel modelsWithArray:fakeDictArray];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    cell.model = self.newsList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *fruit = self.dataList[indexPath.row];
//    NSLog(@"你点了：%@", fruit);
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
@end
