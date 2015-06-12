//
//  NoteSvcCache.m
//  week5_cdilly_Archiving
//
//  Created by A Student on 6/11/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "NoteSvcCache.h"

@implementation NoteSvcCache

NSMutableArray *notes = nil;

- (id) init {
    if (self = [super init]) {
        notes = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Note *) addNote: (Note *) note {
    [notes addObject: note];
    return note;
}

- (NSMutableArray *) retrieveAllNotes {
    return notes;
}

- (Note *) deleteNote: (Note *) note {
    [notes removeObject: note];
    return note;
}

@end
