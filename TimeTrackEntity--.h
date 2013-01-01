//
//  TimeTrackEntity.h
//  PsyTrack
//
//  Created by Daniel Boice on 7/15/12.
//  Copyright (c) 2012 PsycheWeb LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClinicianEntity,SiteEntity;

@interface TimeTrackEntity : NSManagedObject

@property (nonatomic, retain) NSString * monthlyLogNotes;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSDate * dateOfService;
@property (nonatomic, retain) NSString * eventIdentifier;
@property (nonatomic, retain) SiteEntity *site;
@property (nonatomic, retain) ClinicianEntity *supervisor;
@property (nonatomic, retain) NSManagedObject *trainingProgram;

@end
