//
//  FourthViewController.m
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor= [UIColor whiteColor];
    self.navigationController.navigationBar.translucent= NO;
    
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
    titleView.text = @"Mishkan Torah";
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
    
    UIBarButtonItem *leftItem =  [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"❮",nil) style:UIBarButtonItemStylePlain target:self action:@selector(onBack)];
    [[self navigationItem] setLeftBarButtonItem:leftItem];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.88 green:0.79 blue:0.61 alpha:1.0]];
    
    _webView.delegate=self;
    

    
    NSString *embedHTML = [NSString stringWithFormat: @"\
                           <div i style=\"padding-top:0px;\">\
                           <iframe src=\"https://docs.google.com/document/d/1t22RTWiVOYQxBY1_Xi4Zripyj_XT0qjayv9VvQX-pTg/pub?embedded=true\" width=\"%f\" height=\"400\" frameBorder=\"0\"></iframe></p></div>", CGRectGetWidth(self.view.frame)];
    
    [_webView loadHTMLString: embedHTML baseURL:nil];
   // _webView.scalesPageToFit= YES;
    [self.view addSubview:_webView];
    
}

- (void)onBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)viewDidAppear:(BOOL)animated
{
    CGRect webviewFrame = _webView.frame;
    webviewFrame.size.width = CGRectGetWidth(self.view.frame);
    webviewFrame.size.height = CGRectGetHeight(self.view.frame);
    //    webviewFrame.size.height = CGRectGetHeight(self.view.frame);
    _webView.frame = webviewFrame;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [_webView.scrollView setContentSize: CGSizeMake(webView.frame.size.width, webView.scrollView.contentSize.height)];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
