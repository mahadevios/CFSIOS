//
//  MainMOMViewController.h
//  Communicator
//
//  Created by mac on 13/06/16.
//  Copyright © 2016 Xanadutec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMOMViewController : UIViewController<UISearchBarDelegate,UISearchResultsUpdating>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
