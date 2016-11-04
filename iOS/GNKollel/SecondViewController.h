//
//  SecondViewController.h
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIWebViewDelegate,NSURLConnectionDelegate>{
    
    NSMutableData *responseData;
    
}


@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

