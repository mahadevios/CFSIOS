//
//  AppPreferences.h
//  Communicator
//
//  Created by mac on 05/04/16.
//  Copyright © 2016 Xanadutec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"

@protocol AppPreferencesDelegate;

@interface AppPreferences : NSObject 
{
    id<AppPreferencesDelegate> alertDelegate;
}

@property (nonatomic,strong)    id<AppPreferencesDelegate> alertDelegate;

@property (nonatomic)           int     currentSelectedItem;

@property (nonatomic,assign)    BOOL                        isReachable;

@property (nonatomic,strong)NSMutableArray* feedQueryCounterArray;
@property (nonatomic,strong)NSMutableArray* feedQueryMessageHeaderArray;
@property (nonatomic,strong)NSMutableArray* feedOrQueryDetailMessageArray;
@property (nonatomic,strong)NSMutableArray* permittedCompaniesForUserArray;
@property (nonatomic,strong)NSMutableArray* FeedbackOrQueryDetailChatingObjectsArray;


@property (nonatomic,strong)NSMutableArray* getFeedbackAndQueryTypesArray;
@property (nonatomic,strong)NSMutableArray* companynameOrIdArray;
@property (nonatomic,strong)NSMutableDictionary* feedTypeWithFeedCounterDict;
@property (nonatomic,strong)NSMutableDictionary* feedTypeWithQueryCounterDict;
@property (nonatomic,strong)NSMutableArray* feedQueryCounterDictsWithTypeArray;

@property (nonatomic,strong)NSMutableArray* sampleFeedtypeArray;
@property (nonatomic,strong)NSMutableArray* samplefeedTypeCopyForPredicate;

@property (nonatomic,strong)NSMutableDictionary* sampleReportDateDict;
@property (nonatomic,strong)NSMutableDictionary* sampleReportDateCopyForPredicate;

@property (nonatomic,strong)NSMutableArray* allMomArray;
@property (nonatomic,strong)NSMutableDictionary* reportFileNamesDict;
@property(nonatomic,strong)NSMutableArray* imageFilesArray;
@property(nonatomic,strong)NSMutableArray* imageFileNamesArray;
@property(nonatomic,strong)NSMutableArray* uploadedFileNamesArray;


+(AppPreferences *) sharedAppPreferences;

-(void) showAlertViewWithTitle:(NSString *) title withMessage:(NSString *) message withCancelText:(NSString *) cancelText withOkText:(NSString *) okText withAlertTag:(int) tag;
-(void) showNoInternetMessage;

-(void) startReachabilityNotifier;
@end


@protocol AppPreferencesDelegate

@optional
-(void) appPreferencesAlertButtonWithIndex:(int) buttonIndex withAlertTag:(int) alertTag;
@end