//
//  Note.h
//  week7_cdilly_CoreData
//
//  Created by A Student on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * noteText;

@end
