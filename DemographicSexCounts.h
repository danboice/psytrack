//
//  DemographicSexCounts.h
//  PsyTrack Clinician Tools
//  Version: 1.5.4
//
//  Created by Daniel Boice on 9/15/12.
//  Copyright (c) 2012 PsycheWeb LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemographicSexCounts : NSObject {
    NSMutableArray *sexMutableArray_;
}

@property (nonatomic, strong) NSMutableArray *sexMutableArray;

@end
