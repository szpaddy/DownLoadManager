//
//  ViewController.m
//  DownloadHandler
//
//  Created by 阿 朱 on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DownloadHandler.h"

//
@interface NationObj : NSObject
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *fileType;
@property(nonatomic, copy)NSString *url;
@end

@implementation NationObj
@synthesize name, fileType, url;
-(id)init{
    if (self = [super init]) {        
        self.name = @"7za920";
        self.fileType = @"zip";
        self.url = @"http://downloads.sourceforge.net/sevenzip/7za920.zip";
        
//        self.name = @"44610";
//        self.fileType = @"mp3";
//        self.url = @"http://www.plcsky.com:888/yl/ylsx/ljsy/images/2008/12/23/44610.mp3";
    }
    return self;
}
@end

//
@interface ViewController ()

@end

@implementation ViewController{
    NationObj *_obj;
    DownloadHandler *_downloadHanlder;
    UIButton *_btn;
    ProgressIndicator *_progress;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    _obj = [[NationObj alloc] init];
    
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame = CGRectMake(0, 0, 100, 50);
    _btn.center = CGPointMake(160, 240);
    [_btn setTitle:@"下载" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(downloadContent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _progress = [[ProgressIndicator alloc] initWithFrame:CGRectMake(0, 0, 240, 33)];
    _progress.center = CGPointMake(160, 240+50/2+50);
    [self.view addSubview:_progress];
}

-(void)downloadContent{
    _downloadHanlder = [DownloadHandler sharedInstance];
    _downloadHanlder.url = _obj.url;
    _downloadHanlder.name = _obj.name;
    _downloadHanlder.fileType = _obj.fileType;
    _downloadHanlder.savePath = [self getPathOfDocuments];
    _downloadHanlder.progress = _progress;
    [_downloadHanlder start];
}
-(NSString *)getPathOfDocuments{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    return path;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [_progress release];
    _progress = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
