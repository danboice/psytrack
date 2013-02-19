/*
 *  ClinicianGroupsViewController.m
 *  psyTrack Clinician Tools
 *  Version: 1.05
 *
 *
 *	THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY UNITED STATES 
 *	INTELLECTUAL PROPERTY LAW AND INTERNATIONAL TREATIES. UNAUTHORIZED REPRODUCTION OR 
 *	DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES. 
 *
 *  Created by Daniel Boice on 2/1/11.
 *  Copyright (c) 2011 PsycheWeb LLC. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */
#import "ClinicianGroupsViewController.h"
#import "PTTAppDelegate.h"
#import "MySource.h"
#import "ClinicianEntity.h"
#import "CliniciansRootViewController_iPad.h"
#import "ClinicianViewController.h"
#import "ABSourcesSCObjectSelectionCell.h"
#import "ClientGroupEntity.h"
#import "PTABGroup.h"


@implementation ClinicianGroupsViewController
@synthesize eventsList,eventStore,eventViewController,psyTrackCalendar,rootNavController;

#pragma mark -
#pragma mark LifeCycle




- (void) didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
    PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
    
    
    [appDelegate displayMemoryWarning];

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
       if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad||[SCUtilities systemVersion]>=6) {
        
        [self.tableView setBackgroundView:nil];
        [self.tableView setBackgroundView:[[UIView alloc] init]];
        [self.tableView setBackgroundColor:UIColor.clearColor]; // Make the table view transparent
        
        
    }
 
    @try {
//        ABAddressBookRef addressBook=ABAddressBookCreate();
//       
//  
//   
//
//	
//	
//	//Display all groups available in the Address Book
//	
//    
////    int CFGroupCount = ABAddressBookGetGroupCount((ABAddressBookRef) addressBook);
////    CFArrayRef groups  = ABAddressBookCopyArrayOfAllGroups((ABAddressBookRef) addressBook);
////    
////    for(CFIndex i = 0;i<CFGroupCount;i++)
////    {
////        ABRecordRef ref = CFArrayGetValueAtIndex(groups, i);
////
////    
////     bool   didRemove=NO;
////      didRemove =  (bool)   ABAddressBookRemoveRecord((ABAddressBookRef) addressBook, (ABRecordRef) ref, nil);
////        
////    }
////    
////    BOOL wantToSaveChanges=TRUE;
////    if (ABAddressBookHasUnsavedChanges(addressBook)) {
////        
////        if (wantToSaveChanges) {
////            bool didSave=FALSE;
////            didSave = ABAddressBookSave(addressBook, nil);
////            
//////            if (!didSave) {/* Handle error here. */  }
//////            else 
////        } 
////        else {
////            
////            ABAddressBookRevert(addressBook);
////            
////        }
////        
////    }
//
////    
//    _valuesDictionary = [NSMutableDictionary dictionary];
//    self.eventStore = [[EKEventStore alloc] init];
//    
//	self.eventsList = [[NSMutableArray alloc] initWithArray:0];
//
////        for (EKCalendar *calenderToREmove in self.eventStore.calendars) {
////            [self.eventStore removeCalendar:calenderToREmove commit:YES error:nil];
////        }
//    SCLabelCell *defaultCalendarLabelCell=[[SCLabelCell alloc]initWithText:@"Calendar" boundObject:_valuesDictionary labelTextPropertyName: (NSString *)[(EKCalendar *)[self defaultCalendarName] title]];
//    defaultCalendarLabelCell.tag=0;
//    
////    SCTextFieldCell *defaultCalendarNameTextFieldCell=[[SCTextFieldCell alloc]initWithText:@"Name" withPlaceholder:@"Calendar Name" withBoundKey:@"calendar_name" withTextFieldTextValue:(NSString *)psyTrackCalendar.title]; 
////    
//        SCTextFieldCell *defaultCalendarNameTextFieldCell=[[SCTextFieldCell alloc]initWithText:@"Name" placeholder:@"Calander Name" boundObject:_valuesDictionary textFieldTextPropertyName:@"calendar_name" ]; 
//        defaultCalendarNameTextFieldCell.textField.text=psyTrackCalendar.title;
//    
//    defaultCalendarNameTextFieldCell.tag=1;
//        defaultCalendarNameTextFieldCell.textField.textAlignment=UITextAlignmentRight;
////     SCTextFieldCell *defaultCalendarLocationCell=[[SCTextFieldCell alloc]initWithText:@"Location" withPlaceholder:@"Default Location" withBoundKey:@"location_name" withTextFieldTextValue:(NSString *)[[NSUserDefaults standardUserDefaults] valueForKey:@"calander_location"]]; 
////        SCTextFieldCell *defaultCalendarLocationCell=[[SCTextFieldCell alloc]initWithText:@"Location" placeholder:@"Default Location" boundKey:@"location_name" textFieldTextValue:(NSString *)[[NSUserDefaults standardUserDefaults] valueForKey:@"calander_location"]]; 
//
//        SCTextFieldCell *defaultCalendarLocationCell=[[SCTextFieldCell alloc]initWithText:@"Location" placeholder:@"Default Location" boundObject:_valuesDictionary textFieldTextPropertyName:@"location_name"];
//        defaultCalendarLocationCell.textField.text=(NSString *)[[NSUserDefaults standardUserDefaults] valueForKey:@"calander_location"];
//        
//    defaultCalendarLocationCell.tag=2;
//        defaultCalendarLocationCell.textField.textAlignment=UITextAlignmentRight;
//    
//    SCTableViewSection *defaultCalendarSection=[SCTableViewSection sectionWithHeaderTitle:@"Default Calendar Settings"];
//    [defaultCalendarSection addCell:defaultCalendarLabelCell];
//    [defaultCalendarSection addCell:defaultCalendarNameTextFieldCell]; 
//    [defaultCalendarSection addCell:defaultCalendarLocationCell];
//    
//        NSArray *sourcesArray=[self fetchArrayOfAddressBookSources];
//       
//        
////        SCSelectionCell *sourcesSelectionCell=[[SCSelectionCell alloc]initWithText:@"Address Book Source" withBoundKey:nil withSelectedIndexValue:selectedIndex withItems: sourcesArray];
//        ABSourcesSCObjectSelectionCell *sourcesSelectionCell=[[ABSourcesSCObjectSelectionCell alloc]initWithText:@"Source" boundObject:_valuesDictionary selectedIndexesPropertyName:@"sources" items:sourcesArray allowMultipleSelection:NO];
//        
//
//    
//        sourcesSelectionCell.allowAddingItems=NO;
//        sourcesSelectionCell.allowDeletingItems=NO;
//        sourcesSelectionCell.allowEditDetailView=NO;
//        sourcesSelectionCell.allowMovingItems=NO;
//        sourcesSelectionCell.allowMultipleSelection=NO;
//        sourcesSelectionCell.allowNoSelection=NO;
//        
//        sourcesSelectionCell.tag=3;
//        
//        SCTableViewSection *defaultSourceSection=[SCTableViewSection sectionWithHeaderTitle:@"Address Book Source" footerTitle:@"CardDAV server should be the default choice if you use iCloud to sychronize your address book across devices. All devices should use the same source."];
//        [defaultSourceSection addCell:sourcesSelectionCell];
//       
//        
//        
//    int groupIdentifier=[[NSUserDefaults standardUserDefaults] integerForKey:kPTTAddressBookGroupIdentifier];
//    NSString *groupName=[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookGroupName];
//    
//   
//        ABRecordRef source=nil;
//        int sourceID=[self defaultABSourceID];
//        
//        addressBook=nil;
//        addressBook=ABAddressBookCreate();
//        source=ABAddressBookGetSourceWithRecordID(addressBook, sourceID);
//        
//        
//        CFArrayRef allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBook, source);
//        int groupCount=CFArrayGetCount(allGroupsInSource);
//
//        
//    
//        BOOL autoAddClinicianToGroup=[[NSUserDefaults standardUserDefaults] boolForKey:kPTAutoAddClinicianToGroup];
//    
//    
//    if ((groupIdentifier==-1||groupIdentifier==0||!groupCount)&&autoAddClinicianToGroup) {
//        
//        [ self changeABGroupNameTo:(NSString *)groupName addNew:NO checkExisting:NO];
//        
//        
//    }
//    
//    groupIdentifier=[[NSUserDefaults standardUserDefaults] integerForKey:kPTTAddressBookGroupIdentifier];
// 
//  
//    
//    groupArray=[self addressBookGroupsArray];
//    
//    NSNumber *selectedItemIndexNumber = (NSNumber *)[dictionaryArrayOfStringsIndexForGroupIdentifierKey objectForKey:[[NSNumber numberWithInt:groupIdentifier]stringValue]];
//   
//    
//    SCSelectionCell *defaultABGroupSelectionCell=[[SCSelectionCell alloc]initWithText:@"Group" boundObject:_valuesDictionary selectedIndexPropertyName:@"group" items:groupArray]; 
//    
//    
//        [defaultABGroupSelectionCell setSelectedItemIndex:selectedItemIndexNumber];
//    defaultABGroupSelectionCell.allowMultipleSelection=NO;
//    defaultABGroupSelectionCell.allowAddingItems=NO;
//    defaultABGroupSelectionCell.allowDeletingItems=NO;
//    defaultABGroupSelectionCell.allowMovingItems=NO;
//    defaultABGroupSelectionCell.allowNoSelection=NO;
//    defaultABGroupSelectionCell.autoDismissDetailView=YES;
//    defaultABGroupSelectionCell.tag=4;
//   
//    
////    NSString *groupName=[(NSString *)[NSUserDefaults standardUserDefaults]valueForKey:kAddressBookGroupName];
//    
//    
//    // Add a custom property that represents a custom cells for the email address and description defined TextFieldAndLableCell.xib
//	
//    //create the dictionary with the data bindings
//    NSDictionary *groupNameDataBindings = [NSDictionary 
//                                          dictionaryWithObjects:[NSArray arrayWithObjects:@"groupNameString",@"autoAddClinicianToGroup",nil] 
//                                          forKeys:[NSArray arrayWithObjects:@"1",@"2",nil ]]; // 1 is the control tag
//	
//    //create the custom property definition
////    SCCustomPropertyDefinition *nameDataProperty = [SCCustomPropertyDefinition definitionWithName:@"GroupNameData"
////                                                                                 uiElementNibName:@"TextFieldWithUpdateButtonCell"
////                                                                                   objectBindings:groupNameDataBindings];
////	
//    
//
////    SCCustomCell *groupNameUpdateCell = [SCCustomCell cellWithText:nil keyBindings:groupNameDataBindings nibName:@"ABGroupNameChangeCell"];
//   SCCustomCell *groupNameUpdateCell = [SCCustomCell cellWithText:nil boundObject:nil objectBindings:groupNameDataBindings nibName:@"ABGroupNameChangeCell"];	
//    
////    groupNameUpdateCell.delegate=self;
//    
//    groupNameUpdateCell.tag=5;
//
        
               
        //    SCTextFieldCell *defaultABGroupNameTextFieldCell=[[SCTextFieldCell alloc]initWithText:@"Name" withPlaceholder:@"Group Name" withBoundKey:@"group_name" withTextFieldTextValue:groupName]; 
//    
//    defaultABGroupNameTextFieldCell.tag=4;
//    defaultABGroupNameTextFieldCell.delegate=self;
    
//    SCTableViewSection *defaultABGroupSection=[SCTableViewSection sectionWithHeaderTitle:@"Default Address Book Group Settings" footerTitle:@"To change an existing name or to add a new group with a specified name, enter it in the name field, then tap the corresponding button."];
//    
//    
//    [defaultABGroupSection addCell:defaultABGroupSelectionCell];
////    [defaultABGroupSection addCell:defaultABGroupNameTextFieldCell]; 
//    [defaultABGroupSection addCell:groupNameUpdateCell];
//    

        PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;

        NSManagedObjectContext * managedObjectContext = [appDelegate managedObjectContext];
        
        
        
       
        SCEntityDefinition *clinicianGroupDef=[SCEntityDefinition definitionWithEntityName:@"ClinicianGroupEntity" managedObjectContext:managedObjectContext propertyNames:[NSArray arrayWithObjects:@"groupName",@"addressBookSync",@"addNewClinicians", nil]];
        
         objectsModel = [[SCArrayOfObjectsModel alloc] initWithTableView:self.tableView entityDefinition:clinicianGroupDef ];
        if ([SCUtilities systemVersion]<6) {
        
        SCCustomPropertyDefinition *groupNameUpdateCProperty = [SCCustomPropertyDefinition definitionWithName:@"addressBookButtonCell" uiElementNibName:@"ABGroupNameChangeCell" objectBindings:nil];;
        
        
//        SCPropertyDefinition *grouNamePropertyDef=[clinicianGroupDef propertyDefinitionWithName:@"groupName"];
//        
//        grouNamePropertyDef.autoValidate=YES;
        
        //add the property definition to the clinician class 
        [clinicianGroupDef addPropertyDefinition:groupNameUpdateCProperty];
        }
        SCPropertyGroup *mainGroup=[SCPropertyGroup groupWithHeaderTitle:@"Clinician Group Details" footerTitle:nil propertyNames:[NSArray arrayWithObjects:@"groupName",@"addressBookSync",@"addNewClinicians",@"addressBookButtonCell", nil]];
        
        [clinicianGroupDef.propertyGroups addGroup:mainGroup];
        
        
        
        
        objectsModel.editButtonItem = self.navigationItem.rightBarButtonItem;
        //        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
        //        self.navigationItem.rightBarButtonItem = addButton;
       
       
            self.navigationBarType = SCNavigationBarTypeAddEditRight;
     
        objectsModel.editButtonItem = self.editButton;;
        
        objectsModel.addButtonItem = self.addButton;
        
        objectsModel.dataFetchOptions=[SCDataFetchOptions optionsWithSortKey:@"groupName" sortAscending:YES filterPredicate:nil];
        //        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
        //        self.navigationItem.rightBarButtonItem = addButton;
        objectsModel.addButtonItem = self.navigationItem.rightBarButtonItem;
        
        
        objectsModel.allowAddingItems=YES;
        objectsModel.allowDeletingItems=YES;
        objectsModel.allowEditDetailView=YES;
        objectsModel.allowRowSelection=YES;
        
        
        objectsModel.addButtonItem=self.navigationItem.rightBarButtonItem;
        //create a custom property definition for the addressbook button cell
               
        
       
        
        
    // Initialize objectsModel
   
//        [objectsModel addSection:groupsSection];
//    [objectsModel addSection:defaultCalendarSection];
//    [objectsModel addSection:defaultSourceSection];
//    [objectsModel addSection:defaultABGroupSection]; 

        
        UIViewController *navtitle=self.navigationController.topViewController;
        
        navtitle.title=@"Client Groups";

        
   
        objectsModel.autoAssignDataSourceForDetailModels=YES;
        objectsModel.autoAssignDelegateForDetailModels=YES;
        self.tableViewModel=objectsModel;
        

//        if (addressBook) {
//            CFRelease(addressBook);
//        }
    }
    
  @catch (NSException *exception) {
    PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
    
    [appDelegate displayNotification:@"Problem Connecting to the Address Book Occured" forDuration:3.0 location:kPTTScreenLocationTop inView:nil];
}
@finally {
   
}
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.eventStore=nil;
    self.psyTrackCalendar=nil;
    self.eventsList=nil;
    self.eventViewController=nil;
    
    _valuesDictionary=nil;
   objectsModel=nil;
 
	

 
   dictionaryABGroupIdentifierValueForArrayOfStringsIndexKey=nil;
   dictionaryArrayOfStringsIndexForGroupIdentifierKey=nil;
    groupArray =nil;
//    CFRelease(addressBook);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark -
#pragma mark calander settings
// Set the calendar edited by EKEventEditViewController to our chosen calendar - the default calendar.
//- (ABGroup *)defaultAddressBookGroup{
//    ABGroup *group;
//
////    NSString *addressBookIdentifier=[[NSUserDefaults standardUserDefaults] valueForKey:@"AddressBookIdentifier"];
////    NSInteger ABGroupIdentifier=[[NSUserDefaults standardUserDefaults] integerForKey:@"AddressBookGroupIdentifier"];
////
////    
////    ABAddressBook *addressBook=[[ABAddressBook alloc]init];
////    
////    
//
//
//
//    return group;
//}

// Set the calendar edited by EKEventEditViewController to our chosen calendar - the default calendar.
- (EKCalendar *)defaultCalendarName{
	
    
    // Get the default calendar from store.
    //    settingsDictionary=(NSDictionary *)[(PTTAppDelegate *)[UIApplication sharedApplication].delegate settingsPlistDictionary];
    NSString *defaultCalendarIdentifier=[[NSUserDefaults standardUserDefaults] valueForKey:@"defaultCalendarIdentifier"];
	
    
    
    
    
    
    // find local source
    EKSource *mySource = nil;
  
    
//    BOOL iCloudEnabled=(BOOL)[[NSUserDefaults standardUserDefaults] valueForKey:@"icloud_preference"];
  
    
        for (EKSource *sourceInSources in eventStore.sources){
            
            if ([sourceInSources.title isEqualToString: @"iCloud"])
            {
                mySource = sourceInSources;
//                
                
                break;
            }
            
            
        }
        
        

     
    if (!mySource) {
        
       
        
        for (EKSource *sourceInSources in eventStore.sources){
            
            if (sourceInSources.sourceType==EKSourceTypeLocal)
            {
                mySource = sourceInSources;
                
                break;
            }
        }
        
    }
    
   
    
    
    if (mySource) 
    {
        NSString *defaultCalendarName=[[NSUserDefaults standardUserDefaults] valueForKey:@"calendar_name"];
        //        NSSet *calendars=(NSSet *)[localSource calendars];
        if (defaultCalendarIdentifier.length) 
        {
            
            
            self.psyTrackCalendar =[self.eventStore calendarWithIdentifier:defaultCalendarIdentifier]; 
                mySource =psyTrackCalendar.source;

           
        }
       
        if (!self.psyTrackCalendar) 
      
        {
            
            for (EKCalendar *calanderInStore in eventStore.calendars) {
                if ([calanderInStore.title isEqualToString:@"Client Appointments"]) {
                    self.psyTrackCalendar=calanderInStore;
                    break;
                }
            }
            
            //try again
            if (!self.psyTrackCalendar) {
                
                self.psyTrackCalendar = [EKCalendar calendarWithEventStore:self.eventStore];
            
                [[NSUserDefaults standardUserDefaults] setValue:psyTrackCalendar.calendarIdentifier forKey:@"defaultCalendarIdentifier"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                self.psyTrackCalendar.source = mySource;
                
            }

            
        }
        
        if (defaultCalendarName.length) {
            self.psyTrackCalendar.title =defaultCalendarName;
        }
        
        else 
        {
            
            self.psyTrackCalendar.title=@"Client Appointments";
        }
       
        
        
    }
    
    
    
    
    
    NSError *error;
    
    if (![self.eventStore saveCalendar:self.psyTrackCalendar commit:YES error:&error ]) 
    {
        
    }
    else
    {
        
        [[NSUserDefaults standardUserDefaults]setValue:psyTrackCalendar.calendarIdentifier forKey:@"defaultCalendarIdentifier"];
        //                 NSSet *calendars=(NSSet *)[localSource calendars];
        //                    for(id obj in calendars) { 
        //                    if([obj isKindOfClass:[EKCalendar class]]){
        //                        EKCalendar *calendar=(EKCalendar *)obj;
        //                        if ([calendar.calendarIdentifier isEqualToString:self.psyTrackCalendar.calendarIdentifier]) {
        //                            self.psyTrackCalendar=(EKCalendar *)calendar;
        //                          
        //                            break;
        //                        }
        
        
        //                    }
        
    }
    
    
    //            self.psyTrackCalendar =(EKCalendar *)localSource cal
    
    
    
    
    
    
    
    if (self.psyTrackCalendar) 
    {
        
    }
    
    
    
 
    
  
	return  self.psyTrackCalendar;


}

#pragma mark -
#pragma mark EKCalendarChooserDelegate methods

-(void)calendarChooserDidCancel:(EKCalendarChooser *)calendarChooser{
    
    
    
    [calendarChooser dismissModalViewControllerAnimated:YES];
    
    
    
    
    
}




-(void)calendarChooserSelectionDidChange:(EKCalendarChooser *)calendarChooser{
    
    
    NSArray *calendarArray=[calendarChooser.selectedCalendars allObjects];
    if (calendarArray.count>0) {
        self.psyTrackCalendar=(EKCalendar *)[calendarArray objectAtIndex:0];
        NSString *calendarName=(NSString *)[self.psyTrackCalendar title];
        NSString *calenderIdentifier=self.psyTrackCalendar.calendarIdentifier;
        [[NSUserDefaults standardUserDefaults] setValue:calenderIdentifier forKey:@"defaultCalendarIdentifier"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        if (objectsModel.sectionCount) {
            SCTableViewSection *section=(SCTableViewSection *)[objectsModel sectionAtIndex:0];
            if (section.cellCount>1) {
                SCTableViewCell *firstCell=(SCTableViewCell *)[section cellAtIndex:0];
                SCTableViewCell *secondCell=(SCTableViewCell *)[section cellAtIndex:1];
                
                if ([firstCell isKindOfClass:[SCLabelCell class]]) {
                    SCLabelCell *calenderLabelCell=(SCLabelCell *)firstCell;
                    [calenderLabelCell.label setText:calendarName];
                    
                    
                }
                if ([secondCell isKindOfClass:[SCTextFieldCell class]]) {
                    SCTextFieldCell *calenderNameTextFieldCell=(SCTextFieldCell *)secondCell;
                    [calenderNameTextFieldCell.textField setText:calendarName];
                    
                    
                }
                
                
                
            }
        }
    }
    
    
    [calendarChooser dismissModalViewControllerAnimated:YES];
    
    
}

-(NSArray *)fetchArrayOfAddressBookSources{

  

    
    
   
    NSMutableArray *list = [NSMutableArray array];
    if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
    {
        
        ABAddressBookRef addressBookToGetAddressBookSources=ABAddressBookCreate();
	// Get all the sources from the address book
	CFArrayRef allSources = ABAddressBookCopyArrayOfAllSources(addressBookToGetAddressBookSources);
	
	for (CFIndex i = 0; i < CFArrayGetCount(allSources); i++)
    {
		ABRecordRef aSource = CFArrayGetValueAtIndex(allSources,i);
		
		// Fetch all groups included in the current source
		CFArrayRef result =nil; 
       result= ABAddressBookCopyArrayOfAllGroupsInSource (addressBookToGetAddressBookSources, aSource);
		
		// The app displays a source if and only if it contains groups
		if (CFArrayGetCount(result) > 0)
		{
			NSMutableArray *groups = [[NSMutableArray alloc] initWithArray:(__bridge  NSArray *)result];
			
			// Fetch the source name
			NSString *sourceName = [self nameForSource:aSource];
            
            //fetch source record ID
            int sourceRecordID=[self recordIDForSource:aSource];
            
            
			//Create a MySource object that contains the source name and all its groups
			MySource *sourceFound = [[MySource alloc] initWithAllGroups:groups name:sourceName recordID:sourceRecordID];
			
			// Save the source object into the array
			[list addObject:sourceFound];
		
            if (result) {
                CFRelease(result);
            }
		}
		else {
            if (result) {
                CFRelease(result);
            }
        }
       	
    }
	if (allSources) {
        CFRelease(allSources);
    }
        if (addressBookToGetAddressBookSources) {
            CFRelease(addressBookToGetAddressBookSources);
        }
	}
    return list;	

    
 


}

-(NSNumber *)defaultABSourceInSourceArray:(NSArray *)sourceArray{

    BOOL iCloudEnabled=(BOOL)[[NSUserDefaults standardUserDefaults] valueForKey:@"icloud_preference"];
    
    
    
    
    NSNumber *sourceIndex=[NSNumber numberWithInt:-1];
   
    if (sourceArray.count==1) {
        sourceIndex=[NSNumber numberWithInt:0];
        return sourceIndex;
    }
    
    
    int recordID=(int)[(NSNumber*)[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookSourceIdentifier]
                    intValue];
    
    
    
    if (recordID!=-1) {
        for (MySource *sourceInArray in sourceArray){
            
            if (sourceInArray.sourceRecordID ==recordID)
            {
                sourceIndex = (NSNumber *)[NSNumber numberWithInt:[sourceArray indexOfObject:sourceInArray]];

                
                //                
                return sourceIndex;
                break;
            }
            
            
        }

    }
    if (sourceArray.count &&  iCloudEnabled) {
//        

  
        for (MySource *sourceInArray in sourceArray){
            
            if ([sourceInArray.name isEqualToString: @"iCloud"])
            {
               sourceIndex = (NSNumber *)[NSNumber numberWithInt:[sourceArray indexOfObject:sourceInArray]];
                
                
                //                
                
                return sourceIndex;
                break;
            }
            
            
        }
        
        
    }

if(sourceArray.count>1)
{
    return [NSNumber numberWithInt:0];
                  
}
    
    return sourceIndex;
}


// Return the name associated with the given identifier
- (NSString *)nameForSourceWithIdentifier:(int)identifier
{
	switch (identifier)
	{
		case kABSourceTypeLocal:
			return @"On My Device";
			break;
		case kABSourceTypeExchange:
			return @"Exchange server";
			break;
		case kABSourceTypeExchangeGAL:
			return @"Exchange Global Address List";
			break;
		case kABSourceTypeMobileMe:
			return @"Moblile Me";
			break;
		case kABSourceTypeLDAP:
			return @"LDAP server";
			break;
		case kABSourceTypeCardDAV:
			return @"CardDAV server";
			break;
		case kABSourceTypeCardDAVSearch:
			return @"Searchable CardDAV server";
			break;
		default:
			break;
	}
	return nil;
}


// Return the name of a given source
- (NSString *)nameForSource:(ABRecordRef)desiredSource
{
	// Fetch the source type
	CFNumberRef sourceType = ABRecordCopyValue(desiredSource, kABSourceTypeProperty);
	
	// Fetch the name associated with the source type
	NSString *sourceName = [self nameForSourceWithIdentifier:[(__bridge NSNumber*)sourceType intValue]];
	CFStringRef sourceNameProperty=ABRecordCopyValue(desiredSource, kABSourceNameProperty);
    if ( sourceNameProperty && CFStringGetLength(sourceNameProperty)) {
        sourceName=[sourceName stringByAppendingFormat:@"(%@)",(__bridge NSString *)sourceNameProperty];
    }
    
    if (sourceNameProperty) {
          CFRelease(sourceNameProperty);
    }
  
    CFRelease(sourceType);
	return sourceName;
}
// Return the name of a given source
- (int )recordIDForSource:(ABRecordRef)sourceToCheck
{
	// Fetch the source type
	int sourceRecordID = ABRecordGetRecordID(sourceToCheck);
	
	// Fetch the name associated with the source type
	
	return sourceRecordID;
}

#pragma mark -
#pragma mark configuring cells and sections


- (void)tableViewModel:(SCTableViewModel *)tableViewModel didLayoutSubviewsForCell:(SCTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([cell isKindOfClass:[SCSwitchCell class]])
    {
//        CGRect frame = cell.textLabel.frame;
        [cell.textLabel sizeToFit];
//        cell.textLabel.frame = frame;
    }
}


- (void)tableViewModel:(SCTableViewModel *)tableViewModel didAddSectionAtIndex:(NSUInteger)index
{
    
    SCTableViewSection *section = [tableViewModel sectionAtIndex:index];
    
    if(section.headerTitle !=nil)
    {
           
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)];
        
        
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.tag=60;
        headerLabel.text=section.headerTitle;
        [containerView addSubview:headerLabel];
        
        section.headerView = containerView;
        
    }
    
    
    if(section.footerTitle !=nil)
    {
        
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
        UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 100)];
        footerLabel.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        footerLabel.numberOfLines=6;
        footerLabel.lineBreakMode=UILineBreakModeWordWrap;
        footerLabel.backgroundColor = [UIColor clearColor];
        footerLabel.textColor = [UIColor whiteColor];
        footerLabel.tag=60;
        footerLabel.text=section.footerTitle;
        footerLabel.textAlignment=UITextAlignmentCenter;
        section.footerHeight=(CGFloat)100;
        [containerView addSubview:footerLabel];
//        [footerLabel sizeToFit];
        section.footerView = containerView;
        
    }

    
}

-(void)tableViewModel:(SCTableViewModel *)tableViewModel willConfigureCell:(SCTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{ 

//
//    if (indexPath.section==2 && cell.tag==5) {
//        SCTableViewSection *section=(SCTableViewSection*)[tableViewModel sectionAtIndex:1];
//       NSString *groupName=[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookGroupName];
//        BOOL autoAddClinicianToGroup=[[NSUserDefaults standardUserDefaults]boolForKey:kPTAutoAddClinicianToGroup];
//        if ([cell isKindOfClass:[SCCustomCell class]]) {
////            SCCustomCell *controllCell=(SCCustomCell *)cell;
//            
//            UITextField *textField=(UITextField *)[cell viewWithTag:1];
//            SCSelectionCell *selectionCell=(SCSelectionCell *)[section cellAtIndex:0];
//            textField.font=selectionCell.label.font;
//            textField.textColor=selectionCell.label.textColor;
//            
//            [_valuesDictionary setValue:groupName forKey:@"groupNameString"];
//            [_valuesDictionary setValue:[NSNumber numberWithBool:autoAddClinicianToGroup] forKey:@"autoAddClinicianToGroup"];
//        }
//        
//    
//    }
//    
//    if (indexPath.section==1) {
//        if (cell.tag==3&&[cell isKindOfClass:[SCObjectSelectionCell class]]) {
//            SCObjectSelectionCell *objSelectionCell=(SCObjectSelectionCell *)cell;
//            NSNumber *setIndexNumber=[self defaultABSourceInSourceArray:objSelectionCell.items];
//            if ([setIndexNumber intValue]>-1) {
//                [objSelectionCell setSelectedItemIndex:setIndexNumber];
//            }
//            
//        
//        }
//    }
//    NSArray *sourcesArray=[self fetchArrayOfAddressBookSources];
//    NSNumber *selectedIndex=nil;
//    if (sourcesArray.count) {
//        
//        selectedIndex=[self defaultABSourceInSourceArray:sourcesArray ];
//        
//    }
//
//
//    if (tableViewModel.tag==429 ) {
//       
//          
//            
//            
//            
//            if ([cell.boundObject isKindOfClass:[MySource class]]) {
//                MySource *mySource=(MySource *)cell.boundObject;
//                
//                cell.textLabel.text=mySource.name;
//                
//            }
//            
//        
//        
//    }
//
//




}


#pragma mark -
#pragma mark SCTableViewModelDelegate methods


-(void)tableViewModel:(SCTableViewModel *)tableViewModel detailModelCreatedForRowAtIndexPath:(NSIndexPath *)indexPath detailTableViewModel:(SCTableViewModel *)detailTableViewModel{

    if (tableViewModel.tag==0) {
        SCTableViewCell *cell=(SCTableViewCell *)[tableViewModel cellAtIndexPath:indexPath];
        
        
        
        
        if (cell.tag==3&&[cell isKindOfClass:[SCObjectSelectionCell class]]) {
            
            
            UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(abSourcesDoneButtonTapped:)];
            
            
            detailTableViewModel.viewController.navigationItem.rightBarButtonItem = doneButton;
            detailTableViewModel.tag=429;
            
            currentDetailTableViewModel_=detailTableViewModel;
            
        }
        
        
    }





}
-(void)tableViewModel:(SCTableViewModel *)tableModel detailViewWillPresentForRowAtIndexPath:(NSIndexPath *)indexPath withDetailTableViewModel:(SCTableViewModel *)detailTableViewModel{

    if ([SCUtilities is_iPad]||[SCUtilities systemVersion]>=6) {
        PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
        
        
        UIColor *backgroundColor=nil;
        
        if(indexPath.row==NSNotFound|| tableModel.tag>0)
        {
            
            backgroundColor=(UIColor *)appDelegate.window.backgroundColor;
            
        }
        else {
            
            
            
            backgroundColor=[UIColor clearColor];
            
            
        }
        
        if (detailTableViewModel.modeledTableView.backgroundColor!=backgroundColor) {
            
            [detailTableViewModel.modeledTableView setBackgroundView:nil];
            UIView *view=[[UIView alloc]init];
            [detailTableViewModel.modeledTableView setBackgroundView:view];
            [detailTableViewModel.modeledTableView setBackgroundColor:backgroundColor];
            
            
            
            
        }
        
    }



}
- (void)tableViewModel:(SCTableViewModel *)tableViewModel customButtonTapped:(UIButton *)button forRowWithIndexPath:(NSIndexPath *)indexPath
{
//	SCTableViewCell *cell = [tableViewModel cellAtIndexPath:indexPath];
	
	// Get the object associated with the cell
//	NSManagedObject *managedObject = (NSManagedObject *)cell.boundObject;
   
   	PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
    
    if ([SCUtilities systemVersion]<6) {
   
	switch (button.tag)
	{
		case 301:
        {
            
            SCTableViewSection *section=[tableViewModel sectionAtIndex:indexPath.section];
            NSString *groupNameTo=nil;
            NSString *groupNameFrom=nil;
            
            
            if ([section isKindOfClass:[SCObjectSection class]]) {
                SCObjectSection *objectSection=(SCObjectSection *)section;
                
             
                NSManagedObject *sectionManagedObject=(NSManagedObject *)section.boundObject;
                
                
                if (sectionManagedObject && [sectionManagedObject respondsToSelector:@selector(entity)]&&[sectionManagedObject.entity.name isEqualToString:@"ClinicianGroupEntity"]) {
                    
                    
                    
                    ClientGroupEntity *clientGroup=(ClientGroupEntity *)sectionManagedObject;
                    if (clientGroup.groupName &&clientGroup.groupName.length) {
                          groupNameFrom=[NSString stringWithString:clientGroup.groupName];
                    }
                
                  
                    
                       [objectSection commitCellChanges];
                    
                    
                    groupNameTo=clientGroup.groupName;
                    
                   
                }
                
            }
         
            if (groupNameTo && groupNameTo.length) {
                if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
                {
                    
                ABAddressBookRef addressBookToGetGroup=ABAddressBookCreate();
                
                int sourceID=[self defaultABSourceID];
                
                
                source=ABAddressBookGetSourceWithRecordID(addressBookToGetGroup, sourceID);

                
                
                NSArray *ptABGroupsArray=[NSArray arrayWithArray:(NSArray *)[self addressBookGroupsArray]];
                BOOL groupNameToAlreadyExistsInAB=NO;
                if (groupNameTo && groupNameTo.length) {
                   for (PTABGroup *group in ptABGroupsArray){
                        if ([group.groupName isEqualToString:groupNameTo]) {
                           
                            groupNameToAlreadyExistsInAB=YES;
                            
                            
                            break;
                            
                        }
                    }
                    
                } 
                BOOL groupNameFromAlreadyExistsInAB=NO;
                if (groupNameFrom && groupNameFrom.length) {
               
                    for (PTABGroup *group in ptABGroupsArray){
                        if ([group.groupName isEqualToString:groupNameFrom]) {
                            
                            groupNameFromAlreadyExistsInAB=YES;
                            
                            
                            break;
                            
                        }  }
                }
                    
           
                
                
                if (groupNameToAlreadyExistsInAB && [groupNameTo isEqualToString:groupNameFrom]) {
                    [appDelegate displayNotification:@"Group name has not changed." forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
                    
                    if (addressBookToGetGroup) {
                        CFRelease(addressBookToGetGroup);
                    }
                    return;
                }
                
                NSPredicate *groupNamePredicate=[NSPredicate predicateWithFormat:@"groupName MATCHES %@", groupNameTo];
                
               NSArray *filteredPTABGroupsArray= [ptABGroupsArray filteredArrayUsingPredicate:groupNamePredicate];
                
                if (filteredPTABGroupsArray.count) {
                        
                    NSString *displayMessag=nil;
                    if (filteredPTABGroupsArray.count>1) {
                        
                        displayMessag=[NSString stringWithFormat:@"%i groups exist with that name already. The first one found with this name will be used.",ptABGroupsArray.count];
                        
                    }else {
                        displayMessag=@"A group with this name already exists.  It will be used.";
                        
                    }
                    
                    [appDelegate displayNotification:displayMessag forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
                    if (addressBookToGetGroup) {
                        CFRelease(addressBookToGetGroup);
                    }
                    return;

                    
                }
                
                
               
                
                    BOOL successAtChangingName=NO;
                    if (addressBookToGetGroup) 
                    {
                   
                
                      successAtChangingName=  [self  changeABGroupNameFrom:(NSString *)groupNameFrom To:(NSString *)groupNameTo  addNew:(BOOL)NO checkExisting:(BOOL)YES ];               
                       
                        
                        
                 
                    }
                NSString *displayMessage=nil;
                    if (successAtChangingName) {
                       
                        if (!groupNameFromAlreadyExistsInAB){
                        
                            displayMessage=@"Successfully added group name in the Address Book.";
                        
                        }
                        else {
                            displayMessage=@"Successfully changed group name in the Address Book.";
                        }
                        
                       
                        
                    }
                    else {
                        displayMessage=@"Address Book group name change not successful.";
                    }
                 
            [appDelegate displayNotification:displayMessage forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
                
                if (addressBookToGetGroup) {
                    CFRelease(addressBookToGetGroup);
                }
                if (source) {
                    CFRelease(source);
                }
            
            }
                
            }
            
            

        }
            break;
        case 302:
        {
            
//            NSString *groupNameString = (NSString *)[tableViewModel.modelKeyValues valueForKey:@"groupNameString"];
			
//            
            
            
            
//            BOOL autoAddClinicianToGroup=[[NSUserDefaults standardUserDefaults]boolForKey:kPTAutoAddClinicianToGroup];
            
            
            
            SCTableViewSection *section=[tableViewModel sectionAtIndex:indexPath.section];
            NSString *groupName=nil;
            PTABGroup *group=nil;
            
            
            if ([section isKindOfClass:[SCObjectSection class]]) {
                SCObjectSection *objectSection=(SCObjectSection *)section;
                
                
                NSManagedObject *sectionManagedObject=(NSManagedObject *)section.boundObject;
                
                
                
              
                if ([objectSection valuesAreValid] && sectionManagedObject && [sectionManagedObject respondsToSelector:@selector(entity)]&&[sectionManagedObject.entity.name isEqualToString:@"ClinicianGroupEntity"]) {
                    
                    
                    
                    ClientGroupEntity *clientGroup=(ClientGroupEntity *)sectionManagedObject;
                                        
                    
                    
                    [objectSection commitCellChanges];
                    
                    
                    groupName=clientGroup.groupName;
                    
                    
                }
                else {
                    [appDelegate displayNotification:@"Enter a group name to delete." forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
                    return;
                }
                
            }
             BOOL groupNameAlreadyExistsInAB=NO;
           
            if (groupName && groupName.length) {
                if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
                {
                 
                
               ABAddressBookRef addressBookToGetGroups=ABAddressBookCreate();
                
                int sourceID=[self defaultABSourceID];
                
                
                source=ABAddressBookGetSourceWithRecordID(addressBookToGetGroups, sourceID);
                
                
                
                NSArray *ptABGroupsArray=[NSArray arrayWithArray:(NSArray *)[self addressBookGroupsArray]];
               
                for (PTABGroup *groupInArray in ptABGroupsArray){
                    if ([groupInArray.groupName isEqualToString:groupName]) {
                        
                        groupNameAlreadyExistsInAB=YES;
                        
                        group=groupInArray;
                        break;
                        
                    }
                }
                

            
         
            
            
            
            if (groupNameAlreadyExistsInAB) {
                NSString *alertMessage=[NSString stringWithFormat:@"Do you wish to delete the %@ group from the address book?", groupName];
                UIAlertView *deleteConfirmAlert=[[UIAlertView alloc]initWithTitle:@"Remove Group From Address Book" message:alertMessage delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes, Delete it", nil];
                deleteConfirmAlert.tag=1;
                groupRecordIDToDeleteOrImport=group.recordID;
                detailViewSuperview=tableViewModel.viewController.view.superview;
                
                [deleteConfirmAlert show];
                //                      
           
            } else {
                [appDelegate displayNotification:@"This group was not found in the Address Book" forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
            }
            
                if (source) {
                    CFRelease(source);
                }
            
                if (addressBookToGetGroups) {
                    CFRelease(addressBookToGetGroups);
                }
               
            }
            
            }
            }
         
        
            
			break;
		case 303:
        {
            
            
            
            SCTableViewSection *section=[tableViewModel sectionAtIndex:indexPath.section];
            NSString *groupName=nil;
            PTABGroup *group=nil;
            
            
            if ([section isKindOfClass:[SCObjectSection class]]) {
                SCObjectSection *objectSection=(SCObjectSection *)section;
                
                
                NSManagedObject *sectionManagedObject=(NSManagedObject *)section.boundObject;
                
                
                
                
                if ([objectSection valuesAreValid] && sectionManagedObject && [sectionManagedObject respondsToSelector:@selector(entity)]&&[sectionManagedObject.entity.name isEqualToString:@"ClinicianGroupEntity"]) {
                    
                    
                    
                    ClientGroupEntity *clientGroup=(ClientGroupEntity *)sectionManagedObject;
                    
                    
                    
                    [objectSection commitCellChanges];
                    
                    
                    groupName=clientGroup.groupName;
                    
                    
                }
                else {
                    [appDelegate displayNotification:@"Enter a group name to import." forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
                    return;
                }
                
            }
            BOOL groupNameAlreadyExistsInAB=NO;
            
            if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
            {
            ABAddressBookRef addressBookToGetTheGroup=ABAddressBookCreate();
            if (groupName && groupName.length) {
                
                
                source=nil;
              
                
                int sourceID=[self defaultABSourceID];
                
                if (!source && sourceID>-1) {
                    source=ABAddressBookGetSourceWithRecordID(addressBookToGetTheGroup, sourceID);

                }
                               
                
                
                NSArray *ptABGroupsArray=[NSArray arrayWithArray:(NSArray *)[self addressBookGroupsArray]];
                
                for (PTABGroup *groupInArray in ptABGroupsArray){
                    if ([groupInArray.groupName isEqualToString:groupName]) {
                        
                        groupNameAlreadyExistsInAB=YES;
                        
                        group=groupInArray;
                        break;
                        
                    }
                }
                
                
                
            }
            if (!groupNameAlreadyExistsInAB) {
                [appDelegate displayNotification:@"Group not found in the Address Book." forDuration:3.0 location:kPTTScreenLocationTop inView:tableViewModel.viewController.view.superview];
                
               
                if (addressBookToGetTheGroup) {
                    CFRelease(addressBookToGetTheGroup);
                }
                
                return;
            }

            
            
                
                CFArrayRef allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBookToGetTheGroup, source);
                
                int groupCount=0;
                if (allGroupsInSource) {
                    groupCount=CFArrayGetCount(allGroupsInSource);
                    
                    CFRelease(allGroupsInSource);
                }

                PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
                
                if (groupCount>0) {
                    
                    
                    
                    ABRecordRef abGroup=(ABRecordRef)ABAddressBookGetGroupWithRecordID(addressBookToGetTheGroup, group.recordID);
                    CFArrayRef groupMembers;
                    groupMembers=nil;
                    
                    if (abGroup) {
                        groupMembers =(CFArrayRef )ABGroupCopyArrayOfAllMembers(abGroup);
                       
                    }
                  
                    int groupMembersCount=0;
                    
                    if (groupMembers) {
                        groupMembersCount= CFArrayGetCount(groupMembers);
                        
                            CFRelease(groupMembers);
                        
                    }
                    
                    
                    if (groupMembersCount>0) {
                        
                        
                        
                        NSString *alertMessage;
                        if (groupMembersCount==1) {
                            alertMessage= [NSString stringWithFormat:@"Do you wish to import %i contact from the Address Book %@ group?",groupMembersCount, ( NSString *)groupName];
                        }
                        else {
                            alertMessage= [NSString stringWithFormat:@"Do you wish to import %i contacts from the Address Book %@ group?",groupMembersCount, groupName];
                        }
                       
                        UIAlertView *importConfirmAlert=[[UIAlertView alloc]initWithTitle:@"Import Contacts" message:alertMessage delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
                        importConfirmAlert.tag=2;
                        detailViewSuperview=tableViewModel.viewController.view.superview;
                        groupRecordIDToDeleteOrImport=group.recordID;
                        [importConfirmAlert show];
                        
                        
                    
                        //                        
                    }
                    else {
                        
                        
                        
                        [appDelegate displayNotification:@"This group does not have any members to import." forDuration:3.0 location:kPTTScreenLocationTop inView:nil];
                        
                    }
                    
                    
                    
                }
                else {
                    [appDelegate displayNotification:@"Unable to find Group. Must specify an existing Address Book group with members to import." forDuration:4.0 location:kPTTScreenLocationTop inView:nil];
                }
                
            
            
//            NSString *currentNameString=[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookGroupName];
            
            
            if (addressBookToGetTheGroup) {
                CFRelease(addressBookToGetTheGroup);
            }
            if (source) {
                CFRelease(source);
            }

            }
        
        }
            break;
            
        case 304:
        {
            
            
                        
            
            
            
            

            
        }    
     
            break;
        case 305:
        {
            
            if ([SCUtilities systemVersion]<6) {
           
            
            ABPeoplePickerNavigationController *peoplePicker=[[ABPeoplePickerNavigationController alloc]init];
            
            peoplePicker.peoplePickerDelegate = self;
            // Display only a person's phone, email, and birthdate
            NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty], 
                                       [NSNumber numberWithInt:kABPersonEmailProperty],
                                       [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
            
            
            peoplePicker.displayedProperties = displayedItems;
            // Show the picker 
            
            
           
            
            [peoplePicker shouldAutorotateToInterfaceOrientation:YES];
            [peoplePicker setEditing:YES];
            
            [peoplePicker setPeoplePickerDelegate:self];
            
            
            // Display only a person's phone, email, and birthdate
            //	NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty], 
            //                               [NSNumber numberWithInt:kABPersonEmailProperty],
            //                               [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
            
            
            
            //	abToDisplay.peoplePicker.displayedProperties=displayedItems;
            // Show the picker 
            
            
            [tableViewModel.viewController.navigationController presentModalViewController:peoplePicker animated:YES];
            
            

            
            
//            NSString *groupNameString = (NSString *)[tableViewModel.modelKeyValues valueForKey:@"groupNameString"];
			
            }
           
            break; 
        
        
        }
    }
//    addressBook=nil;
//    
//   
}    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    switch (alertView.tag) {
       
            
case 1:
           
    if (buttonIndex==1) {
        
        
        
        if ([SCUtilities systemVersion]<6) {
       
//        BOOL autoAddClinicianToGroup=[[NSUserDefaults standardUserDefaults]boolForKey:kPTAutoAddClinicianToGroup];
        PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;

        if (groupRecordIDToDeleteOrImport>-1) 
        {
            if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
            {
           
              ABAddressBookRef  addressBookAfterAlert=ABAddressBookCreate();
            
       
            if (addressBookAfterAlert) {
            
                int CFGroupCount = ABAddressBookGetGroupCount((ABAddressBookRef) addressBookAfterAlert);
                
                if ( CFGroupCount >0) {
                    
                    
                    ABRecordRef group=nil;
                    group=(ABRecordRef)ABAddressBookGetGroupWithRecordID(addressBookAfterAlert, groupRecordIDToDeleteOrImport);
                    bool   didRemove=NO;
                    if (group) {

            
            
            
                        didRemove =  (bool)   ABAddressBookRemoveRecord((ABAddressBookRef) addressBookAfterAlert, (ABRecordRef) group, nil);
                        
                        
                        BOOL wantToSaveChanges=TRUE;
                        bool didSave=FALSE;
                        if (ABAddressBookHasUnsavedChanges(addressBookAfterAlert)) {
                            
                            if (wantToSaveChanges) {
                                
                                didSave = ABAddressBookSave(addressBookAfterAlert, nil);
                                
    //                            if (!didSave) {/* Handle error here. */  }
    //                            else 
                            } 
                            else {
                                
                                ABAddressBookRevert(addressBookAfterAlert);
                                
                            }
                            
                        }
                        
                        
                        if (!didRemove ||!didSave) {
                            
                            

                            [appDelegate displayNotification:@"Not able to remove the group" forDuration:3.0 location:kPTTScreenLocationTop inView:detailViewSuperview];
                        }
                        else 
                        {
                            [appDelegate displayNotification:@"Group Successfully Removed" forDuration:3.0 location:kPTTScreenLocationTop inView:detailViewSuperview];
                        }
                    
                        group=nil;
                        
                    
                    
                    }
                    else {
                        [appDelegate displayNotification:@"Group not found." forDuration:3.0 location:kPTTScreenLocationTop inView:detailViewSuperview];
                    }
                }
                if (addressBookAfterAlert) {
                    CFRelease(addressBookAfterAlert);
                }
                    detailViewSuperview=nil;
                    groupRecordIDToDeleteOrImport=-1;
            }
    
            }}}}
    break;
//                        
//                        [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:kPTTAddressBookGroupName];
//                        [[NSUserDefaults standardUserDefaults] setInteger:-1 forKey:kPTTAddressBookGroupIdentifier];
//                        [[NSUserDefaults standardUserDefaults ]synchronize];
//                        
//                        SCTableViewSection *section=(SCTableViewSection *)[objectsModel sectionAtIndex:2];
//                        
//                        SCSelectionCell *selectionCell=(SCSelectionCell*)[section cellAtIndex:0];
//                        
//                        
//                        
//                        selectionCell.label.text=@"";
//                        
//                        SCTableViewCell *controlCell=(SCTableViewCell *)[section cellAtIndex:1];
//                        
//                        UITextField *textField=(UITextField *)[controlCell viewWithTag:1];
//                        textField.text=@"";
//                        
//                        [_valuesDictionary setValue:@"" forKey:@"groupNameString"];
//                       [ _valuesDictionary setValue:[NSNumber numberWithBool:FALSE] forKey:@"autoAddClinicianToGroup"];
//                        [[NSUserDefaults standardUserDefaults]setBool:FALSE forKey:kPTAutoAddClinicianToGroup];
//                        [controlCell reloadBoundValue];
//                        
//                        NSMutableArray *mutableArray=[NSMutableArray arrayWithArray:selectionCell.items];
//                        if ([selectionCell.selectedItemIndex integerValue]<selectionCell.items.count) {
//                            [mutableArray removeObjectAtIndex:[selectionCell.selectedItemIndex integerValue]];
//                            selectionCell.selectedItemIndex=[NSNumber numberWithInt:-1];
//                            NSArray *selectionCellItems=(NSArray *)selectionCell.items;
//                            selectionCellItems=mutableArray;
//
//                        }
//                        [selectionCell reloadBoundValue];
//                        [selectionCell reloadInputViews];
//                    }
//                    
//                }
//                else 
//                {
//                    [appDelegate displayNotification:@"Group not available to delete." forDuration:3.0 location:kPTTScreenLocationTop inView:nil];
//                }
//                
//            }
//           
//        }
//        if (addressBook) {
//            CFRelease(addressBook);
//        }
//        
//        
//    }
////    else {
////        
////    }
//
//    }
//    
    case 2:
        {
        
        
            

            if (buttonIndex==1) {
                if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
                {
                [self importAllContactsInGroup];
                }
            }
        }
            break;
    }
}
//-(void)tableViewModel:(SCTableViewModel *)tableViewModel didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    SCTableViewCell *cell=(SCTableViewCell *)[tableViewModel cellAtIndexPath:indexPath];
//    
//    if (tableViewModel.tag==0)
//        
//    {
//        
//        if (indexPath.section==1) {
//            
//            switch (cell.tag) {
//                case 0:
//                {
//                    EKCalendarChooser *calendarChooser=[[EKCalendarChooser alloc]initWithSelectionStyle:EKCalendarChooserSelectionStyleSingle displayStyle:EKCalendarChooserDisplayAllCalendars eventStore:self.eventStore];
//                    
//                    calendarChooser.showsCancelButton=YES;
//                    NSMutableSet *set=[NSMutableSet setWithObject:self.psyTrackCalendar];
//                    
//                    [calendarChooser setSelectedCalendars:set];
//                    
//                    [calendarChooser setDelegate:self];
//                    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:calendarChooser];	
//                    
//                    
//                    [[self navigationController] presentModalViewController:navController animated:YES];
//                    
//                    
//                    
//                    
//                }
//                    
//                case 2:
//                {
//                    
//                    
//                    
//                }
//                    
//                    break;
//                    
//                default:
//                    break;
//            }
//        
//                
//    }
//    else {
//        SCTableViewSection *section=(SCTableViewSection *)[tableViewModel sectionAtIndex:indexPath.section];
//        if ([section isKindOfClass:[SCObjectSelectionSection class]]) {
//            SCObjectSelectionSection *objSelectionSection=(SCObjectSelectionSection *)section;
//            
//            [objSelectionSection dispatchEventSelectRowAtIndexPath:indexPath];
//        }
//        
//        if ([section isKindOfClass:[SCArrayOfObjectsSection class]]) {
//            SCArrayOfObjectsSection *arrayOfObjectsSection=(SCArrayOfObjectsSection *)section;
//            
//            [arrayOfObjectsSection dispatchEventSelectRowAtIndexPath:indexPath];
//        }
//        
//    }
//    }
//}

-(void)tableViewModel:(SCTableViewModel *)tableViewModel willDisplayCell:(SCTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

//    if (tableViewModel.tag==1 &&tableViewModel.sectionCount) {
//        SCTableViewSection *section=[tableViewModel sectionAtIndex:0];
//        
//        if (section.cellCount) {
//            SCTableViewCell *cell=[section cellAtIndex:0];
//           
//            
//            
//            
//            if ([cell.boundObject isKindOfClass:[MySource class]]) {
//                MySource *mySource=(MySource *)cell.boundObject;
//                
//                cell.textLabel.text=@"test";
//                
//            }
//            
//        }
//        
//    }




}
-(void)tableViewModel:(SCTableViewModel *)tableViewModel valueChangedForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (tableViewModel.tag==0)
//        
//    {
//        SCTableViewCell *cell=(SCTableViewCell *)[tableViewModel cellAtIndexPath:indexPath];
//        
//        
//        switch (cell.tag) {
//            case 1:
//            {
//                
//                if ([cell isKindOfClass:[SCTextFieldCell class]]) {
//                    SCTextFieldCell *calendarNameTextFieldCell=(SCTextFieldCell *)cell;
//                    UITextField *caladnerNameTextField=(UITextField *) calendarNameTextFieldCell.textField;
//                    
//                    [self.psyTrackCalendar setTitle:(NSString *)caladnerNameTextField.text]; 
//                    
//                    NSError *error;
//                    
//                    if (![self.eventStore saveCalendar:self.psyTrackCalendar commit:YES error:&error ]) 
//                    {
//                        
//                    }
//                    else
//                    {
//                        
//                        NSString *calenderIdentifier=self.psyTrackCalendar.calendarIdentifier;
//                        [[NSUserDefaults standardUserDefaults] setValue:calenderIdentifier forKey:@"defaultCalendarIdentifier"];
//                        [[NSUserDefaults standardUserDefaults] setValue:psyTrackCalendar.title forKey:@"calendar_name"];
//                        
//                        [[NSUserDefaults standardUserDefaults]synchronize];
//                        
//                        SCTableViewSection *section=(SCTableViewSection *)[tableViewModel sectionAtIndex:indexPath.section];
//                        SCTableViewCell *firstCalendarCell=(SCTableViewCell *)[section cellAtIndex:0];
//                        
//                        if ([firstCalendarCell isKindOfClass:[SCLabelCell class]]) {
//                            SCLabelCell * calendarSelectionLabelCell=(SCLabelCell *)firstCalendarCell;
//                            
//                            [calendarSelectionLabelCell.label setText:[self.psyTrackCalendar title] ];
//                            
//                        }
//                        
//                        
//                        //                 NSSet *calendars=(NSSet *)[localSource calendars];
//                        //                    for(id obj in calendars) { 
//                        //                    if([obj isKindOfClass:[EKCalendar class]]){
//                        //                        EKCalendar *calendar=(EKCalendar *)obj;
//                        //                        if ([calendar.calendarIdentifier isEqualToString:self.psyTrackCalendar.calendarIdentifier]) {
//                        //                            self.psyTrackCalendar=(EKCalendar *)calendar;
//                        //                          
//                        //                            break;
//                        //                        }
//                        
//                        
//                        //                    }
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                
//            }
//                break;
//            case 2:
//            {
//                
//                if ([cell isKindOfClass:[SCTextFieldCell class]]) {
//                    SCTextFieldCell *calendarLocationTextFieldCell=(SCTextFieldCell *)cell;
//                    UITextField *caladnerLocationTextField=(UITextField *) calendarLocationTextFieldCell.textField;
//                    
//                    
//                    [[NSUserDefaults standardUserDefaults] setValue:caladnerLocationTextField.text forKey:@"calander_location"];
//                    
//                    [[NSUserDefaults standardUserDefaults]synchronize];
//                    
//                }
//                
//            }
//                break;
//            case 3:
//            {
//                SCTableViewSection *groupsSection=(SCTableViewSection *)[tableViewModel sectionAtIndex:2];
//                SCTableViewCell *groupsArraySelection=(SCTableViewCell*)[groupsSection cellAtIndex:0];
//                
//                
//                [groupsArraySelection reloadBoundValue];
//                [groupsArraySelection reloadInputViews];
//                
//                SCTableViewCell *groupNameCell=(SCTableViewCell *)[groupsSection cellAtIndex:1];
//                
//                [groupNameCell reloadBoundValue];
//                [groupNameCell reloadInputViews];
//                
//                
//            }
//                break;
//            case 4:
//            {
//                @try {
//                    ABAddressBookRef addressBook=ABAddressBookCreate();
//                
//                    
//                
//                if ([cell isKindOfClass:[SCSelectionCell class]]) {
//                    SCSelectionCell *selectionCell=(SCSelectionCell *)cell;
//                    
//                    int groupIdentifier;
//                    if ([selectionCell selectedItemIndex]) {
//                        
//                        
//                        groupIdentifier=(int)[(NSNumber *)[dictionaryABGroupIdentifierValueForArrayOfStringsIndexKey objectForKey:[[selectionCell selectedItemIndex]stringValue]]intValue];
//                        
//                        
//                        
//                        
//                        [[NSUserDefaults standardUserDefaults] setInteger:groupIdentifier forKey:kPTTAddressBookGroupIdentifier];
//                        
//                        
//                        
//                        
//                        
//                        ABRecordRef source=nil;
//                        int sourceID=[self defaultABSourceID];
//                        source=ABAddressBookGetSourceWithRecordID(addressBook, sourceID);
//                        
//                        
//                        CFArrayRef allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBook, source);
//                        
//                        int groupCount;
//                        if (allGroupsInSource) {
//                            
//                            groupCount=CFArrayGetCount(allGroupsInSource);
//                            
//                        }
//
//                        
//                        
//                        
//                        if (!groupCount) {[self changeABGroupNameTo:(NSString *)[NSString string] addNew:YES checkExisting:NO];}
//                        
//                         
//                        groupCount=ABAddressBookGetGroupCount((ABAddressBookRef) addressBook);
//                        
//                        if (groupCount) {
//                            
//                            
//                            
//                    
//                            
//                            ABRecordRef group;
////                            
//
//                             group=(ABRecordRef)ABAddressBookGetGroupWithRecordID((ABAddressBookRef )addressBook, (ABRecordID)groupIdentifier);
//                            
//                            if (group) {
//                            CFStringRef chosenGroupName=(CFStringRef) ABRecordCopyValue((ABRecordRef) group, (ABPropertyID) kABGroupNameProperty);
//                            
//                                
//                                                            
//                            
//                            [[NSUserDefaults standardUserDefaults] setValue:(__bridge NSString *)chosenGroupName forKey:kPTTAddressBookGroupName];
//                            
//                            
//                            [[NSUserDefaults standardUserDefaults]synchronize];
//                            
//                            [_valuesDictionary setValue:(__bridge NSString *)chosenGroupName forKey:@"groupNameString"];
//                            
//                            SCTableViewSection *section=(SCTableViewSection *)[tableViewModel sectionAtIndex:2];
//                            SCTableViewCell *groupNameCell=(SCTableViewCell *)[section cellAtIndex:1];
//                            UITextField *textField=(UITextField *)[groupNameCell viewWithTag:1];
//                            textField.text=(__bridge NSString *)chosenGroupName;
//                                CFRelease(chosenGroupName); 
//                                CFRelease(group);
//
//                            }
//
//                            
//                            
//                        }
//                    }
//                    if (addressBook!=NULL) {
//                        CFRelease(addressBook);
//                    }
//                    
//                    
//                }
//                }
//                @catch (NSException *exception) {
//                    PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
//                    
//                    [appDelegate displayNotification:@"Problem Connecting to Address Book Occured" forDuration:3.0 location:kPTTScreenLocationTop inView:nil];
//                }
//                
//                @finally {
//                    
//                }  
//                 
//            }
//                break;
//            case 5:
//            {
//                if ([cell isKindOfClass:[SCCustomCell class]]) {
//                
//                
//                
//                    BOOL autoAddClinicianToGroup=(BOOL)[(NSNumber *)[_valuesDictionary valueForKey:@"autoAddClinicianToGroup"]boolValue];
//                    
//                    BOOL autoAddCliniciansAlreadySet=[[NSUserDefaults standardUserDefaults]boolForKey:kPTAutoAddClinicianToGroup];
//                    
//                    //so it runs only if the switch has changed.
//                    if (autoAddClinicianToGroup!=autoAddCliniciansAlreadySet) {
//                    
//                    [[NSUserDefaults standardUserDefaults] setBool:autoAddClinicianToGroup forKey:kPTAutoAddClinicianToGroup];
//                    
//                    
//                    if (autoAddClinicianToGroup) {
//                        
//                         NSString *groupNameString = (NSString *)[_valuesDictionary valueForKey:@"groupNameString"];
//                        
//                         [[NSUserDefaults standardUserDefaults] setBool:autoAddClinicianToGroup forKey:kPTAutoAddClinicianToGroup];
//                       
//                        [self changeABGroupNameTo:groupNameString addNew:NO checkExisting:YES];
//                        
//                        [self  tableViewModel:(SCTableViewModel *)tableViewModel willConfigureCell:(SCTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath];
//                        [cell reloadBoundValue];
//                       [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:kPTAutoAddClinicianToGroup];
//                        
//                        groupArray=[self addressBookGroupsArray];
//                        
//                        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:kPTAutoAddClinicianToGroup];
//                       
//                        
//                        
//                        int  groupCount=groupArray.count;
//                        
//                        
//                        
//                        
//                        
//                        SCTableViewSection *section=(SCTableViewSection *)[tableViewModel sectionAtIndex:2];
//                        SCSelectionCell *aBGroupSelectionCell=(SCSelectionCell *)[section cellAtIndex:0];
//
//                        NSNumber *selectedIndex=nil;
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        if (groupCount) {
//                            //                   NSNumber * groupIdentifierNumber=[dictionaryABGroupIdentifierValueForArrayOfStringsIndexKey valueForKey:(NSString *)[selectedIndex stringValue]];
//                            //                    
//                            
//                            
//                            //                    int groupIdentifierInt=[groupIdentifierNumber intValue];
//                            
//                            //                    ABRecordRef CFGroupRecord=(ABRecordRef)ABAddressBookGetGroupWithRecordID((ABAddressBookRef )addressBook, (ABRecordID)groupIdentifierInt);
//                            ////                    
//                            //                    
//                            //                    ABRecordSetValue((ABRecordRef) CFGroupRecord, (ABPropertyID) kABGroupNameProperty, (__bridge  CFStringRef)groupNameString, nil);
//                            
//                            
//                            //                    BOOL wantToSaveChanges=TRUE;
//                            //                    if (ABAddressBookHasUnsavedChanges(addressBook)) {
//                            //                        
//                            //                        if (wantToSaveChanges) {
//                            //                            bool didSave=FALSE;
//                            //                            didSave = ABAddressBookSave(addressBook, nil);
//                            //                            
//                            //                            if (!didSave) {/* Handle error here. */  }
//                            //                            else 
//                            //                        } 
//                            //                        else {
//                            //                            
//                            //                            ABAddressBookRevert(addressBook);
//                            //                            
//                            //                        }
//                            //                        
//                            //                    }
//                            NSNumber *groupIdentifierNumber=(NSNumber *)[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookGroupIdentifier];
//                            NSArray * aBGroupSelectionCellItems=aBGroupSelectionCell.items;
//                            aBGroupSelectionCellItems=groupArray;
//                            selectedIndex=nil;
//                            
//                            selectedIndex=(NSNumber *)[ dictionaryArrayOfStringsIndexForGroupIdentifierKey valueForKey:[groupIdentifierNumber stringValue]];
//                            
//                            if (selectedIndex!=nil) {
//                                [aBGroupSelectionCell setSelectedItemIndex:selectedIndex];
//                            }
//                            
//                            
//                            NSString *groupNameString = (NSString *)[_valuesDictionary valueForKey:@"groupNameString"];
//                            aBGroupSelectionCell.label.text=groupNameString;
//                            
//                            
//                        }
//
//                        
//                    }
//                    
//                    
//                    
//                    //                        
//                    //                        [[NSUserDefaults standardUserDefaults]synchronize];
//                
//                }
//                
//                //                if ([cell isKindOfClass:[SCTextFieldCell class]]) {
//                //                   
//                //                      
//                //                    SCTextFieldCell *groupNameTextFieldCell=(SCTextFieldCell *)cell;
//                //                    UITextField *groupNameTextField=(UITextField *) groupNameTextFieldCell.textField;
//                //                  
//                //                    
//                //                   
//                //                        
//                //                   
//                //                                        
//                //                    
//                //                    SCTableViewSection *section=(SCTableViewSection*)[tableViewModel sectionAtIndex:1];
//                //                    SCSelectionCell *groupSelectionCell=(SCSelectionCell *)[section cellAtIndex:0];
//                //                    
//                //                    if ([groupSelectionCell.selectedItemIndex intValue] <[groupSelectionCell.items count]) {
//                //                        
//                //                        [[NSUserDefaults standardUserDefaults] setValue:groupNameTextField.text forKey:kAddressBookGroupName];
//                //                        
//                //                        [[NSUserDefaults standardUserDefaults]synchronize];
//                //                        
//                //                        [self changeABGroupNameTo:(NSString *)groupNameTextField.text];
//                //                        if ( [groupSelectionCell.selectedItemIndex intValue]< groupSelectionCell.items.count &&[groupSelectionCell.selectedItemIndex intValue]>-1) {
//                //                            
//                //                        
//                //                        NSString *groupNameInStringsArray=(NSString *)[groupSelectionCell.items objectAtIndex: [groupSelectionCell.selectedItemIndex intValue] ];
//                //                        
//                //                        
//                //                        groupNameInStringsArray =[[NSUserDefaults standardUserDefaults] valueForKey:kAddressBookGroupName];
//                //                        groupSelectionCell.label.text=groupNameTextField.text;
//                //                        }
//                ////                        int groupIdentifier=[[NSUserDefaults standardUserDefaults] integerForKey:kPTTAddressBookGroupIdentifier];
//                ////                        if (groupIdentifier!=-1) {
//                ////                        groupSelectionCell.items=[self addressBookGroupsArray];
//                ////                        }
//                //
//                //                    }
//                //                                      
//                //                    //                    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[tableViewModel indexPathForCell:groupSelectionCell]] withRowAnimation:(UITableViewRowAnimation)UITableViewRowAnimationRight];
//                //                    
//                //                }         
//                [[NSUserDefaults standardUserDefaults]synchronize];
//                }
//            }
//                break;    
//                
//            default:
//                break;
//        }
//    }
//    
}


#pragma mark -
#pragma mark PeoplePicker delegate methods
-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{


    [peoplePicker dismissViewControllerAnimated:YES completion:nil];

}


- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{

    return YES;
  
  

}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{

    return YES;


}



//-(void)tableViewModel:(SCTableViewModel *)tableViewModel didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    SCTableViewCell *cell=(SCTableViewCell *)[tableViewModel cellAtIndexPath:indexPath];
//    
//    
//    if (indexPath.section==1 && cell.tag==4) {
//           
//    SCTableViewSection *section=(SCTableViewSection*)[tableViewModel sectionAtIndex:1];
//    SCTextFieldCell *groupNameTextFieldCell=(SCTextFieldCell *)[section cellAtIndex:1];
//    UITextField *groupNameTextField=(UITextField *) groupNameTextFieldCell.textField;
//
//    [self changeABGroupNameTo:(NSString *)groupNameTextField.text];
//    SCSelectionCell *groupSelectionCell=(SCSelectionCell *)[section cellAtIndex:0];
//    groupSelectionCell.items=[self addressBookGroupsArray];
//    
//    
//    
//    }
//    [detailTableViewModel reloadBoundValues];
//
//    [detailTableViewModel.modeledTableView reloadData];
//
//
//
//}


#pragma mark -
#pragma mark additonal Methods for working with address book
//-(NSArray *)addressBookGroupsArray{
//
//    ABAddressBookRef addressBook=nil;
//    @try {
//        
//        addressBook=ABAddressBookCreate();        
//        
//    }
//    @catch (NSException *exception) {
//        PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
//        
//        
//        [appDelegate displayNotification:@"Not able to access Address Book" forDuration:3.0 location:kPTTScreenLocationTop inView:appDelegate.window];
//        return nil;
//    }
//    @finally 
//    {
//        BOOL autoAddClinicianToGroup=[[NSUserDefaults standardUserDefaults]boolForKey:kPTAutoAddClinicianToGroup];
//        ABRecordRef group=nil;
//       
//        int groupIdentifier=-1;
//        if ([[NSUserDefaults standardUserDefaults] objectForKey:kPTTAddressBookGroupName])
//        {
//            
//         groupIdentifier=(NSInteger )[[NSUserDefaults standardUserDefaults] integerForKey:kPTTAddressBookGroupIdentifier];
//        }
//            
//        if (groupIdentifier>0) {
//        
//            
//          group=  ABAddressBookGetGroupWithRecordID((ABAddressBookRef) addressBook, groupIdentifier);
//            
//        }
//           
//            
//            
//            
//            
//        CFStringRef CFGroupName;
//                
//        if ([[NSUserDefaults standardUserDefaults] objectForKey:kPTTAddressBookGroupName]) {
//            
//            CFGroupName=(__bridge CFStringRef)[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookGroupName];  
//            
//        }
//        else {
//            @try {
//                 NSString *userDefaultName=[PTTAppDelegate retrieveFromUserDefaults:@"abgroup_name"];
//            
//                
//                CFGroupName=(__bridge_retained  CFStringRef)userDefaultName;
//            
//            }
//            @catch (NSException *exception) {
//                PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
//                
//
//                [appDelegate displayNotification:@"Unable to access addressbook settings" forDuration:3.0 location:kPTTScreenLocationTop inView:appDelegate.window];
//            }
//            @finally {
//            
//            }
//           
//            
//        }
//        
//        
//        
//        
//        if ((!CFGroupName || !CFStringGetLength(CFGroupName) )&& autoAddClinicianToGroup) {
//            NSString *clinicians=@"Clinicians";
//            CFGroupName=(__bridge CFStringRef)clinicians;
//            [[NSUserDefaults standardUserDefaults] setValue:(__bridge NSString*)CFGroupName forKeyPath:kPTTAddressBookGroupName];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            
//        }
//                
//              
//            //check to see if the group name exists already
//           
//        ABRecordRef source=nil;
//        
//        
//        int sourceID=[self defaultABSourceID];
//        
//    
//        
//        source=ABAddressBookGetSourceWithRecordID(addressBook, sourceID);
//      
//        
//        CFArrayRef allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBook, source);
//        int groupCount=CFArrayGetCount(allGroupsInSource);
//        
//        
//   
//        
//        
//            CFStringRef CFGroupNameCheck ;
//            ABRecordRef groupInCheckNameArray;
//            if (groupCount&&!group ) {
//                
//                
//                
//                
//                
//                for (CFIndex i = 0; i < groupCount; i++) {
//                    groupInCheckNameArray = CFArrayGetValueAtIndex(allGroupsInSource, i);
//                    CFGroupNameCheck  = ABRecordCopyValue(groupInCheckNameArray, kABGroupNameProperty);
//                    
//                    
//                    CFComparisonResult result=  (CFComparisonResult) CFStringCompare (
//                                                                                      ( CFStringRef)CFGroupName,
//                                                                                      (CFStringRef) CFGroupNameCheck,
//                                                                                      1
//                                                                                      );
//                    
//                    
//                    if (result==0) {
//                        group=groupInCheckNameArray;
//                        break;
//                    }
////                    CFRelease(CFGroupsCheckNameArray); 
////                    CFRelease(CFGroupNameCheck);
//                    
//                    
//                    
//                }
//            }
//            
//        
//        
//
//    
//    
//    
//    
//     
//    NSMutableArray *allGroups;
//      
//    
//    
//      
//    if (!group) {
//                
//        [self changeABGroupNameTo:(__bridge NSString*) CFGroupName addNew:YES checkExisting:NO];
//        
//      
//        
//        
//        groupIdentifier=(NSInteger )[(NSNumber *)[[NSUserDefaults standardUserDefaults]valueForKey:kPTTAddressBookGroupIdentifier]intValue];
//        group=ABAddressBookGetGroupWithRecordID((ABAddressBookRef) addressBook, groupIdentifier);
//        
////        //        ABRecordRef CFAddressBookGroupRecord =  ABGroupCreate ();
////        
////        group=ABGroupCreate();
////        
////        //        ABRecord *groupRecord=(ABRecord *)[group getRecordRef];
////        
////        //        
////        
////        bool didSetGroupName=FALSE;
////        didSetGroupName= (bool) ABRecordSetValue (
////                                                  group,
////                                                  (ABPropertyID) kABGroupNameProperty,
////                                                  (__bridge CFStringRef)groupName  ,
////                                                  nil
////                                                  );  
////        //        
////        
////        BOOL wantToSaveChanges=TRUE;
////        if (ABAddressBookHasUnsavedChanges(addressBook)) {
////            
////            if (wantToSaveChanges) {
////                bool didSave=FALSE;
////                didSave = ABAddressBookSave(addressBook, nil);
////                
////                if (!didSave) {/* Handle error here. */}
////                
////            } 
////            else {
////                
////                ABAddressBookRevert(addressBook);
////                
////            }
////            
////        }
////        
////        //        ABRecord *groupRecord=[[ABRecord alloc]initWithABRef:(CFTypeRef)kABGroupType ];
////        
////        
////
////        
////        groupIdentifier=ABRecordGetRecordID(group);
////        
////        
////        [[NSUserDefaults standardUserDefaults] setInteger:(int )groupIdentifier forKey:kPTTAddressBookGroupIdentifier];
////        
////        [[NSUserDefaults standardUserDefaults]synchronize];
////            
////            
//        
//    } 
//        if (group!=NULL) {
//            CFRelease(group);
//        }
//    // Get the ABSource object that contains this new group
//    
//   
//      
//    NSNumber *groupIdentifierNumber=(NSNumber *)[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookGroupIdentifier];
//    
//    if ([groupIdentifierNumber isEqualToNumber:[NSNumber numberWithInt:(int)-1]]||[groupIdentifierNumber isEqualToNumber:[NSNumber numberWithInt:(int)0]]||!groupCount) {
//               
//        [ self changeABGroupNameTo:nil addNew:YES checkExisting:NO];
//        
//        
//    }
//    
//    
//    
//        allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBook, source);
//        groupCount=CFArrayGetCount(allGroupsInSource);
//        
//    if (groupCount) {
//   
//           allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBook, source);
//       
//        
//        if (allGroupsInSource) {
//        
//      
//        dictionaryABGroupIdentifierValueForArrayOfStringsIndexKey=[[NSMutableDictionary alloc]init];
//        dictionaryArrayOfStringsIndexForGroupIdentifierKey=[[NSMutableDictionary alloc]init];
//            allGroups = [[NSMutableArray alloc] init];
//            
//            ABRecordRef groupInCFArray;
////            CFStringRef CFGroupName ;
//            for (CFIndex i = 0; i < groupCount; i++) {
//               
//                groupInCFArray = CFArrayGetValueAtIndex(allGroupsInSource, i);
//                CFGroupName  = ABRecordCopyValue(groupInCFArray, kABGroupNameProperty);
//                int CFGroupID=ABRecordGetRecordID((ABRecordRef) groupInCFArray);
//                        
//                [allGroups addObject:(__bridge NSString*)CFGroupName];
//                NSDictionary *dicStringIndexValueForGroupIdendifierKey=[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:i] forKey:[[NSNumber numberWithInt:CFGroupID]stringValue]];
//                
//                NSDictionary *dicGroupIdendifierValueForStringIndexKey=[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:CFGroupID] forKey:[[NSNumber numberWithInt:i]stringValue]];
//                
//              [dictionaryABGroupIdentifierValueForArrayOfStringsIndexKey addEntriesFromDictionary:dicGroupIdendifierValueForStringIndexKey];
//              [ dictionaryArrayOfStringsIndexForGroupIdentifierKey addEntriesFromDictionary:dicStringIndexValueForGroupIdendifierKey];
//               
//               
//             
//            }     
//         
//            
//            
//            CFRelease(allGroupsInSource);
//    //        CFRelease(CFGroupName);
//            
//        }
//    
//    }
//        
//        if (source) {
//            CFRelease(source);
//        }
//        return allGroups;
//    }
//}


//-(void)synchronizeAddressBookGroupsForClinician:(ClinicianEntity *)clinicianToSync {
//    
//    
//    
//    
//    NSSet *clinicianGroups=clinicianToSync.groups;
//    NSArray *ptABGroupsArray=[NSArray arrayWithArray:(NSArray *)[self addressBookGroupsArray]];
//    
//    
//    
//    
//    for (ClinicianGroupEntity *clinicianGroup in clinicianGroups) {
//        if ([clinicianGroup.addressBookSync isEqualToNumber:[NSNumber numberWithBool:YES]]) {
//            
//            BOOL abGroupArrayContainsName=NO;
//            
//            PTABGroup *abGroupWithClinicianGroupName=nil;
//            for (PTABGroup *group in ptABGroupsArray){
//                if ([group.groupName isEqualToString:clinicianGroup.groupName]) {
//                    abGroupArrayContainsName=YES;
//                    abGroupWithClinicianGroupName=group;
//                    break;
//                    
//                    
//                    
//                }
//            }
//            
//            if (!abGroupArrayContainsName) {
//                [self changeABGroupNameTo:clinicianGroup.groupName addNew:YES checkExisting:NO];
//                ptABGroupsArray=[NSArray arrayWithArray:(NSArray *)[self addressBookGroupsArray]];
//                
//                for (PTABGroup *group in ptABGroupsArray){
//                    if ([group.groupName isEqualToString:clinicianGroup.groupName]) {
//                        abGroupArrayContainsName=YES;
//                        abGroupWithClinicianGroupName=group;
//                        break;
//                        
//                        
//                        
//                    }
//                }
//                
//                
//            }
//            if (abGroupArrayContainsName&& clinicianToSync.aBRecordIdentifier && ![clinicianToSync.aBRecordIdentifier isEqualToNumber:[NSNumber numberWithInt:-1]]) {
//                
//                
//                
//                
//                if (![self personWithRecordID:[clinicianToSync.aBRecordIdentifier intValue] ContainedInGroupWithID:abGroupWithClinicianGroupName.recordID]) {
//                    
//                    [self addPersonWithRecordID:[clinicianToSync.aBRecordIdentifier intValue] toGroupWithID:abGroupWithClinicianGroupName.recordID];
//                    
//                }  
//                
//                
//                
//            }
//            
//            
//            
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//}

-(NSArray *)addressBookGroupsArray{
    
    NSMutableArray *allGroups=[NSMutableArray array];
           
        //check to see if the group name exists already
    if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
    {
        ABAddressBookRef addressBookToBuildAddressBookGroupArray=ABAddressBookCreate();
    CFArrayRef allGroupsInSource=nil;
    allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBookToBuildAddressBookGroupArray, source);
        int groupCount=CFArrayGetCount(allGroupsInSource);
        
        
        
        
                
        
        
        
        
        
        
     
        
           
                       
           
            
            
            if (allGroupsInSource && groupCount) {
                
                
                
                allGroups = [[NSMutableArray alloc] init];
                
                
                //            CFStringRef CFGroupName ;
                for (CFIndex i = 0; i < groupCount; i++) {
                    
                    
                    
                    ABRecordRef groupInCFArray = CFArrayGetValueAtIndex(allGroupsInSource, i);
                    
                    CFStringRef cfGroupName=nil;

                    cfGroupName  = ABRecordCopyValue(groupInCFArray, kABGroupNameProperty);
                    int CFGroupID=ABRecordGetRecordID((ABRecordRef) groupInCFArray);
                    
                    PTABGroup *ptGroup=[[PTABGroup alloc]initWithName:(__bridge  NSString*)cfGroupName recordID:CFGroupID];
                    
                    [allGroups addObject:ptGroup];
                    
                    
                    
                    CFRelease(cfGroupName);
                }     
                
               
                  
                
            
                
                
                
            
   
 
        }
        if (addressBookToBuildAddressBookGroupArray) {
            CFRelease(addressBookToBuildAddressBookGroupArray);
        }
  
if (allGroupsInSource){
  CFRelease(allGroupsInSource);   

}
    }
     return allGroups;
 
    
}

-(BOOL)changeABGroupNameFrom:(NSString *)groupNameFrom To:(NSString *)groupNameTo  addNew:(BOOL)addNew checkExisting:(BOOL)checkExisting{
    BOOL successAtSettingName=NO; 
     
    if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
    {

    ABRecordRef group=nil;
        ABAddressBookRef addressBookToChangeABGroupName=ABAddressBookCreate();
        CFArrayRef allGroupsInSource=ABAddressBookCopyArrayOfAllGroupsInSource(addressBookToChangeABGroupName, source);
        int groupCount=CFArrayGetCount(allGroupsInSource);
        
        

     
      

    
                                  
        
    
    ABRecordRef groupInCheckNameArray=nil;
    if (groupNameFrom && groupNameFrom.length&& groupCount &&checkExisting) 
    {
        
        
        
        
        
        for (CFIndex i = 0; i < groupCount; i++) {
            groupInCheckNameArray = CFArrayGetValueAtIndex(allGroupsInSource, i);
           CFStringRef cfGroupNameCheck =nil;
            cfGroupNameCheck  = ABRecordCopyValue(groupInCheckNameArray, kABGroupNameProperty);
            
            
//            CFComparisonResult result=  (CFComparisonResult) CFStringCompare (
//                                                                              (__bridge CFStringRef)groupName,
//                                                                              (CFStringRef) CFGroupNameCheck,
//                                                                              1
//                                                                              );
            
            
            
            NSString *checkNameStr=[NSString stringWithFormat:@"%@",(__bridge NSString*) cfGroupNameCheck];
            
            
            if (cfGroupNameCheck) {
                CFRelease(cfGroupNameCheck);
            }  
           
            
            if ([checkNameStr isEqualToString:groupNameTo]) {
               
               
                successAtSettingName=YES;
                
               
                break;
            }
            else if([checkNameStr isEqualToString:groupNameFrom]){
                group=groupInCheckNameArray;
                break;
            }
//            CFRelease(CFGroupsCheckNameArray); 
//            CFRelease(CFGroupNameCheck);
            
        }
                
       
    
       
              
    
    }
    if (allGroupsInSource) {
        CFRelease(allGroupsInSource); 
    }
    if (successAtSettingName) {
        if (group) {
            CFRelease(group);
        }
        if (addressBookToChangeABGroupName) {
            CFRelease(addressBookToChangeABGroupName);
        }
        return successAtSettingName;
    }


    
    if (!group ||addNew) {
        
               
        if (!addressBookToChangeABGroupName) {
            
            return successAtSettingName;
        }
        //        ABRecordRef CFAddressBookGroupRecord =  ABGroupCreate ();
      
       
       ABRecordRef groupTroCreate=ABGroupCreateInSource(source);
        
        //        ABRecord *groupRecord=(ABRecord *)[group getRecordRef];
        
        //        
        
        
        //        
        
        bool didSetGroupName=FALSE;
        didSetGroupName= (bool) ABRecordSetValue (
                                                  groupTroCreate,
                                                  (ABPropertyID) kABGroupNameProperty,
                                                  (__bridge CFStringRef)groupNameTo  ,
                                                  nil
                                                  );  
        
        if (!didSetGroupName) {
               successAtSettingName=NO;
        }
        
        ABAddressBookAddRecord((ABAddressBookRef) addressBookToChangeABGroupName, (ABRecordRef) groupTroCreate, nil);
        
        
        BOOL wantToSaveChanges=TRUE;
        if (ABAddressBookHasUnsavedChanges(addressBookToChangeABGroupName)) {
            
            if (wantToSaveChanges) {
                bool didSave=FALSE;
                didSave = ABAddressBookSave(addressBookToChangeABGroupName, nil);
                
//                if (!didSave) {/* Handle error here. */  }
//                else 
                if (didSave) {
                    successAtSettingName=YES;
                }
            } 
            else {
                
                ABAddressBookRevert(addressBookToChangeABGroupName);
                
            }
            
    
        }
       
        //        ABRecord *groupRecord=[[ABRecord alloc]initWithABRef:(CFTypeRef)kABGroupType ];
        
        
        
        
        
        
        
        
        if (groupTroCreate) {
            CFRelease(groupTroCreate);
        }    
        
    } 
    else
    
    {
    
        BOOL wantToSaveChanges=TRUE;
       
         
        
        CFErrorRef error=nil;
        ABRecordSetValue(group, kABGroupNameProperty,(__bridge CFStringRef)groupNameTo, &error);
        
          
        
       
        if (error ==noErr && ABAddressBookHasUnsavedChanges(addressBookToChangeABGroupName)) 
        {
            
            if (wantToSaveChanges)
            {
                bool didSave=FALSE;
                didSave = ABAddressBookSave(addressBookToChangeABGroupName, nil);
                if (didSave) {
                    successAtSettingName=YES;
                }
            }
                
            else 
                {
                    
                    ABAddressBookRevert(addressBookToChangeABGroupName);
                    
                }
           
        }
            
        
        
        if (error  ){CFRelease(error);}
        }
                   
    if (group !=NULL) 
    {
        group=nil;
    }
    if (addressBookToChangeABGroupName) {
        CFRelease(addressBookToChangeABGroupName);
    }
    }
    return successAtSettingName;
}



-(void)importAllContactsInGroup{

    if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
    {


   
         ABAddressBookRef addressBookToImportContactsInGroup=ABAddressBookCreate();
    
   
    
//    int groupIdentifier=groupRecordIDToDeleteOrImport;
    
    ABRecordRef group=nil;
    if (groupRecordIDToDeleteOrImport>-1) {
        group=(ABRecordRef )ABAddressBookGetGroupWithRecordID(addressBookToImportContactsInGroup, groupRecordIDToDeleteOrImport);
    }
    
    
    if (addressBookToImportContactsInGroup && group) {
        CFArrayRef allPeopleInGroup=(CFArrayRef ) ABGroupCopyArrayOfAllMembers(group);
        
        int peopleInGroupCount=CFArrayGetCount(allPeopleInGroup);
        NSManagedObjectContext * managedObjectContext = [(PTTAppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
       
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ClinicianEntity" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];

        NSError *error = nil;
        NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if (fetchedObjects == nil) {
            //error handler
        }

    
        
        if (peopleInGroupCount>0) {
            ABRecordRef  recordRef;
            
            CFStringRef recordRefFirstName;
            
            CFStringRef recordRefLastName;
            
            CFStringRef recordRefPrefix;
            
            CFStringRef recordRefSuffix;
            
            CFStringRef recordRefMiddleName;
            
            CFStringRef recordRefNotes;
            
            int personID;;
            NSPredicate *checkIfRecordIDExists;
            NSArray *filteredArray;
            int numberImported=0;
            for (int i=0; i<peopleInGroupCount; i++) {
                recordRef=nil;
                
                recordRefFirstName=nil;
                
                recordRefLastName=nil;
                
                recordRefPrefix=nil;
                
                recordRefSuffix=nil;
                
                recordRefMiddleName=nil;
                
                recordRefNotes=nil;
                
                
                checkIfRecordIDExists=nil;
                filteredArray=nil; 
                recordRef=CFArrayGetValueAtIndex(allPeopleInGroup, i);
                
                recordRefFirstName=ABRecordCopyValue((ABRecordRef) recordRef,( ABPropertyID) kABPersonFirstNameProperty);
                
                recordRefLastName=ABRecordCopyValue((ABRecordRef) recordRef,( ABPropertyID) kABPersonLastNameProperty);
                
                recordRefPrefix=ABRecordCopyValue((ABRecordRef) recordRef,( ABPropertyID) kABPersonPrefixProperty);
                
                recordRefSuffix=ABRecordCopyValue((ABRecordRef) recordRef,( ABPropertyID) kABPersonSuffixProperty);
                
                recordRefMiddleName=ABRecordCopyValue((ABRecordRef) recordRef,( ABPropertyID) kABPersonMiddleNameProperty);
                
                recordRefNotes=ABRecordCopyValue((ABRecordRef) recordRef,( ABPropertyID) kABPersonNoteProperty);
                
                 personID=(int)ABRecordGetRecordID(recordRef);
                checkIfRecordIDExists=[NSPredicate predicateWithFormat:@"aBRecordIdentifier == %@",[NSNumber numberWithInt:personID]];
                
                
                
               filteredArray= [fetchedObjects filteredArrayUsingPredicate:checkIfRecordIDExists];
                
                if (filteredArray.count==0 &&recordRefFirstName && CFStringGetLength(recordRefFirstName)>0&&recordRefLastName && CFStringGetLength(recordRefLastName)>0) 
                {
                    
                    ClinicianEntity *clinician=[[ClinicianEntity alloc]initWithEntity:entity insertIntoManagedObjectContext:managedObjectContext];
                    
                    if (recordRefPrefix && CFStringGetLength(recordRefPrefix)>0) 
                    {
                        [clinician setValue:(__bridge NSString*)recordRefPrefix forKey:@"prefix"];
                        
                    }
                    if (recordRefFirstName &&  CFStringGetLength(recordRefFirstName)>0) {                  
                        [clinician setValue:(__bridge NSString*)recordRefFirstName forKey:@"firstName"];
                    }
                    if (recordRefMiddleName && CFStringGetLength(recordRefMiddleName)>0) {    
                       [ clinician setValue:(__bridge NSString*)recordRefMiddleName forKey:@"middleName"];
                    }
                    
                    if (recordRefLastName && CFStringGetLength(recordRefLastName)>0) {
                        [clinician setValue:(__bridge NSString*)recordRefLastName forKey:@"lastName"];
                    }
                    if (recordRefSuffix && CFStringGetLength(recordRefSuffix)>0) {  
                        [clinician setValue:(__bridge NSString*)recordRefSuffix forKey:@"suffix"];
                    }
                        
                        
                    if (recordRefNotes && CFStringGetLength(recordRefNotes)>0) {  
                            [clinician setValue:(__bridge NSString*)recordRefNotes forKey:@"notes"];
                    }
                    
                    if (personID ) {  
                        [clinician setValue:[NSNumber numberWithInt:personID] forKey:@"aBRecordIdentifier"];
                    }
                    
                    
                    
                    numberImported++;
              
                }
               
                if (recordRefNotes) {
                    CFRelease(recordRefNotes);
                }
                if (recordRefPrefix) {
                    CFRelease(recordRefPrefix);
                    
                }
                
                if (recordRefFirstName) {
                    CFRelease(recordRefFirstName);
                }
                if (recordRefMiddleName) {
                    CFRelease(recordRefMiddleName);
                }
                
                if (recordRefLastName) {
                    CFRelease(recordRefLastName);
                }
                if (recordRefSuffix) {
                    CFRelease(recordRefSuffix);
                    
                }
            }
                PTTAppDelegate *appDelegate=(PTTAppDelegate *)[UIApplication sharedApplication].delegate;
                
                if ([managedObjectContext hasChanges]) {
                    [appDelegate saveContext];
                }
                
                 int numberIgnored=peopleInGroupCount-numberImported;
                NSString *messageStr;
               
                
                if (peopleInGroupCount==numberIgnored) {
                    if (peopleInGroupCount==1) {
                        messageStr =[NSString stringWithFormat:@"The contact was not imported because it already exists in the database."] ;
                    }
                    else {
                         messageStr =[NSString stringWithFormat:@"The contacts were not imported because they already exist in the database."] ;
                    }
                }
                else 
                {
                    if (numberImported==1) 
                    {
                        messageStr =[NSString stringWithFormat:@"Imported %i contact.",numberImported] ;
                    }else 
                    {
                         messageStr =[NSString stringWithFormat:@"Imported %i contacts.",numberImported] ;
                    }
                   
                    
                    if (numberIgnored>0) {
                        
                        if (numberIgnored==1) {
                            messageStr=[messageStr stringByAppendingString:[NSString stringWithFormat:@" The contact was not imported because it already exists in the database"]];
                        }
                        else {
                            messageStr=[messageStr stringByAppendingString:[NSString stringWithFormat:@" %i contacts were not imported because they already exist in the database",numberIgnored]];
                        }
                        
                    }
                }
               
                
                
                
                
//                if ([SCUtilities is_iPad]) {
//                    if (appDelegate.cliniciansRootViewController_iPad &&appDelegate.cliniciansRootViewController_iPad.objectsModel) {
//                        [appDelegate.cliniciansRootViewController_iPad.objectsModel reloadBoundValues];
//                        [appDelegate.cliniciansRootViewController_iPad.tableView reloadData];
//                        
//                        
//                    }
//                }
//                else {
//                    if (appDelegate.clinicianViewController &&appDelegate.clinicianViewController.objectsModel) {
//                        [appDelegate.clinicianViewController.objectsModel reloadBoundValues];
//                        [appDelegate.clinicianViewController.tableView reloadData];
//                    }
//                }
                
                
                
                [appDelegate displayNotification:messageStr forDuration:6.0 location:kPTTScreenLocationTop inView:nil];
            }
            

        fetchRequest=nil;
        

                
                
        if (allPeopleInGroup) {
            CFRelease(allPeopleInGroup);
        }  
            
        
        
        
    }

if (addressBookToImportContactsInGroup) {
    CFRelease(addressBookToImportContactsInGroup);
}
    }
}




-(IBAction)abSourcesDoneButtonTapped:(id)sender{


    
//    if (currentDetailTableViewModel_.tag=429 &&currentDetailTableViewModel_.sectionCount) {
//        SCObjectSelectionSection *section=(SCObjectSelectionSection *)[currentDetailTableViewModel_ sectionAtIndex:0];
//        NSNumber *selectedIndex= (NSNumber *) sourcesObjSelectionCell_.selectedItemIndex;
//        selectedIndex=section.selectedItemIndex;
//        
//        
//        
//        
//    }
    if(rootNavController)
	{
		// check if self is the rootViewController
        
        [objectsModel.viewController.navigationController popViewControllerAnimated:YES];
        
        
	}
	else
		[sourcesObjSelectionCell_.ownerTableViewModel.viewController dismissModalViewControllerAnimated:YES];
    

}


-(int )defaultABSourceID{
    
    BOOL iCloudEnabled=(BOOL)[[NSUserDefaults standardUserDefaults] valueForKey:@"icloud_preference"];
    
    int returnID=-1;
       int sourceID=-1;
    BOOL continueChecking=YES;
    
   
    if ( [[[UIDevice currentDevice] systemVersion] intValue] < 6  )
    {
        ABAddressBookRef addressBookToGetSource =ABAddressBookCreate();
    CFArrayRef allSourcesArray=ABAddressBookCopyArrayOfAllSources(addressBookToGetSource);
    source=nil;
    int sourcesCount=0;
    
    if (allSourcesArray ) {
        sourcesCount= CFArrayGetCount(allSourcesArray);
    } 
    if (sourcesCount==0) {
        
        continueChecking=NO;
        returnID=-1 ;
    } 
    if (continueChecking&& allSourcesArray && sourcesCount==1) {
        
        source=CFArrayGetValueAtIndex(allSourcesArray, 0);
        ABRecordID sourceID=ABRecordGetRecordID(source);
        
        continueChecking=NO;
        returnID=sourceID;
       
        
    }
    
    
    int recordID=(int)[(NSNumber*)[[NSUserDefaults standardUserDefaults] valueForKey:kPTTAddressBookSourceIdentifier]
                       intValue];
    
    
    
    if (continueChecking && recordID!=-1) {
        
        source=ABAddressBookGetSourceWithRecordID(addressBookToGetSource, recordID);

       
        if (source) {
            continueChecking=NO;
            returnID=recordID;
        }
            
//        }
        
        
    }
    if (continueChecking&& allSourcesArray && CFArrayGetCount(allSourcesArray) >1 &&  iCloudEnabled) {
      
        
        
        for (int i=0; i<sourcesCount ; i++){
            // Fetch the source type
            
            source=CFArrayGetValueAtIndex(allSourcesArray, i);
            CFNumberRef sourceType = ABRecordCopyValue(source, kABSourceTypeProperty);
            
            
            // Fetch the name associated with the source type
            NSString *sourceName = [self nameForSourceWithIdentifier:[(__bridge NSNumber*)sourceType intValue]];
            if (sourceType) {
                CFRelease(sourceType);
            }

            
            if ([sourceName isEqualToString: @"CardDAV server"])
            {
                sourceID=ABRecordGetRecordID(source);
                
                                
                               
                //               
                
                returnID=sourceID;
                continueChecking=NO;
                break;
            }
            
            
        }
        
        
    }
    
    if(continueChecking&& sourcesCount>1)
    {
        source= CFArrayGetValueAtIndex(allSourcesArray, 0);
        sourceID=ABRecordGetRecordID(source);
        returnID=sourceID;        
        
    }
    
    
    if (allSourcesArray) {
        CFRelease(allSourcesArray);
    }
        
        if (addressBookToGetSource) {
            CFRelease(addressBookToGetSource);
        }
    }
    
    return returnID;
}








@end
