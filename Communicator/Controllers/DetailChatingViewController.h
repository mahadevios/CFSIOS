//
//  DetailChatingViewController.h
//  Communicator
//
//  Created by mac on 26/05/16.
//  Copyright © 2016 Xanadutec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailChatingViewController : UIViewController
{
    AppPreferences* app;
}
- (IBAction)sendFeedbackButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *sendFeedbackTextfield;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
