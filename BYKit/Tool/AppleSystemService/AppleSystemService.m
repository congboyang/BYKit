//
//  AppleSystemService.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/20.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "AppleSystemService.h"

@implementation AppleSystemService

+ (void)directPhoneCallWithPhoneNum:(NSString *)phoneNum {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]]];
}

+ (void)phoneCallWithPhoneNum:(NSString *)phoneNum contentView:(UIView *)view {
    
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]]]];
    [view addSubview:callWebview];
}

+ (void)jumpToAppReviewPageWithAppId:(NSString *)appId {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:appId]]];
}

+ (void)sendEmailToAddress:(NSString *)address {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto://" stringByAppendingString:address]]];
}

+ (NSString *)appVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (UIImage *)launchImage {
    
    UIImage               *lauchImage      = nil;
    NSString              *viewOrientation = nil;
    CGSize                 viewSize        = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientation     = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        
        viewOrientation = @"Landscape";
        
    } else {
        
        viewOrientation = @"Portrait";
    }
    
    NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDictionary) {
        
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            
            lauchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    
    return lauchImage;
}

//获取顶层VC

+ (UIViewController*)currentViewController
{
    UIViewController * vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self findBestViewController:vc];
}


+ (UIViewController*)findBestViewController:(UIViewController*)vc
{
    
    if (vc.presentedViewController) {
        return [self findBestViewController:vc.presentedViewController];
    }
    else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
    }
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
    }
    else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController * svc = (UITabBarController *)vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
    }
    else{
        return vc;
    }

}

@end
