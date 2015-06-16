//
//  ViewController.m
//  week5_cdilly_Archiving
//
//  Created by A Student on 6/11/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"
//#import "NoteSvcCache.h"
//#import "NoteSvcArchive.h"
#import "NoteSvcSQLite.h"

@interface ViewController ()

@end

@implementation ViewController

//NoteSvcArchive *noteSvcArchive = nil;
NoteSvcSQLite *noteSvcSQLite = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    noteSvcSQLite = [[NoteSvcSQLite alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Save Note
- (IBAction)addNote:(id)sender {
    [self.view endEditing:YES];
    
    // instantiate new note with sender note
    Note *note = [[Note alloc] init];
    note.noteText = _noteInputText.text;
    
    [noteSvcSQLite addNote:note];
    
    [self.tableView reloadData];
    NSLog(@"saveNote: note saved");
}

// Delete Note
- (IBAction)deleteNote:(id)sender {
    NSLog(@"deleteNote");
    
    // instantiate new note with sender note
    Note *note = [[Note alloc] init];
    note.noteText = _noteInputText.text;
    
    [noteSvcSQLite deleteNote:note];
    
    [self.tableView reloadData];
    NSLog(@"deleteNote: note deleted");
}


// Return the number of notes
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[noteSvcSQLite retrieveAllNotes] count];
}

// Return the table cell for a paricular row (index)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:simpleTableIdentifier];
    }
    
    Note *note = [[noteSvcSQLite retrieveAllNotes]
                  objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [note description];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}

@end
