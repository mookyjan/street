//
//  AppConstants.h
//
//
//  Created by Tahir Iqbal on 08/06/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//
import Foundation
struct AppConstants {
    
    
    //        http://nutonia.herokuapp.com/api/v1/users/signin
    //        http://nutonia.herokuapp.com/api/v1/users/forget_password
    //

//    https://nutonia.herokuapp.com/api/v1/ask
     static let kAPIBaseURL: String = "http://nutonia.herokuapp.com/api/v1/"
    static let KAPIUserUrl = "users/"
    static let KAPIAskQuestion = "ask"
    static let kAPIForgotPasswordPath: String = "forget_password"
    static let kAPISignupPath: String = "signup"
    static let kAPISigninPath: String = "signin"
    static let kAPIFollow: String = "follow"
    static let KAPIAllUsers: String = "/all_users"
    
    let kAPIGetCurrenciesPath: String = ""
    let kAPISaveSuggestiveBrandsPath: String = ""
    let kAPIVoteSuggestiveBrandPath: String = ""
    let kAPISaveUserLocationPath: String = ""
    let kAPIShippmentOptionPath: String = ""
    let kAPISaveUserCampaignsPath: String = ""
    let kAPICreatePaymentCard: String = ""
    let kAPIMakePaymentCardDefault: String = ""
    let kAPIDestroyPaymentCard: String = ""
    let kAPIMethodPost: String = "POST"
    let kAPIMethodGet: String = "GET"
    let kAPIMethodPut: String = "PUT"
    let kAppStoreID: String = ""
    static let kEmptyString: String = ""
    static let kValidationMessageMissingInput: String = "Please fill all the fields"
    static let kValidationMessageInvalidInput: String = "Please enter valid information"
    static let kValidationEmailInvalidInput: String = "Please enter valid Email Address"

    static let KValidationOfPhoneNumber :String = "Phone Number must be 4 digits"
    static let KValidationPassword : String = "Password must be greater 6 digits"
    static let kValidationCityName: String = "City  name must be 2 digits"

    let kDateFormatStandard: String = "yyyy-MM-dd HH:mm:ss.SZ"
    let kDateFormatShort: String = "yyyy-MM-dd"
    let kDateFormatPaymentCardExpiry: String = "MM/yy"
    let kAnimationDuration: Double = 0.25
    let kcellHeightForHomeVC: Double = 84.0
    let kcellHeightForCelebrityCloset: Double = 138.0
    let kcellHeightForIndividualCelebrityCollection: Double = 132.0
    let kcellHeightForCommunitySettings: Double = 80.0
    let kcellHeightForCelebrityCollection: Double = 163.0
    let kcellHeightForCelebrityOutfits: Double = 383.0
    let kdeleteAnimationDuration: Double = 0.12
    let kPageSizeForHomePage: Int = 20
    let kUserBrandsCountKey: String = "UserBrandsCountKey"
    let kAddNewBrandsLimit: Int = 10
    let kPointsFullString: String = "Point"
    let kStampsFullString: String = "Stamp"
    let kCashBackFullString: String = "Discount"
    let kPointsShortString: String = "PTS"
    let kStampsShortString: String = "STM"
    let kCashBackShortString: String = "CBD"
    let kPaymentOptionCashOnly: String = "cash"
    let kPaymentOptionCardOnly: String = "cards"
    let kPaymentOptionBoth: String = "cash_and_cards"
    let kBaseCurrency: String = "GBP"
    let kSharedManagerDumpFileName: String = "sharedManager.dmp"
    let kNotificationForCurrentCountOfMessages: String = "Point"
    let kNotificationForCurrentCountOfJobs: String = "Point"
    let kNotificationForUpdatingMenuItems: String = "Point"
    let kNotificationForIncomingCall: String = "Point"
    let kNotificationForCash: String = "Point"
    let kNotificationForGift: String = "Point"
    let kNotificationForConfirmingReadMessage: String = "Point"
    let kNotificationForJobDetachInJobList: String = "Point"
    let kNotificationForJobDetachNotInJobList: String = "Point"
    static let kPasswordRequiredLength: Int = 6
    static let kUserNameRequiredLength: Int = 4
    static let kPhoneNumberRequiredLength: Int = 4
    let kAddressRequiredLength: Int = 4
    static let kCityNameRequiredLength: Int = 2

    let kPaymentCardNumberRequiredLength: Int = 15
    let kPaymentCardExpiryLength: Int = 5
    let kPaymentCardCSVRequiredLength: Int = 3
    let kCityRequiredLength: Int = 2
    let kZipCodeRequiredLength: Int = 4
    let kAreaCodeRequiredLength: Int = 3
    let kStateRequiredLength: Int = 2
    let kCountryRequiredLength: Int = 2
    let kAppPINRequiredLength: Int = 4
    let kPersonalizationFormFieldRequiredLength: Int = 1
    let kLogoutMessage: String = "Are you sure you want to logout?"
    let kPasswordChangeAlert: String = "Please enter your current password in order to change it to new one"
    let kApplyRewardAlert: String = "You can't perform this action on this product"
    let kEmptyBasketAlert: String = "Your basket is empty"
    let kBasketProductCannotBurnMessage: String = "This item cannot be paid by the Loyalty Card."
    let kBasketCollectAtStore: String = "Collect at store"
    let kBasketPaymentInPerson: String = "Payment in person"
    let kPaymentCardAlreadyExist: String = "Card already exists."
    let kSearchFieldFontName: String = "HelveticaNeue"
    let kBrainTreeDemoToken: String = "=="
    let kAppMainColorHex = "46a3c2"
    
    
    
}
//
//  AppConstants.m
//  
//
//  Created by Tahir Iqbal on 08/06/2015.
//  Copyright (c) 2015 DevBatch. All rights reserved.
//