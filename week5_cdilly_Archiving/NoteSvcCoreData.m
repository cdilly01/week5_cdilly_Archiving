//
//  NoteSvcCoreData.m
//  week7_cdilly_CoreData
//
//  Created by A Student on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteSvcCoreData.h"

@implementation NoteSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

NSMutableArray *notesArrayCoreData = nil;

- (Note *)deleteNote:(Note *)note{
    return note;
}

- (Note *) addNote: (Note *) note {
    return note;
}

- (NSMutableArray *) retrieveAllNotes {
    return notesArrayCoreData;
}

-(void) initializeCoreData{

}

@end
