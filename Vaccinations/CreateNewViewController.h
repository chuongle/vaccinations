//
//  CreateNewViewController.h
//  Vaccinations
//
//  Created by Subash Dantuluri on 10/19/13.
//  Copyright (c) 2013 Subash Dantuluri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangePasswordViewController.h"
#import "ChangeClinicViewController.h"

@interface CreateNewViewController : UIViewController <UIActionSheetDelegate>
- (IBAction)logoutAction:(id)sender;

//Brian October 23, 2013
@property (weak, nonatomic) IBOutlet UITextField *recordID;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *middleName;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateOfBirth;
@property (weak, nonatomic) IBOutlet UITextField *motherMaidenName;
@property (weak, nonatomic) IBOutlet UITextField *motherName;
@property (weak, nonatomic) IBOutlet UITextField *fatherName;
@property (weak, nonatomic) IBOutlet UITextField *streetNumberPOB;
@property (weak, nonatomic) IBOutlet UITextField *streetNamePOB;
@property (weak, nonatomic) IBOutlet UITextField *cityPOB;
@property (weak, nonatomic) IBOutlet UITextField *statePOB;
@property (weak, nonatomic) IBOutlet UITextField *zipcodePOB;
@property (weak, nonatomic) IBOutlet UITextField *currentStreetNumber;
@property (weak, nonatomic) IBOutlet UITextField *currentStreetName;
@property (weak, nonatomic) IBOutlet UITextField *currentCity;
@property (weak, nonatomic) IBOutlet UITextField *currentState;
@property (weak, nonatomic) IBOutlet UITextField *currentZipcode;
@property (weak, nonatomic) IBOutlet UITextField *user_id;




@property (nonatomic, retain) NSString* birthString;
@property (nonatomic, retain) NSString* genderString;

@property (nonatomic, retain) ChangePasswordViewController * changePwdVC;
@property (nonatomic, retain) ChangeClinicViewController * changeClinicVC;


@property (strong, nonatomic)NSURLConnection *postNewRecord;


@property (nonatomic, strong) NSString *physician_id;
@property (nonatomic, strong) NSString *physician_user_id;


- (IBAction)createNewRecord:(id)sender;


- (IBAction)dimissKeyboard:(id)sender;













@end
