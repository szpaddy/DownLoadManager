//
//  NationObj.m
//  DownloadHandler
//
//  Created by 阿 朱 on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NationObj.h"

@implementation NationObj
@synthesize name, url;
-(id)init{
    if (self = [super init]) {
        self.name = @"sgz";
        self.url = @"http://cnread.net/cnread1/lszl/c/chenshou/sgz/sgz.zip";
    }
    return self;
}
@end
