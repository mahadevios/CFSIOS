//
//  CreateNewMOMViewController.h
//  Communicator
//
//  Created by mac on 19/05/16.
//  Copyright © 2016 Xanadutec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateNewMOMViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
    BOOL gotResponse;
    int movement;
}
- (IBAction)sendNewMom:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *subjectTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextView *attendiesTextview;
@property (weak, nonatomic) IBOutlet UITextView *keyPointstextView;
@property (weak, nonatomic) IBOutlet UIView *insideView;
@end
