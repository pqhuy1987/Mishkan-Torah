//
//  FirstViewController.m
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import "FirstViewController.h"
#import "MBProgressHUD.h"

@interface FirstViewController (){

    MBProgressHUD *hud;

}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view, typically from a nib.
   //
    
    CGRect headerTitleSubtitleFrame = CGRectMake(0, 0, 200, 44);
    UIView* _headerTitleSubtitleView = [[UILabel alloc] initWithFrame:headerTitleSubtitleFrame];
    _headerTitleSubtitleView.backgroundColor = [UIColor clearColor];
    _headerTitleSubtitleView.autoresizesSubviews = NO;
    
    CGRect titleFrame = CGRectMake(0, 2, 200, 24);
    UILabel *titleView = [[UILabel alloc] initWithFrame:titleFrame];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:20];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.textColor = [UIColor colorWithRed:0.88 green:0.79 blue:0.61 alpha:1.0];
    titleView.shadowColor = [UIColor darkGrayColor];
    titleView.shadowOffset = CGSizeMake(0, -1);
    titleView.text = @"Minyanim";
    titleView.adjustsFontSizeToFitWidth = YES;
    [_headerTitleSubtitleView addSubview:titleView];
    
    CGRect subtitleFrame = CGRectMake(0, 24, 200, 44-24);
    UILabel *subtitleView = [[UILabel alloc] initWithFrame:subtitleFrame];
    subtitleView.backgroundColor = [UIColor clearColor];
    subtitleView.font = [UIFont boldSystemFontOfSize:13];
    subtitleView.textAlignment = NSTextAlignmentCenter;
    subtitleView.textColor = [UIColor colorWithRed:0.88 green:0.79 blue:0.61 alpha:1.0];
    subtitleView.shadowColor = [UIColor darkGrayColor];
    subtitleView.shadowOffset = CGSizeMake(0, -1);
    subtitleView.text = @"Valley Community Kollel";
    subtitleView.adjustsFontSizeToFitWidth = YES;
    [_headerTitleSubtitleView addSubview:subtitleView];
    
    self.navigationItem.titleView = _headerTitleSubtitleView;

    self.navigationController.navigationBar.backgroundColor= [UIColor whiteColor];
    self.navigationController.navigationBar.translucent= NO;
    UIBarButtonItem *leftItem =  [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"❮",nil) style:UIBarButtonItemStylePlain target:self action:@selector(onBack)];
    [[self navigationItem] setLeftBarButtonItem:leftItem];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.88 green:0.79 blue:0.61 alpha:1.0]];
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"Minyamin" ofType:@"html"];
    NSURL *localHTMLURL = [NSURL fileURLWithPath:htmlPath];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:localHTMLURL
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:60];
    
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    [hud showAnimated:YES];

    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
   // [__webView loadRequest:request];

    
}

- (void)onBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) viewDidAppear:(BOOL)animated{

   

}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
   
    
    [hud hideAnimated:YES];
    [__webView loadData:responseData MIMEType:@"text/html" textEncodingName: @"UTF-8" baseURL:nil];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [__webView.scrollView setContentSize: CGSizeMake(webView.frame.size.width, webView.scrollView.contentSize.height)];
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
