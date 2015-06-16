//
//  Note.h
//  week5_cdilly_SQLite
//
//  Created by A Student on 6/11/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property (nonatomic) NSInteger id;
@property (nonatomic, strong) NSString *noteText;

@end
