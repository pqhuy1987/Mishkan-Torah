//
//  FourthViewController.h
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController<UIWebViewDelegate,NSURLConnectionDelegate>{
    
    NSMutableData *responseData;
    
}

@property (assign, nonatomic) IBOutlet UIWebView *webView;

@end
