/*
 *  ClientsViewController_iPhone.h
 *  psyTrack Clinician Tools
 *  Version: 1.0
 *
 *
 *	THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY UNITED STATES 
 *	INTELLECTUAL PROPERTY LAW AND INTERNATIONAL TREATIES. UNAUTHORIZED REPRODUCTION OR 
 *	DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES. 
 *
 *  Created by Daniel Boice on 9/26/11.
 *  Copyright (c) 2011 PsycheWeb LLC. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */

#import <UIKit/UIKit.h>
#import "ClientsViewController_Shared.h"
#import "ClientsSelectionCell.h"
#import "ClientEntity.h"

@interface ClientsViewController_iPhone : SCViewController <  SCTableViewModelDataSource, SCTableViewModelDelegate, SCTableViewControllerDelegate, UIAlertViewDelegate> {
    
//    UISearchDisplayController *searchDisplayController;
  	 UISearchBar *searchBar;
//    UITableView *tableView;
//	 SCArrayOfObjectsModel *tableModel;
     UILabel *totalClientsLabel;

    NSManagedObjectContext *managedObjectContext;
    ClientsViewController_Shared *clientsViewController_Shared;
    BOOL isInDetailSubview;
     ClientsSelectionCell *clientObjectSelectionCell;
    BOOL allowMultipleSelection;
     UIViewController *sendingViewController;
     NSMutableSet *alreadySelectedClients;
     NSManagedObject *clientCurrentlySelectedInReferringDetailview;
    SCTableViewModel *medicationReviewTableViewModel;
    int searchStringLength;
    BOOL reloadTableView;
    SCArrayOfObjectsModel *objectsModel;
    ClientEntity *currentlySelectedClient;
    NSMutableArray *currentlySelectedClientsArray;
}

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
//@property (nonatomic, strong) IBOutlet UITableView *tableView;
//@property (nonatomic, strong) IBOutlet UITableView *searchResultsTableView;

//@property (nonatomic, strong)IBOutlet UISearchDisplayController *searchDisplayController;
@property (nonatomic, strong) IBOutlet UILabel *totalClientsLabel;
//@property (nonatomic, strong)  SCArrayOfObjectsModel *tableModel;
@property (nonatomic, strong)  ClientsViewController_Shared *clientsViewController_Shared;
@property (nonatomic, readwrite) BOOL isInDetailSubview;
@property (nonatomic,strong) IBOutlet ClientsSelectionCell *clientObjectSelectionCell;
@property (nonatomic, strong)IBOutlet  UIViewController *sendingViewController;
@property (nonatomic,strong) IBOutlet NSMutableSet *alreadySelectedClients;
@property (nonatomic,strong) IBOutlet NSManagedObject *clientCurrentlySelectedInReferringDetailview;
-(void)updateClientsTotalLabel;

-(void)addWechlerAgeCellToSection:(SCTableViewSection *)section;
-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle isInDetailSubView:(BOOL)detailSubview objectSelectionCell:(SCObjectSelectionCell*)objectSelectionCell sendingViewController:(UIViewController *)viewController allowMultipleSelection:(BOOL)allowMultiSelect;

//-(void)cancelButtonTapped;

-(BOOL)checkStringIsNumber:(NSString *)str;
-(void)refreshData;

@end

