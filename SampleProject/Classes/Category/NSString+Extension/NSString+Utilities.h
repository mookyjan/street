#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreFoundation/CoreFoundation.h>

@interface NSString (Extensions) 

- (NSNumber*)utilities_stringToNSNumber;
- (BOOL)utilities_isEmpty;
- (BOOL)utilities_stringContainsSubString:(NSString *)subString;
- (NSString *)utilities_stringByReplacingStringsFromDictionary:(NSDictionary *)dict;
//
//  NSString+EPPZKit.h
//  EPPZKit
//
//  Created by Borbás Geri on 1/19/12.
//  Copyright (c) 2013 eppz! development, LLC.
//
//  donate! by following http://www.twitter.com/_eppz
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

//Extend NSString with some smart functions.


-(BOOL)utilities_isEqualToStringIgnoringCase:(NSString*) string;
-(NSString*)utilities_firstFiveCharacter;
-(NSString*)utilities_firstTenCharacter;


#pragma mark - URL encoding

-(NSString*)utilities_urlEncode;
-(NSString*)utilities_urlDecode;


#pragma mark - Date detector

-(NSDate*)utilities_dateValue;

#pragma mark -
#pragma mark Dejal
#pragma mark -


@end
@interface NSString (Dejal)

+ (NSString *)utilities_stringWithIntegerValue:(NSInteger)value;
+ (NSString *)utilities_stringWithFloatValue:(CGFloat)value places:(NSInteger)places;
+ (NSString *)utilities_stringWithTruncatedFloatValue:(CGFloat)value;

+ (NSString *)utilities_stringWithIntegerValue:(NSInteger)value zero:(NSString *)zero singluar:(NSString *)singular plural:(NSString *)plural;

+ (NSString *)utilities_stringWithFloatValue:(CGFloat)value zero:(NSString *)zero singluar:(NSString *)singular plural:(NSString *)plural;

+ (NSString *)utilities_stringWithTimeInterval:(NSTimeInterval)seconds;
+ (NSString *)utilities_stringWithTimeInterval:(NSTimeInterval)seconds suffix:(NSString *)suffix;

+ (NSString *)utilities_stringWithRoundedTimeInterval:(NSTimeInterval)seconds suffix:(NSString *)suffix;

+ (NSString *)utilities_stringWithSeconds:(NSInteger)seconds minuteSingular:(NSString *)minuteSingular minutesPlural:(NSString *)minutesPlural secondSingular:(NSString *)secondSingular secondsPlural:(NSString *)secondsPlural;

+ (NSString *)utilities_stringWithIntegerValue:(NSInteger)value minimumLength:(NSUInteger)minLength paddedWith:(NSString *)padding padLeft:(BOOL)padLeft;

+ (NSString *)utilities_stringWithLeadingZeroesForIntegerValue:(NSInteger)value digits:(NSInteger)digits;

+ (NSString *)utilities_stringAsBytesWithInteger:(NSInteger)bytes;

+ (NSString *)utilities_stringWithPrefix:(NSString *)prefix keyword:(NSString *)keyword suffix:(NSString *)suffix or:(NSString *)alternative;

- (id)utilities_or:(id)preferred;
- (NSString *)utilities_indexedBy:(NSUInteger)idx;

- (BOOL)utilities_containsSomething;

//- (BOOL)utilities_containsString:(NSString *)subString;
//- (BOOL)utilities_containsStringCaseInsensitive:(NSString *)subString;

- (NSComparisonResult)utilities_caseAndSpaceInsensitiveCompare:(NSString *)otherString;

- (NSString *)utilities_lowercasedLettersOnly;
- (NSString *)utilities_lowercasedLettersOrDigitsOnly;
- (BOOL)utilities_containsStringLetters:(NSString *)otherString;
- (BOOL)utilities_isLetterEquivalentToString:(NSString *)otherString;

- (NSString *)utilities_stringByRemovingCharactersInSet:(NSCharacterSet *)set;
- (NSString *)utilities_stringByRemovingDiacriticalMarks;
- (NSString *)utilities_stringByRemovingQuotesAndSpaces;

- (NSString *)utilities_stringByRemovingPrefix:(NSString *)prefix;
- (NSString *)utilities_stringByRemovingSuffix:(NSString *)suffix;

- (NSString *)utilities_stringByDeletingLeadingSpaces:(BOOL)leading trailingSpaces:(BOOL)trailing;

- (NSString *)utilities_stringWithMinimumLength:(NSUInteger)minLength paddedWith:(NSString *)padding padLeft:(BOOL)padLeft;

- (NSArray *)utilities_componentsSeparatedByLength:(NSUInteger)length;
+ (NSUInteger)utilities_lengthOfInteger:(NSInteger)integer;

- (NSInteger)utilities_signedLength;
- (NSInteger)utilities_wordCount;

- (NSDictionary *)utilities_dictionaryWithVersionComponents;
+ (NSString *)utilities_versionWithDictionary:(NSDictionary *)dict;
+ (NSString *)utilities_versionWithMajor:(NSInteger)major minor:(NSInteger)minor bug:(NSInteger)bug kind:(NSString *)kind stage:(NSInteger)stage;

- (NSString *)utilities_left:(NSInteger)length;
- (NSString *)utilities_right:(NSInteger)length;

- (NSString *)utilities_from:(NSUInteger)position length:(NSUInteger)length;
- (NSString *)utilities_from:(NSUInteger)startPosition to:(NSUInteger)endPosition;

- (NSString *)utilities_substringFromString:(NSString *)string;
- (NSString *)utilities_substringToString:(NSString *)string;
- (NSString *)utilities_substringFromString:(NSString *)startString toString:(NSString *)endString defaultString:(NSString *)defaultString;

- (NSRange)utilities_rangeFromString:(NSString *)startString toString:(NSString *)endString;
- (NSRange)utilities_rangeFromString:(NSString *)startString toString:(NSString *)endString inclusive:(BOOL)inclusive;

- (NSString *)utilities_reverse;

- (NSUInteger)utilities_checksum;

- (NSString *)utilities_mask;
- (NSString *)utilities_unmask;

- (NSString *)utilities_encodeAsBase64UsingEncoding:(NSStringEncoding)encoding;
- (NSString *)utilities_decodeFromBase64UsingEncoding:(NSStringEncoding)encoding;

- (NSString *)utilities_rotate13;

+ (NSString *)utilities_uuid;

- (NSInteger)utilities_integerMappedFromString:(NSString *)value withDefault:(NSInteger)defaultValue;
- (NSString *)utilities_stringMappedFromInteger:(NSInteger)value withDefault:(NSString *)defaultValue;
- (NSString *)utilities_mappedFromValue:(id)value withDefault:(id)defaultValue;

@end


// ----------------------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------------------


@interface NSString (DejalInternet)

- (NSString *)utilities_stringByReplacingPercentEscapes;
- (NSString *)utilities_stringByAddingPercentEscapes;

- (NSString *)utilities_stringByMakingURLSafe;

- (NSString *)utilities_stringByStrippingHTML;

- (NSString *)utilities_stringByCleaningURL;
- (NSString *)utilities_stringByCleaningURLWithDefaultScheme:(NSString *)scheme;

- (NSURL *)utilities_urlValue;

@end


// ----------------------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------------------


@interface NSString (DejalFilePath)

- (NSString *)utilities_stringByCleaningFilenameWithDefault:(NSString *)defaultFilename;
- (NSString *)utilities_stringByAppendingPathComponent:(NSString *)dirtyFilename cleanWithDefault:(NSString *)defaultFilename;

- (NSString *)utilities_lastPathComponentWithoutExtension;

- (NSString *)utilities_backupFilePath;

- (NSString *)utilities_uniquePath;
- (NSString *)utilities_uniquePathWithPrefix:(NSString *)prefix;

- (NSString *)utilities_validatedDirectoryPath;
- (NSString *)utilities_validatedFilePath;

- (NSString *)utilities_expandedPath;
- (NSString *)utilities_abbreviatedPath;

@end


// ----------------------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------------------


@interface NSString (DejalPropertyList)

+ (NSString *)utilities_stringWithBoolValue:(BOOL)value;

@end


// ----------------------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------------------


@interface NSMutableString (Dejal)

- (void)utilities_deleteCharactersInSet:(NSCharacterSet *)set;

- (void)utilities_caseInsensitiveReplaceAllOccurrencesOf:(NSString *)string1 with:(NSString *)string2;
- (void)utilities_replaceAllOccurrencesOf:(NSString *)string1 with:(NSString *)string2;

- (void)utilities_deleteLeadingSpaces:(BOOL)leading trailingSpaces:(BOOL)trailing;

- (void)utilities_appendString:(NSString *)string or:(NSString *)alternative;
- (void)utilities_appendPrefix:(NSString *)prefix keyword:(NSString *)keyword;
- (void)utilities_appendPrefix:(NSString *)prefix keyword:(NSString *)keyword suffix:(NSString *)suffix or:(NSString *)alternative;
- (void)utilities_appendSeparator:(NSString *)separator prefix:(NSString *)prefix keyword:(NSString *)keyword suffix:(NSString *)suffix  or:(NSString *)alternative;

@end
