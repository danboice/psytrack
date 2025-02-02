//
//  PaymentEntity.h
//  PsyTrack Clinician Tools
//  Version: 1.5.4
//
//  Created by Daniel Boice on 1/1/13.
//  Copyright (c) 2013 PsycheWeb LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClientEntity, ConsultationEntity;

@interface PaymentEntity : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber *amount;
@property (nonatomic, retain) NSNumber *order;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSDate *dateCleared;
@property (nonatomic, retain) NSDate *dateReceived;
@property (nonatomic, retain) ClientEntity *client;
@property (nonatomic, retain) NSManagedObject *paymentType;
@property (nonatomic, retain) NSManagedObject *paymentSource;
@property (nonatomic, retain) ConsultationEntity *consultation;

@end
