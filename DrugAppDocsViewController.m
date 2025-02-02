/*
 *  DrugAppDocsViewController.h
 *  psyTrack Clinician Tools
 *  Version: 1.5.4
 *
 *
 The MIT License (MIT)
 Copyright © 2011- 2021 Daniel Boice
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 *  Created by Daniel Boice on   1/5/12.
 *  Copyright (c) 2011 PsycheWeb LLC. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */

#import "DrugAppDocsViewController.h"
#import "PTTAppDelegate.h"

@implementation DrugAppDocsViewController

@synthesize applNoString, inDocSeqNoString;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil applNoString:(NSString *)applNo inDocSeqNo:(NSString *)inDocSeqNo
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        applNoString = applNo;
        inDocSeqNoString = inDocSeqNo;

        // Custom initialization
    }

    return self;
}


- (void) viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor clearColor];

    NSManagedObjectContext *drugsManagedObjectContext = (NSManagedObjectContext *)[(PTTAppDelegate *)[UIApplication sharedApplication].delegate drugsManagedObjectContext];

    NSPredicate *applNoPredicate = [NSPredicate predicateWithFormat:@"applNo matches %@ AND seqNo matches %@",applNoString, inDocSeqNoString];

    NSFetchRequest *actionDateFetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DrugAppDocEntity"
                                              inManagedObjectContext:drugsManagedObjectContext];
    [actionDateFetchRequest setEntity:entity];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"docDate"
                                                                   ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [actionDateFetchRequest setSortDescriptors:sortDescriptors];

    [actionDateFetchRequest setPredicate:applNoPredicate];

    //    [fetchRequest setFetchBatchSize:10];

    NSError *error = nil;
    NSArray *fetchedObjectsArray = [drugsManagedObjectContext executeFetchRequest:actionDateFetchRequest error:&error];

    SCEntityDefinition *appDocDef = [SCEntityDefinition definitionWithEntityName:@"DrugAppDocEntity" managedObjectContext:drugsManagedObjectContext propertyNames:[NSArray arrayWithObjects:@"applNo", @"seqNo",@"docType",@"docDate",   nil]];

    appDocDef.keyPropertyName = @"docDate";

    // Instantiate the tabel model

    SCMemoryStore *memoryStore = [SCMemoryStore storeWithObjectsArray:[NSMutableArray arrayWithArray:fetchedObjectsArray] defaultDefiniton:appDocDef];

    objectsModel = [[SCArrayOfObjectsModel alloc] initWithTableView:self.tableView dataStore:memoryStore];

    objectsModel.allowDeletingItems = FALSE;
    objectsModel.allowEditDetailView = FALSE;
    objectsModel.allowMovingItems = FALSE;
    objectsModel.allowAddingItems = FALSE;
    objectsModel.allowRowSelection = NO;

    objectsModel.sectionActions.cellForRowAtIndexPath = ^SCCustomCell *(SCArrayOfItemsSection *itemsSection, NSIndexPath *indexPath)
    {
        NSDictionary *actionOverviewBindings = [NSDictionary
                                                dictionaryWithObjects:[NSArray arrayWithObjects:@"docDate", @"docType", @"docType",@"docDate",@"WebViewDetailViewController",   nil]
                                                              forKeys:[NSArray arrayWithObjects:@"1", @"2", @"top",@"bottom",@"openNib",nil]]; // 1,2,3 are the control tags
        SCCustomCell *actionOverviewCell = [SCCustomCell cellWithText:nil boundObject:nil objectBindings:actionOverviewBindings
                                                              nibName:@"DrugDocOverviewCell_iPhone"];

        return actionOverviewCell;
    };

    if ([SCUtilities is_iPad] || [SCUtilities systemVersion] >= 6)
    {
        PTTAppDelegate *appDelegate = (PTTAppDelegate *)[UIApplication sharedApplication].delegate;

        [self.tableView setBackgroundView:nil];
        [self.tableView setBackgroundView:[[UIView alloc] init]];

        [self.tableView setBackgroundColor:appDelegate.window.backgroundColor]; // Make the table view transparent
    }

    self.tableViewModel = objectsModel;
    actionDateFetchRequest = nil;
    sortDescriptor = nil;
    sortDescriptors = nil;
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations

    return YES;
}


#pragma mark -
#pragma mark SCTableViewModelDataSource methods

- (SCCustomCell *) tableViewModel:(SCTableViewModel *)tableViewModel
      customCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create & return a custom cell based on the cell in ContactOverviewCell.xib

    NSDictionary *actionOverviewBindings = [NSDictionary
                                            dictionaryWithObjects:[NSArray arrayWithObjects:@"docDate", @"docType", @"docType",@"docDate",@"WebViewDetailViewController",   nil]
                                                          forKeys:[NSArray arrayWithObjects:@"1", @"2", @"top",@"bottom",@"openNib",nil]]; // 1,2,3 are the control tags
    SCCustomCell *actionOverviewCell = [SCCustomCell cellWithText:nil boundObject:nil objectBindings:actionOverviewBindings
                                                          nibName:@"DrugDocOverviewCell_iPhone"];

    return actionOverviewCell;
}


- (void) tableViewModel:(SCTableViewModel *)tableViewModel didAddSectionAtIndex:(NSUInteger)index
{
    SCTableViewSection *section = [tableViewModel sectionAtIndex:index];

    if (section.headerTitle != nil)
    {
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)];

        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.text = section.headerTitle;
        [containerView addSubview:headerLabel];

        section.headerView = containerView;
    }
}


@end
