//
//  Note.m
//  week7_cdilly_CoreData
//
//  Created by A Student on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "Note.h"


@implementation Note

@dynamic noteText;

NSManagedObjectContext *mocNote = nil;

-(Note *) createManagedNote {
    Note *note = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:mocNote];
    
    return note;
}

-(Note *) CreateNote: (Note *)note {
    Note *managedNote = [self createManagedNote];
    managedNote.noteText = note.noteText;
    
    NSError *error;
    
    if(![mocNote save:&error]){
        NSLog(@"createNote ERROR: %@", [ error localizedDescription]);
    }
    return managedNote;
}

-(Note *)deleteNote:(Note *) note{
    [mocNote deleteObject:note];
    return note;
}

-(NSArray *)retrieveAllNotes{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:mocNote];
    
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"noteText" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *fetchedObjects = [mocNote executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

@end
