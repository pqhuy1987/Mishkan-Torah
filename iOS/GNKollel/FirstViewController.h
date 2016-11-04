//
//  FirstViewController.h
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITabBarDelegate, NSURLConnectionDelegate, UIWebViewDelegate>{

    NSMutableData *responseData;

}
@property (weak, nonatomic) IBOutlet UIWebView *_webView;
@property (weak,nonatomic) UITabBar *tabBar;

@end

