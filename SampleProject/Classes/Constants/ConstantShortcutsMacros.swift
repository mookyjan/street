//
//  ConstantShortcuts_All.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
//
// Localized string helpers

import UIKit
import Foundation

//let  LOCALIZED_STRING(string) NSLocalizedString(string, nil)
//let LANG = LOCALIZED_STRING("globals.lang")
//let LANG_DISPLAY = LOCALIZED_STRING("globals.langDisplay")
// Shared instance shortcuts
let NOTIFICATION_CENTER = NSNotificationCenter.defaultCenter()
let FILE_MANAGER = NSFileManager.defaultManager()
let MAIN_BUNDLE = NSBundle.mainBundle()
let MAIN_THREAD = NSThread.mainThread()
let MAIN_SCREEN = UIScreen.mainScreen()
let USER_DEFAULTS = NSUserDefaults.standardUserDefaults()
let APPLICATION = UIApplication.sharedApplication()
let CURRENT_DEVICE = UIDevice.currentDevice()
let MAIN_RUN_LOOP = NSRunLoop.mainRunLoop()
let GENERAL_PASTEBOARD = UIPasteboard.generalPasteboard()
let CURRENT_LANGUAGE = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode)!

// Network
let NETWORK_ACTIVITY = APPLICATION.networkActivityIndicatorVisible
// Color consts
let CLEAR_COLOR = UIColor.clearColor()
// Application informations
let APPLICATION_NAME = MAIN_BUNDLE.infoDictionary?[kCFBundleNameKey as String]
let APPLICATION_VERSION = MAIN_BUNDLE.objectForInfoDictionaryKey("CFBundleVersion")
let IN_SIMULATOR = (TARGET_IPHONE_SIMULATOR != 0)