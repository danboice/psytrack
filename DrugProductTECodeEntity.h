/*
 *  DrugProductTECodeEntity.h
 *  psyTrack Clinician Tools
 *  Version: 1.5.4
 *
 *
 *	THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY UNITED STATES
 *	INTELLECTUAL PROPERTY LAW AND INTERNATIONAL TREATIES. UNAUTHORIZED REPRODUCTION OR
 *	DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
 *
 *  Created by Daniel Boice on  12/31/11.
 *  Copyright (c) 2011 PsycheWeb LLC. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DrugProductEntity;

@interface DrugProductTECodeEntity : NSManagedObject

@property (nonatomic, strong) NSString *applNo;
@property (nonatomic, strong) NSNumber *tESequence;
@property (nonatomic, strong) NSString *tECode;
@property (nonatomic, strong) NSString *productMktStatus;
@property (nonatomic, strong) NSString *productNo;
@property (nonatomic, strong) DrugProductEntity *product;

@end
