//
//  NewsModel.h
//  newsList_week1demo
//
//  Created by waychen on 2025/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject
@property (nonatomic,copy) NSString* title;
@property (nonatomic,copy) NSString* id;
@property (nonatomic,copy) NSString* summary;
@property (nonatomic,copy) NSString* image_url;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (NSArray<NewsModel *> *)modelsWithArray:(NSArray<NSDictionary *> *)array;
@end

NS_ASSUME_NONNULL_END
