//
//  TimeTrackViewController.h
//  PsyTrack Clinician Tools
//  Version: 1.5.4
//
//  Created by Daniel Boice on 4/5/12.
//  Copyright (c) 2012 PsycheWeb LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopwatchCell.h"
#import "ClientPresentations_Shared.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "InterventionTypeEntity.h"
#import "SupervisionTypeEntity.h"


typedef enum {
    kTrackAssessmentSetup,
    kTrackInterventionSetup,
    kTrackSupportSetup,
    kTrackSupervisionReceivedSetup,
    kTrackSupervisionGivenSetup,
} PTrackControllerSetup;

static NSString *const kTrackAssessmentEntityName = @"AssessmentEntity";
static NSString *const kTrackInterventionEntityName = @"InterventionDeliveredEntity";
static NSString *const kTrackSupportEntityName = @"SupportActivityDeliveredEntity";
static NSString *const kTrackSupervisionGivenEntityName = @"SupervisionGivenEntity";
static NSString *const kTrackSupervisionReceivedEntityName = @"SupervisionReceivedEntity";

@interface TimeTrackViewController : SCViewController <SCTableViewModelDataSource, SCTableViewModelDelegate,  UINavigationControllerDelegate>
{
    ClientPresentations_Shared *clientPresentations_Shared;
    UISearchBar *searchBar;
    NSManagedObjectContext *managedObjectContext;
    __weak UILabel *totalAdministrationsLabel;

    PTrackControllerSetup currentControllerSetup;
    BOOL viewControllerOpen;

    NSDateFormatter *counterDateFormatter;
    NSDate *referenceDate;
    NSDate *totalTimeDate;
    NSDate *addStopwatch;
    SCDateCell *serviceDateCell;
    SCObjectCell *totalTimeCell;

    UILabel *breakTimeTotalHeaderLabel;

    EKEventStore *eventStore;
    EKCalendar *psyTrackCalendar;
    NSMutableArray *eventsList;
    EKEventEditViewController *eventViewController;

    SCTableViewModel *currentDetailTableViewModel;
    SCTableViewModel *firstDetailTableModel;

    NSManagedObject *eventButtonBoundObject;

    NSString *eventTitleString;

    NSString *tableModelClassDefEntity;

    NSTimer *timer;

    __weak UITextField *stopwatchTextField;
    StopwatchCell *stopwatchCell;
    SCTableViewSection *timeSection;
    UILabel *footerLabel;
    UILabel *totalTimeHeaderLabel;

    NSDate *startTime;
    NSDate *endTime;
    NSDate *additionalTime;
    NSDate *timeToSubtract;

    SCTableViewSection *breakTimeSection;
    InterventionTypeEntity *selectedInterventionType;
    SupervisionTypeEntity *selectedSupervisionType;

    NSDateFormatter *shortTimeFormatter;
    NSDateFormatter *additionalTimeFormatter;
    NSDateFormatter *dateFormatter1;
    SCArrayOfObjectsModel *objectsModel;
    NSInteger numberOfInterventionSubTypeItems;
}

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, weak) IBOutlet UILabel *totalAdministrationsLabel;

@property (nonatomic, weak) IBOutlet UITextField *stopwatchTextField;
@property (nonatomic,strong)  ClientPresentations_Shared *clientPresentations_Shared;

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) EKCalendar *psyTrackCalendar;
@property (nonatomic, strong) NSMutableArray *eventsList;
@property (nonatomic, strong) EKEventEditViewController *eventViewController;

//- (IBAction) addEvent:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *totalTimeHeaderLabel;
@property (strong, nonatomic) IBOutlet UILabel *footerLabel;
@property (strong, nonatomic)   NSDate *totalTimeDate;
@property (strong, nonatomic) IBOutlet SCEntityDefinition *timeDef;

- (void) calculateTime;
- (NSString *) tableViewModel:(SCTableViewModel *)tableViewModel calculateBreakTimeForRowAtIndexPath:(NSIndexPath *)indexPath withBoundValues:(BOOL)useBoundValues;
- (IBAction) stopwatchStop:(id)sender;
- (IBAction) stopwatchReset:(id)sender;

- (NSTimeInterval) totalBreakTimeInterval;
- (id) initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle trackSetup:(PTrackControllerSetup)setupType;
@end
