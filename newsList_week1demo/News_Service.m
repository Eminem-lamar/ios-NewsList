//
//  News_Service.m
//  newsList_week1demo
//
//  Created by waychen on 2025/9/9.
//

#import "News_Service.h"
#import <AFNetworking/AFNetworking.h>
#import "NewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation News_Service

+ (void)getNewsList:(void(^)(NSArray<NewsModel *> *newsList, NSError *error))completion {
    NSString *url = @"http://week1.com/list";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [models addObject:[[NewsModel alloc] initWithDict:dict]];
        }
        completion(models.copy, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, error);
    }];
}
@end

NS_ASSUME_NONNULL_END
