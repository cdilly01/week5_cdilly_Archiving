//
//  NoteSvcSQLite.m
//  week5_cdilly_Archiving
//
//  Created by A Student on 6/15/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "NoteSvcSQLite.h"
#import "sqlite3.h"

@implementation NoteSvcSQLite

NSString *databasePath = nil;
sqlite3 *database= nil;

// sqlite implementation
-(id)init{
    if((self = [super init])){
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:@"note.sqlite3"];
        
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);
        }
        else{
            NSLog(@"*** Failed to open database!");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
    }
    return self;
}

-(Note *) addNote: (Note *) note{
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO note (noteText) VALUES (\"%@\")", note.noteText];
    
    if (sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &statement, NULL)==SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE){
            note.id = sqlite3_last_insert_rowid(database);
            NSLog(@"*** Note added");
        }
        else{
            NSLog(@"*** Note NOT added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return note;
}

-(Note *) deleteNote: (Note *) note{
    return note;
}

-(NSMutableArray *) retrieveAllNotes{
    return nil;
}



@end
