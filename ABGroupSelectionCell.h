/*
 *  ABGroupSelectionCell.h
 *  psyTrack Clinician Tools
 *  Version: 1.0
 *
 *
 *	THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY UNITED STATES 
 *	INTELLECTUAL PROPERTY LAW AND INTERNATIONAL TREATIES. UNAUTHORIZED REPRODUCTION OR 
 *	DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES. 
 *
 *  Created by Daniel Boice on 3/7/12.
 *  Copyright (c) 2011 PsycheWeb LLC. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */
#import "SCTableViewCell.h"
#import <AddressBook/AddressBook.h>
#import "SCTableViewModel.h"
#import "ClinicianEntity.h"

@interface ABGroupSelectionCell : SCObjectSelectionCell {


 NSArray *abGroupsArray;

    ClinicianEntity *clinician_;
}



@property (nonatomic, strong)ClinicianEntity *clinician;


-(NSArray *)addressBookGroupsArray;
-(void)changeABGroupNameTo:(NSString *)groupName  addNew:(BOOL)addNew;


-(id)initWithClinician:(ClinicianEntity *)clinicianObject;
-(BOOL)personContainedInGroupWithID:(int)groupID;
-(void)addPersonToGroupWithID:(int)groupID;


@end
