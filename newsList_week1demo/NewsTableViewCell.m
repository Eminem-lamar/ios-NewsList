//
//  NewsTableViewCell.m
//  newsList_week1demo
//
//  Created by waychen on 2025/9/9.
//

#import "NewsTableViewCell.h"
#import "NewsModel.h"
#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsTableViewCell ()
@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *summaryLabel;
@end

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.newsImageView = [[UIImageView alloc] init];
    self.newsImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.newsImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.newsImageView];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.titleLabel.numberOfLines = 2;
    [self.contentView addSubview:self.titleLabel];

    self.summaryLabel = [[UILabel alloc] init];
    self.summaryLabel.font = [UIFont systemFontOfSize:14];
    self.summaryLabel.textColor = [UIColor grayColor];
    self.summaryLabel.numberOfLines = 2;
    [self.contentView addSubview:self.summaryLabel];

    [self.newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 0));
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(80);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImageView.mas_right).offset(10);
        make.top.equalTo(self.newsImageView);
        make.right.equalTo(self.contentView).offset(-10);
    }];

    [self.summaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.bottom.lessThanOrEqualTo(self.newsImageView);
    }];
}

- (void)setModel:(NewsModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.summaryLabel.text = model.summary;
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end

