//
//  NoteSvcCache.m
//  week5_cdilly_Archiving
//
//  Created by A Student on 6/11/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "NoteSvcCache.h"

@implementation NoteSvcCache

NSMutableArray *notesArray = nil;

- (id) init {
    if (self = [super init]) {
        notesArray = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Note *) addNote: (Note *) note {
    [notesArray addObject: note];
    return note;
}

- (NSMutableArray *) retrieveAllNotes {
    return notesArray;
}

- (Note *) deleteNote: (Note *) note {
    [notesArray removeObject: note];
    return note;
}

@end
