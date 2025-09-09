//
//  main.m
//  newsList_week1demo
//
//  Created by waychen on 2025/9/2.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <AFNetworking/AFNetworking.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
