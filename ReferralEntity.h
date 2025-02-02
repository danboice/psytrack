//
//  ReferralEntity.h
//  PsyTrack Clinician Tools
//  Version: 1.5.4
//
//  Created by Daniel Boice on 1/1/13.
//  Copyright (c) 2013 PsycheWeb LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClientEntity, ClinicianEntity, ConsultationEntity, OtherReferralSourceEntity;

@interface ReferralEntity : NSManagedObject

@property (nonatomic, retain) NSDate *dateReferred;
@property (nonatomic, retain) NSNumber *order;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSNumber *referralInOrOut;
@property (nonatomic, retain) NSString *keyString;
@property (nonatomic, retain) ClientEntity *client;
@property (nonatomic, retain) ConsultationEntity *consultation;
@property (nonatomic, retain) OtherReferralSourceEntity *otherSource;
@property (nonatomic, retain) ClinicianEntity *clinician;

@end
