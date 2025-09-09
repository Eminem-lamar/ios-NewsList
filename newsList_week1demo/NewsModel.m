//
//  NewsModel.m
//  newsList_week1demo
//
//  Created by waychen on 2025/9/8.
//

#import "NewsModel.h"
#import "YYModel.h"
NS_ASSUME_NONNULL_BEGIN

@implementation NewsModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        self.title = dict[@"title"];
        self.summary = dict[@"summary"];
        self.id = dict[@"id"];
        self.image_url = dict[@"image_url"];
    }
    return self;
}
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    if (!dict) return nil;
    NewsModel *m = [[self alloc] init];
    m.title     = dict[@"title"];
    m.summary   = dict[@"summary"];
    m.image_url = dict[@"image_url"];
    m.id   = dict[@"id"];
    return m;
}

+ (NSArray<NewsModel *> *)modelsWithArray:(NSArray<NSDictionary *> *)array {
    if (!array) return nil;
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *d in array) {
        [tmp addObject:[self modelWithDict:d]];
    }
    return tmp.copy;
}

@end

NS_ASSUME_NONNULL_END
