//
//  News_Service.h
//  newsList_week1demo
//
//  Created by waychen on 2025/9/9.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface News_Service : NSObject
+ (void)getNewsList:(void(^)(NSArray<NewsModel *> *newsList, NSError *error))completion;
@end

NS_ASSUME_NONNULL_END
