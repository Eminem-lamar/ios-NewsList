//
//  NewsTableViewCell.h
//  newsList_week1demo
//
//  Created by waychen on 2025/9/9.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell
@property (nonatomic, strong) NewsModel *model;
@end

NS_ASSUME_NONNULL_END
