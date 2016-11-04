//
//  ThirdViewController.h
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHSTwitterEngine.h"
#import "UIImageView+WebCache.h"

@interface ThirdViewController : UIViewController<FHSTwitterEngineAccessTokenDelegate,UITableViewDataSource,UITableViewDelegate>

{
    
    IBOutlet UITableView *tableView;
    NSMutableArray *parsedItems;
    NSDateFormatter *formatter;
    int count;
    NSDictionary *jsonDict;
    
}
@property(strong,nonatomic)NSString *urlString;
@property(strong,nonatomic)NSString *screenName;
@property(strong,nonatomic) NSMutableArray *tweetsArray;

@end


//@property (weak, nonatomic) IBOutlet UIWebView *webView;

