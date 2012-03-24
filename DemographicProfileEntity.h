//
//  DemographicProfileEntity.h
//  PsyTrack Clinician Tools
//
//  Created by Daniel Boice on 3/23/12.
//  Copyright (c) 2012 PsycheWeb LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClientEntity, ClinicianEntity, ImmigrationHistoryEntity;

@interface DemographicProfileEntity : NSManagedObject

@property (nonatomic, retain) NSString * sex;
@property (nonatomic, retain) NSString * sexualOrientation;
@property (nonatomic, retain) NSString * profileNotes;
@property (nonatomic, retain) NSDate * keyDate;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSManagedObject *militaryService;
@property (nonatomic, retain) NSManagedObject *educationLevel;
@property (nonatomic, retain) NSSet *substancesUse;
@property (nonatomic, retain) ClientEntity *client;
@property (nonatomic, retain) NSSet *disabilities;
@property (nonatomic, retain) NSSet *spiritualBeliefs;
@property (nonatomic, retain) NSSet *migrationHistory;
@property (nonatomic, retain) ClinicianEntity *clinician;
@property (nonatomic, retain) NSSet *interpersonal;
@property (nonatomic, retain) NSManagedObject *gender;
@property (nonatomic, retain) NSSet *languagesSpoken;
@property (nonatomic, retain) NSManagedObject *employmentStatus;
@property (nonatomic, retain) NSSet *cultureGroups;
@property (nonatomic, retain) NSSet *ethnicities;
@property (nonatomic, retain) NSSet *additionalVariables;
@property (nonatomic, retain) NSSet *developmental;
@property (nonatomic, retain) NSSet *significantLifeEvents;
@property (nonatomic, retain) NSSet *races;

@property (nonatomic, retain) NSString * tempProfileNotes;
@property (nonatomic, retain) NSString * tempSex;

@end

@interface DemographicProfileEntity (CoreDataGeneratedAccessors)

- (void)addSubstancesUseObject:(NSManagedObject *)value;
- (void)removeSubstancesUseObject:(NSManagedObject *)value;
- (void)addSubstancesUse:(NSSet *)values;
- (void)removeSubstancesUse:(NSSet *)values;

- (void)addDisabilitiesObject:(NSManagedObject *)value;
- (void)removeDisabilitiesObject:(NSManagedObject *)value;
- (void)addDisabilities:(NSSet *)values;
- (void)removeDisabilities:(NSSet *)values;

- (void)addSpiritualBeliefsObject:(NSManagedObject *)value;
- (void)removeSpiritualBeliefsObject:(NSManagedObject *)value;
- (void)addSpiritualBeliefs:(NSSet *)values;
- (void)removeSpiritualBeliefs:(NSSet *)values;

- (void)addMigrationHistoryObject:(ImmigrationHistoryEntity *)value;
- (void)removeMigrationHistoryObject:(ImmigrationHistoryEntity *)value;
- (void)addMigrationHistory:(NSSet *)values;
- (void)removeMigrationHistory:(NSSet *)values;

- (void)addInterpersonalObject:(NSManagedObject *)value;
- (void)removeInterpersonalObject:(NSManagedObject *)value;
- (void)addInterpersonal:(NSSet *)values;
- (void)removeInterpersonal:(NSSet *)values;

- (void)addLanguagesSpokenObject:(NSManagedObject *)value;
- (void)removeLanguagesSpokenObject:(NSManagedObject *)value;
- (void)addLanguagesSpoken:(NSSet *)values;
- (void)removeLanguagesSpoken:(NSSet *)values;

- (void)addCultureGroupsObject:(NSManagedObject *)value;
- (void)removeCultureGroupsObject:(NSManagedObject *)value;
- (void)addCultureGroups:(NSSet *)values;
- (void)removeCultureGroups:(NSSet *)values;

- (void)addEthnicitiesObject:(NSManagedObject *)value;
- (void)removeEthnicitiesObject:(NSManagedObject *)value;
- (void)addEthnicities:(NSSet *)values;
- (void)removeEthnicities:(NSSet *)values;

- (void)addAdditionalVariablesObject:(NSManagedObject *)value;
- (void)removeAdditionalVariablesObject:(NSManagedObject *)value;
- (void)addAdditionalVariables:(NSSet *)values;
- (void)removeAdditionalVariables:(NSSet *)values;

- (void)addDevelopmentalObject:(NSManagedObject *)value;
- (void)removeDevelopmentalObject:(NSManagedObject *)value;
- (void)addDevelopmental:(NSSet *)values;
- (void)removeDevelopmental:(NSSet *)values;

- (void)addSignificantLifeEventsObject:(NSManagedObject *)value;
- (void)removeSignificantLifeEventsObject:(NSManagedObject *)value;
- (void)addSignificantLifeEvents:(NSSet *)values;
- (void)removeSignificantLifeEvents:(NSSet *)values;

- (void)addRacesObject:(NSManagedObject *)value;
- (void)removeRacesObject:(NSManagedObject *)value;
- (void)addRaces:(NSSet *)values;
- (void)removeRaces:(NSSet *)values;

@end
