//
//  DemographicSexualOrientationCounts.h
//  PsyTrack
//
//  Created by Daniel Boice on 9/15/12.
//  Copyright (c) 2012 PsycheWeb LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemographicSexualOrientationCounts : NSObject{
    
    __weak NSMutableArray *sexualOrientationMutableArray_;
    
    
}

@property (nonatomic, weak)NSMutableArray *sexualOrientationMutableArray;

@end
