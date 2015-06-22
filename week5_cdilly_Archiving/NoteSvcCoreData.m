//
//  NoteSvcCoreData.m
//  week7_cdilly_CoreData
//
//  Created by A Student on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "NoteSvcCoreData.h"
#import "CoreData-Prefix.pch"

@implementation NoteSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

NSMutableArray *notesArrayCoreData = nil;

- (Note *) deleteNote:(Note *)note{
    return note;
}

- (Note *) addNote: (Note *) note {
    return note;
}

- (NSMutableArray *) retrieveAllNotes {
    return notesArrayCoreData;
}

-(void) initializeCoreData{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL: modelURL];
    
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"week7_cdilly_CoreData.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    }
    else
    {
        NSLog(@"initializeCoreData FAILED with error : %@", error);
    }
}

@end
