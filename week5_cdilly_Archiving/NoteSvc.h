//
//  NoteSvc.h
//  week5_cdilly_SQLite
//
//  Created by A Student on 6/11/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@protocol NoteSvc <NSObject>

-(Note *) addNote: (Note *) note;
-(Note *) deleteNote: (Note *) note;

-(NSMutableArray *) retrieveAllNotes;

@end
