//
//  FiveViewController.m
//  GNKollel
//
//  Created by Mohammad Assad on 2/5/2016.
//  Copyright © 2016 com.example. All rights reserved.
//

#import "FiveViewController.h"

static CGFloat kDefaultMediaHeight = 513.0f;
static CGFloat kDefaultPaddingHeight = 15.0f;

@interface FiveViewController ()

@property (nonatomic, retain) NSMutableDictionary *indexPathsWithMedia;

@end

@implementation FiveViewController

@synthesize urlString,screenName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.tableView.contentInset = UIEdgeInsetsMake(88,0,0,0);
    
    formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    self.navigationController.navigationBar.backgroundColor= [UIColor whiteColor];
    self.navigationController.navigationBar.translucent= NO;
    UIBarButtonItem *leftItem =  [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"❮",nil) style:UIBarButtonItemStylePlain target:self action:@selector(onBack)];
    [[self navigationItem] setLeftBarButtonItem:leftItem];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.88 green:0.79 blue:0.61 alpha:1.0]];
    UIApplication *app = [UIApplication sharedApplication];
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -app.statusBarFrame.size.height, self.view.bounds.size.width, app.statusBarFrame.size.height)];
    statusBarView.backgroundColor = [UIColor blackColor];
    
    self.indexPathsWithMedia = [NSMutableDictionary dictionary];
}

- (void)onBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

/*- (BOOL)prefersStatusBarHidden {
 return YES;
 }*/
-(void)viewWillAppear:(BOOL)animated{
    
    //self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    
    [self preferredStatusBarStyle];
    // [self prefersStatusBarHidden];
    //NSLog(@"%@",[self prefersStatusBarHidden]);
    
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

    [tableView setBackgroundColor:[UIColor lightGrayColor]];
    
    
    [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"O96ApEhFcKdQi5ZuzvMcBaQxK" andSecret:@"CCzRraQpUaukLDOt5Jq11N5sfPPCKrJDEgqUOGC53SMbZBYSp1"];
    [[FHSTwitterEngine sharedEngine]setDelegate:self];
    [[FHSTwitterEngine sharedEngine]loadAccessToken];
    
    
    
    FHSToken *token = [[FHSToken alloc] init];
    
    token.key = @"2609139612-9uDcS2MN8hYZKcNiXAgF8iZnDFuMygSypga1b6F";
    
    token.secret = @"sHXFmHccoiOpnd1cniCq6l8YaRun2s2RnBTOlcDs3Qe8u";
    
    
    [[FHSTwitterEngine sharedEngine]setAccessToken:token];
    
    
    NSArray *tempArray = [[FHSTwitterEngine sharedEngine]getTimelineForUser:@"@VckAds" isID:NO count:100];
    NSLog(@"tempArray is %@",tempArray);
    _tweetsArray = [[NSMutableArray alloc]init];
    
    
    
    //id result;
    for (id result in tempArray) {
        
        [_tweetsArray addObject:result];
        
    }
    
    //NSLog(@"%@",tempArray);
    
    [tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}
#pragma mark - Standard TableView delegates

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _tweetsArray.count;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *) tableView:(UITableView *)tableVieww cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableVieww dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *lblName;
    UILabel *lblScreenName;
    UILabel *lbldate;
    UIImageView *imgVwCell;
    UITextView *lblCell;
    
    UIImageView *imgVwTwitter;
    UIImageView *imgMediaCell;
    
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        imgVwCell = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
        [cell.contentView addSubview:imgVwCell];
        
        imgVwTwitter = [[UIImageView alloc]initWithFrame:CGRectMake(170, 5, 25, 25)];
        [cell.contentView addSubview:imgVwTwitter];
        
        
        imgMediaCell = [[UIImageView alloc]initWithFrame:CGRectMake(50, 5, 30, 30)];
        [cell.contentView addSubview:imgMediaCell];
        
        
        
        lblCell = [[UITextView alloc]init];
        lblCell.backgroundColor = [UIColor clearColor];
        lblCell.font = [UIFont systemFontOfSize:14];
        lblCell.textColor = [UIColor blackColor];
        lblCell.editable = NO;
        lblCell.dataDetectorTypes = UIDataDetectorTypeAll;
        lblCell.scrollEnabled = NO;
        lblCell.userInteractionEnabled = true;
        lblCell.selectable = true;
        
        lblName=[[UILabel alloc]initWithFrame:CGRectMake(40, 0, 250, 20)];
        [cell.contentView addSubview:lblName];
        //[lblName setAdjustsFontSizeToFitWidth:YES];
        [lblName setFont:[UIFont boldSystemFontOfSize:13]];
        [lblName setBackgroundColor:[UIColor clearColor]];
        
        
        
        lblScreenName=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 250,15)];
        [cell.contentView addSubview:lblScreenName];
        // [lblScreenName setAdjustsFontSizeToFitWidth:YES];
        [lblScreenName setFont:[UIFont systemFontOfSize:12]];
        [lblScreenName setBackgroundColor:[UIColor clearColor]];
        
        
        
        
        // [lblCell setAdjustsFontSizeToFitWidth:YES];
        [cell.contentView addSubview:lblCell];
        [lblCell setBackgroundColor:[UIColor clearColor]];
        lblCell.font=[UIFont systemFontOfSize:14];
        
        cell.backgroundColor = [UIColor clearColor];
        
        
        lbldate = [[UILabel alloc]init];
        lbldate.backgroundColor = [UIColor clearColor];
        lbldate.font = [UIFont systemFontOfSize:11];
        lbldate.numberOfLines = 1;
        lbldate.textColor = [UIColor blackColor];
        [cell.contentView addSubview:lbldate];
        lbldate.lineBreakMode=NSLineBreakByCharWrapping;
        
        
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    imgMediaCell.hidden = YES;
    
    
    
    
    [imgVwCell sd_setImageWithURL:[NSURL URLWithString:[[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"user"]valueForKey:@"profile_image_url_https"]]
                 placeholderImage:[UIImage imageNamed:@"placeholder"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    
    
    
    // [ imgVwTwitter setImage:[UIImage imageNamed:@"twitter_logo.png"]];
    
    
    lblName.text = [[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"user"]valueForKey:@"name"];
    
    lblScreenName.text = [NSString stringWithFormat:@"@%@",[[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"user"]valueForKey:@"screen_name"]];
    
    
    NSString *str=[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"text"];
    
    CGSize size= [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(self.view.bounds.size.width - 30, 9999) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    
    
    CGFloat height = size.height;
    
    lblCell.frame=CGRectMake(10, 38, self.view.bounds.size.width - 30, height+20);
    
    lblCell.text = [[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"text"];
    
    //reset for image
    height = 0;
    //find media here
    BOOL hasMedia = NO;
    NSDictionary *tweet = [self.tweetsArray objectAtIndex:indexPath.row];
    
    NSDictionary *entities = [tweet valueForKey:@"entities"];
    NSArray *media = [entities valueForKey:@"media"];
    /// use thumb as default https://dev.twitter.com/overview/api/entities-in-twitter-objects#media
    if (media.count > 0) {
        
        /// just the first media at this time
        NSDictionary *mediaEntry = [media objectAtIndex: 0];
        
        NSString *mediaUrlRaw = [mediaEntry valueForKey:@"media_url_https"];
        if (mediaUrlRaw.length > 0) {
            //
            NSString *mediarUrlThumbRaw = [NSString stringWithFormat: @"%@:small", mediaUrlRaw];
            
            NSURL *mediaUrlThumbRaw = [NSURL URLWithString: mediarUrlThumbRaw];
            
            //            [imgMediaCell sd_setImageWithURL: mediaUrlThumbRaw
            //                            placeholderImage: [UIImage imageNamed:@"placeholder"]
            //                                     options: indexPath.row == 0 ? SDWebImageRefreshCached : 0];
            
            [imgMediaCell sd_setImageWithURL: mediaUrlThumbRaw
                            placeholderImage: [UIImage imageNamed:@"placeholder"]
                                     options: indexPath.row == 0 ? SDWebImageRefreshCached : 0
                                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                       
                                       if ([self.indexPathsWithMedia objectForKey: indexPath] == nil) {
                                           
                                           CGSize imgSize = image.size;
                                           
                                           CGFloat imgMediaCellAspectRatio = imgSize.width/imgSize.height;
                                           
                                           CGSize newImgSize = imgSize;
                                           newImgSize.width = CGRectGetWidth(cell.frame) - 10;
                                           
                                           //calc height
                                           newImgSize.height = newImgSize.width/imgMediaCellAspectRatio;
                                           
                                           CGFloat height1 = CGRectGetHeight(lblCell.frame) + newImgSize.height;
                                           
                                           [self.indexPathsWithMedia setObject: [NSNumber numberWithUnsignedInteger: height1] forKey: indexPath];
                                           
                                           [tableView beginUpdates];
                                           [tableView reloadRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationNone];
                                           [tableView endUpdates];
                                       }
                                   }];
            
            // imgMediaCell.bounds = CGRectInset(imgVwCell.frame, 10.0f, 10.0f);
            
            //[imgMediaCell setContentScaleFactor:1.8];
            //imgMediaCell.image = [UIImage imageWithCGImage:imgMediaCell.image.CGImage scale:[[UIScreen mainScreen] scale] orientation:imgMediaCell.image.imageOrientation];
            
            
            // imgMediaCell.image = [UIImage imageWithCGImage:imgMediaCell.image.CGImage scale: [[UIScreen mainScreen] scale] orientation:imgMediaCell.image.imageOrientation];
            [imgMediaCell sizeToFit];
            
            CGFloat imgMediaCellAspectRatio = CGRectGetWidth(imgMediaCell.frame)/CGRectGetHeight(imgMediaCell.frame);
            
            if (CGRectGetHeight(imgMediaCell.frame) != 0) {
                
                CGRect imgMediaCellFrame = imgMediaCell.frame;
                imgMediaCellFrame.origin.y = CGRectGetMaxY(lblCell.frame);
                imgMediaCellFrame.size.width = CGRectGetWidth(cell.frame) - 10;
                
                //calc height
                imgMediaCellFrame.size.height = CGRectGetWidth(imgMediaCellFrame)/imgMediaCellAspectRatio;
                
                imgMediaCellFrame.origin.x = (CGRectGetWidth(self.view.frame) - CGRectGetWidth(imgMediaCellFrame))/2;
                imgMediaCell.frame = imgMediaCellFrame;
                ////
                hasMedia = YES;
                ////
                imgMediaCell.hidden = NO;
                //
                
                height = imgMediaCellFrame.size.height/*kDefaultMediaHeight*/ + kDefaultPaddingHeight;
                
                
                //                [self.indexPathsWithMedia setObject: [NSNumber numberWithUnsignedInteger: height] forKey: indexPath];
            }
        }
    }
    
    lbldate.frame=CGRectMake(self.view.bounds.size.width - 110, CGRectGetMaxY(lblCell.frame)+height, 105, 15);
    
    //lbldate.text=[NSString stringWithFormat:@"%@",[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"created_at"]];
    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    //Wed Dec 01 17:08:03 +0000 2010
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    
    NSDate *date = [df dateFromString:[NSString stringWithFormat:@"%@",[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"created_at"]]];
    
    [df setDateFormat:@"eee MMM dd yyyy"];
    NSString *dateStr = [df stringFromDate:date];
    lbldate.text=dateStr;
    
    NSLog(@"-- indexPath %@   rect: %@", indexPath, NSStringFromCGRect(lbldate.frame));
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *str=[[self.tweetsArray objectAtIndex:indexPath.row] valueForKey:@"text"];
    
    CGSize size= [str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(self.view.bounds.size.width - 30, 9999) lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat height = size.height;
    
    if (size.height<45)
    {
        height = 45;
    }
    
    height += 55+20;
    
    ////
    NSUInteger imgHeight = kDefaultMediaHeight;
    NSNumber *hasMediaNum = [self.indexPathsWithMedia objectForKey: indexPath];
    BOOL hasMedia = NO;
    if (hasMediaNum) {
        // has not been tested
        
        //find media here
        NSDictionary *tweet = [self.tweetsArray objectAtIndex:indexPath.row];
        
        NSDictionary *entities = [tweet valueForKey:@"entities"];
        NSArray *media = [entities valueForKey:@"media"];
        /// use thumb as default https://dev.twitter.com/overview/api/entities-in-twitter-objects#media
        if (media.count > 0) {
            
            /// just the first media at this time
            NSDictionary *mediaEntry = [media objectAtIndex: 0];
            
            NSString *mediaUrlRaw = [mediaEntry valueForKey:@"media_url_https"];
            if (mediaUrlRaw.length > 0) {
                //
                //                NSString *mediarUrlThumbRaw = [NSString stringWithFormat: @"%@:thumb", mediaUrlRaw];
                //                NSURL *mediaUrlThumbRaw = [NSURL URLWithString: mediarUrlThumbRaw];
                
                NSNumber *heightNum = [self.indexPathsWithMedia objectForKey: indexPath];
                imgHeight = heightNum.unsignedIntegerValue;
                
                hasMedia = YES;
                
                NSLog(@"-2HEIGHTFOR- indexPath %@   rect: %lu", indexPath, (unsigned long)imgHeight);
                
            }
        }
    }
    
    if (hasMedia) {
        
        height = imgHeight;
    }
    ///
    NSLog(@"-HEIGHTFOR- indexPath %@   rect: %f", indexPath, height);
    return height;
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}



@end
