//
//  SCNCodeSnippet.h
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import <Foundation/Foundation.h>

// Platform
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetPlatformiOS;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetPlatformAll;

// Language
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetLanguageObjC;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetLanguageSwift;

// Scope
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeClassImplementation;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeClassInterfaceVariables;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeClassInterfaceMethods;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeCodeExpression;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeCodeBlock;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopePreprocessor;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeStringOrComment;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeTopLevel;
FOUNDATION_EXPORT NSString * _Nonnull const SCNCodeSnippetScopeAll;

typedef NS_ENUM(NSUInteger, kSCNCodeSnippetPlatform) {
    kSCNCodeSnippetPlatformiOS,
    kSCNCodeSnippetPlatformAll
};

typedef NS_ENUM(NSUInteger, kSCNCodeSnippetLanguage) {
    kSCNCodeSnippetLanguageObjC,
    kSCNCodeSnippetLanguageSwift
};

typedef NS_ENUM(NSUInteger, kSCNCodeSnippetScope) {
    kSCNCodeSnippetScopeClassImplementation,
    kSCNCodeSnippetScopeClassInterfaceVariables,
    kSCNCodeSnippetScopeClassInterfaceMethods,
    kSCNCodeSnippetScopeCodeExpression,
    kSCNCodeSnippetScopeCodeBlock,
    kSCNCodeSnippetScopePreprocessor,
    kSCNCodeSnippetScopeStringOrComment,
    kSCNCodeSnippetScopeTopLevel,
    kSCNCodeSnippetScopeAll
};

NS_ASSUME_NONNULL_BEGIN

@interface SCNCodeSnippet : NSObject

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy, nullable) NSString *summary;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, copy) NSString *language;

@property (nonatomic, copy) NSString *shortcut;

@property (nonatomic, copy) NSArray<NSString *> *scopes;

@property (nonatomic, copy) NSString *contents;

+ (instancetype)codeSnippetObjCWithTitle:(NSString *)title
                                shortcut:(NSString *)shortcut
                                  scopes:(NSArray<NSNumber *> *)scopes
                                contents:(NSString *)contents;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
