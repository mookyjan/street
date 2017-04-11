//
//  MOResult.swift
//
//  Created by Zeeshan Haider on 01/03/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class MOResult: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMOResultIsLoginKey: String = "is_login"
	internal let kMOResultPlateNumberKey: String = "plate_number"
	internal let kMOResultUpdateByKey: String = "update_by"
	internal let kMOResultCategoryKey: String = "category"
	internal let kMOResultAgeKey: String = "age"
	internal let kMOResultOnDutyKey: String = "on_duty"
	internal let kMOResultProfileImageKey: String = "profile_image"
	internal let kMOResultCompanyNameKey: String = "company_name"
	internal let kMOResultIsDeletedKey: String = "is_deleted"
	internal let kMOResultIsActivateKey: String = "is_activate"
	internal let kMOResultNameKey: String = "name"
	internal let kMOResultInternalIdentifierKey: String = "id"
	internal let kMOResultUpdatedAtKey: String = "updated_at"
	internal let kMOResultBranchIdKey: String = "branch_id"
	internal let kMOResultTimezoneKey: String = "timezone"
	internal let kMOResultPhoneKey: String = "phone"
	internal let kMOResultCreatedAtKey: String = "created_at"
	internal let kMOResultDeviceTokenKey: String = "device_token"
	internal let kMOResultProfileImagePathKey: String = "profile_image_path"
	internal let kMOResultBadgeNumberKey: String = "badge_number"
	internal let kMOResultDeviceTypeKey: String = "device_type"
	internal let kMOResultAuthTokenKey: String = "auth_token"
	internal let kMOResultEmailKey: String = "email"
	internal let kMOResultRoleNameKey: String = "role_name"
	internal let kMOResultRoleIdKey: String = "role_id"
	internal let kMOResultGenderKey: String = "gender"
	internal let kMOResultDriverStatusKey: String = "driver_status"
	internal let kMOResultPasswordKey: String = "password"
	internal let kMOResultDriverAgeKey: String = "driver_age"
	internal let kMOResultActiveRideIdKey: String = "active_ride_id"
	internal let kMOResultChangePasswordTokenKey: String = "change_password_token"
	internal let kMOResultNewsletterPmKey: String = "newsletter_pm"
	internal let kMOResultActivationCodeKey: String = "activation_code"
	internal let kMOResultEmergencyPhoneKey: String = "emergency_phone"
	internal let kMOResultDobKey: String = "dob"


    // MARK: Properties
	public var isLogin: String?
	public var plateNumber: String?
	public var updateBy: String?
	public var category: String?
	public var age: String?
	public var onDuty: String?
	public var profileImage: String?
	public var companyName: String?
	public var isDeleted: String?
	public var isActivate: String?
	public var name: String?
	public var internalIdentifier: String?
	public var updatedAt: String?
	public var branchId: String?
	public var timezone: String?
	public var phone: String?
	public var createdAt: String?
	public var deviceToken: String?
	public var profileImagePath: String?
	public var badgeNumber: String?
	public var deviceType: String?
	public var authToken: String?
	public var email: String?
	public var roleName: String?
	public var roleId: String?
	public var gender: String?
	public var driverStatus: String?
	public var password: String?
	public var driverAge: String?
	public var activeRideId: String?
	public var changePasswordToken: String?
	public var newsletterPm: String?
	public var activationCode: String?
	public var emergencyPhone: String?
	public var dob: String?




    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject] {

        var dictionary: [String : AnyObject ] = [ : ]
		if isLogin != nil {
			dictionary.updateValue(isLogin!, forKey: kMOResultIsLoginKey)
		}
		if plateNumber != nil {
			dictionary.updateValue(plateNumber!, forKey: kMOResultPlateNumberKey)
		}
		if updateBy != nil {
			dictionary.updateValue(updateBy!, forKey: kMOResultUpdateByKey)
		}
		if category != nil {
			dictionary.updateValue(category!, forKey: kMOResultCategoryKey)
		}
		if age != nil {
			dictionary.updateValue(age!, forKey: kMOResultAgeKey)
		}
		if onDuty != nil {
			dictionary.updateValue(onDuty!, forKey: kMOResultOnDutyKey)
		}
		if profileImage != nil {
			dictionary.updateValue(profileImage!, forKey: kMOResultProfileImageKey)
		}
		if companyName != nil {
			dictionary.updateValue(companyName!, forKey: kMOResultCompanyNameKey)
		}
		if isDeleted != nil {
			dictionary.updateValue(isDeleted!, forKey: kMOResultIsDeletedKey)
		}
		if isActivate != nil {
			dictionary.updateValue(isActivate!, forKey: kMOResultIsActivateKey)
		}
		if name != nil {
			dictionary.updateValue(name!, forKey: kMOResultNameKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kMOResultInternalIdentifierKey)
		}
		if updatedAt != nil {
			dictionary.updateValue(updatedAt!, forKey: kMOResultUpdatedAtKey)
		}
		if branchId != nil {
			dictionary.updateValue(branchId!, forKey: kMOResultBranchIdKey)
		}
		if timezone != nil {
			dictionary.updateValue(timezone!, forKey: kMOResultTimezoneKey)
		}
		if phone != nil {
			dictionary.updateValue(phone!, forKey: kMOResultPhoneKey)
		}
		if createdAt != nil {
			dictionary.updateValue(createdAt!, forKey: kMOResultCreatedAtKey)
		}
		if deviceToken != nil {
			dictionary.updateValue(deviceToken!, forKey: kMOResultDeviceTokenKey)
		}
		if profileImagePath != nil {
			dictionary.updateValue(profileImagePath!, forKey: kMOResultProfileImagePathKey)
		}
		if badgeNumber != nil {
			dictionary.updateValue(badgeNumber!, forKey: kMOResultBadgeNumberKey)
		}
		if deviceType != nil {
			dictionary.updateValue(deviceType!, forKey: kMOResultDeviceTypeKey)
		}
		if authToken != nil {
			dictionary.updateValue(authToken!, forKey: kMOResultAuthTokenKey)
		}
		if email != nil {
			dictionary.updateValue(email!, forKey: kMOResultEmailKey)
		}
		if roleName != nil {
			dictionary.updateValue(roleName!, forKey: kMOResultRoleNameKey)
		}
		if roleId != nil {
			dictionary.updateValue(roleId!, forKey: kMOResultRoleIdKey)
		}
		if gender != nil {
			dictionary.updateValue(gender!, forKey: kMOResultGenderKey)
		}
		if driverStatus != nil {
			dictionary.updateValue(driverStatus!, forKey: kMOResultDriverStatusKey)
		}
		if password != nil {
			dictionary.updateValue(password!, forKey: kMOResultPasswordKey)
		}
		if driverAge != nil {
			dictionary.updateValue(driverAge!, forKey: kMOResultDriverAgeKey)
		}
		if activeRideId != nil {
			dictionary.updateValue(activeRideId!, forKey: kMOResultActiveRideIdKey)
		}
		if changePasswordToken != nil {
			dictionary.updateValue(changePasswordToken!, forKey: kMOResultChangePasswordTokenKey)
		}
		if newsletterPm != nil {
			dictionary.updateValue(newsletterPm!, forKey: kMOResultNewsletterPmKey)
		}
		if activationCode != nil {
			dictionary.updateValue(activationCode!, forKey: kMOResultActivationCodeKey)
		}
		if emergencyPhone != nil {
			dictionary.updateValue(emergencyPhone!, forKey: kMOResultEmergencyPhoneKey)
		}
		if dob != nil {
			dictionary.updateValue(dob!, forKey: kMOResultDobKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.isLogin = aDecoder.decodeObjectForKey(kMOResultIsLoginKey) as? String
		self.plateNumber = aDecoder.decodeObjectForKey(kMOResultPlateNumberKey) as? String
		self.updateBy = aDecoder.decodeObjectForKey(kMOResultUpdateByKey) as? String
		self.category = aDecoder.decodeObjectForKey(kMOResultCategoryKey) as? String
		self.age = aDecoder.decodeObjectForKey(kMOResultAgeKey) as? String
		self.onDuty = aDecoder.decodeObjectForKey(kMOResultOnDutyKey) as? String
		self.profileImage = aDecoder.decodeObjectForKey(kMOResultProfileImageKey) as? String
		self.companyName = aDecoder.decodeObjectForKey(kMOResultCompanyNameKey) as? String
		self.isDeleted = aDecoder.decodeObjectForKey(kMOResultIsDeletedKey) as? String
		self.isActivate = aDecoder.decodeObjectForKey(kMOResultIsActivateKey) as? String
		self.name = aDecoder.decodeObjectForKey(kMOResultNameKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kMOResultInternalIdentifierKey) as? String
		self.updatedAt = aDecoder.decodeObjectForKey(kMOResultUpdatedAtKey) as? String
		self.branchId = aDecoder.decodeObjectForKey(kMOResultBranchIdKey) as? String
		self.timezone = aDecoder.decodeObjectForKey(kMOResultTimezoneKey) as? String
		self.phone = aDecoder.decodeObjectForKey(kMOResultPhoneKey) as? String
		self.createdAt = aDecoder.decodeObjectForKey(kMOResultCreatedAtKey) as? String
		self.deviceToken = aDecoder.decodeObjectForKey(kMOResultDeviceTokenKey) as? String
		self.profileImagePath = aDecoder.decodeObjectForKey(kMOResultProfileImagePathKey) as? String
		self.badgeNumber = aDecoder.decodeObjectForKey(kMOResultBadgeNumberKey) as? String
		self.deviceType = aDecoder.decodeObjectForKey(kMOResultDeviceTypeKey) as? String
		self.authToken = aDecoder.decodeObjectForKey(kMOResultAuthTokenKey) as? String
		self.email = aDecoder.decodeObjectForKey(kMOResultEmailKey) as? String
		self.roleName = aDecoder.decodeObjectForKey(kMOResultRoleNameKey) as? String
		self.roleId = aDecoder.decodeObjectForKey(kMOResultRoleIdKey) as? String
		self.gender = aDecoder.decodeObjectForKey(kMOResultGenderKey) as? String
		self.driverStatus = aDecoder.decodeObjectForKey(kMOResultDriverStatusKey) as? String
		self.password = aDecoder.decodeObjectForKey(kMOResultPasswordKey) as? String
		self.driverAge = aDecoder.decodeObjectForKey(kMOResultDriverAgeKey) as? String
		self.activeRideId = aDecoder.decodeObjectForKey(kMOResultActiveRideIdKey) as? String
		self.changePasswordToken = aDecoder.decodeObjectForKey(kMOResultChangePasswordTokenKey) as? String
		self.newsletterPm = aDecoder.decodeObjectForKey(kMOResultNewsletterPmKey) as? String
		self.activationCode = aDecoder.decodeObjectForKey(kMOResultActivationCodeKey) as? String
		self.emergencyPhone = aDecoder.decodeObjectForKey(kMOResultEmergencyPhoneKey) as? String
		self.dob = aDecoder.decodeObjectForKey(kMOResultDobKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(isLogin, forKey: kMOResultIsLoginKey)
		aCoder.encodeObject(plateNumber, forKey: kMOResultPlateNumberKey)
		aCoder.encodeObject(updateBy, forKey: kMOResultUpdateByKey)
		aCoder.encodeObject(category, forKey: kMOResultCategoryKey)
		aCoder.encodeObject(age, forKey: kMOResultAgeKey)
		aCoder.encodeObject(onDuty, forKey: kMOResultOnDutyKey)
		aCoder.encodeObject(profileImage, forKey: kMOResultProfileImageKey)
		aCoder.encodeObject(companyName, forKey: kMOResultCompanyNameKey)
		aCoder.encodeObject(isDeleted, forKey: kMOResultIsDeletedKey)
		aCoder.encodeObject(isActivate, forKey: kMOResultIsActivateKey)
		aCoder.encodeObject(name, forKey: kMOResultNameKey)
		aCoder.encodeObject(internalIdentifier, forKey: kMOResultInternalIdentifierKey)
		aCoder.encodeObject(updatedAt, forKey: kMOResultUpdatedAtKey)
		aCoder.encodeObject(branchId, forKey: kMOResultBranchIdKey)
		aCoder.encodeObject(timezone, forKey: kMOResultTimezoneKey)
		aCoder.encodeObject(phone, forKey: kMOResultPhoneKey)
		aCoder.encodeObject(createdAt, forKey: kMOResultCreatedAtKey)
		aCoder.encodeObject(deviceToken, forKey: kMOResultDeviceTokenKey)
		aCoder.encodeObject(profileImagePath, forKey: kMOResultProfileImagePathKey)
		aCoder.encodeObject(badgeNumber, forKey: kMOResultBadgeNumberKey)
		aCoder.encodeObject(deviceType, forKey: kMOResultDeviceTypeKey)
		aCoder.encodeObject(authToken, forKey: kMOResultAuthTokenKey)
		aCoder.encodeObject(email, forKey: kMOResultEmailKey)
		aCoder.encodeObject(roleName, forKey: kMOResultRoleNameKey)
		aCoder.encodeObject(roleId, forKey: kMOResultRoleIdKey)
		aCoder.encodeObject(gender, forKey: kMOResultGenderKey)
		aCoder.encodeObject(driverStatus, forKey: kMOResultDriverStatusKey)
		aCoder.encodeObject(password, forKey: kMOResultPasswordKey)
		aCoder.encodeObject(driverAge, forKey: kMOResultDriverAgeKey)
		aCoder.encodeObject(activeRideId, forKey: kMOResultActiveRideIdKey)
		aCoder.encodeObject(changePasswordToken, forKey: kMOResultChangePasswordTokenKey)
		aCoder.encodeObject(newsletterPm, forKey: kMOResultNewsletterPmKey)
		aCoder.encodeObject(activationCode, forKey: kMOResultActivationCodeKey)
		aCoder.encodeObject(emergencyPhone, forKey: kMOResultEmergencyPhoneKey)
		aCoder.encodeObject(dob, forKey: kMOResultDobKey)

    }

}
