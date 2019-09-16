//
//  SCNObjCPropertyCodeSnippetGenerator.m
//  SCNCodeSnippet
//
//  Created by Stephen Chiang on 2019/9/17.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNObjCPropertyCodeSnippetGenerator.h"
#import "SCNCodeSnippetManager.h"

@implementation SCNObjCPropertyCodeSnippetGenerator

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - Attributes

- (NSArray <NSString *> *)atomicAttributes {
    return @[@"nonatomic"];
}

- (NSArray <NSString *> *)memoryAttributes {
    return @[@"assign", @"strong", @"weak", @"copy"];
}

- (NSArray <NSString *> *)readwriteAttributes {
    return @[@"readonly", @"readwrite"];
}

- (NSArray <NSString *> *)nullableAttributes {
    return @[@"nullable", @"nonnull"];
}

- (NSString *)directory {
    return @"ObjC@property";
}

#pragma mark - Public Methods

- (void)start {
    [super start];
    
    [self generateSimpleCodeSnippets];
}

#pragma mark - Code Snippets

// 二元代码块 @property (nonatomic, assign) Type Name;

- (void)generateSimpleCodeSnippets {
    NSMutableArray *codeSinppets = [NSMutableArray new];
    for (NSString *aa in self.atomicAttributes) {
        for (NSString *ma in self.memoryAttributes) {
            NSString *cmd0 = [aa substringToIndex:1];
            NSString *cmd1 = [ma substringToIndex:1];
            NSString *title = [NSString stringWithFormat:@"@property (%@, %@)", aa, ma];
            NSString *shortcut = [NSString stringWithFormat:@"@p%@%@", cmd0, cmd1];
            NSString *contents = [NSString stringWithFormat:@"@property (%@, %@) <#Type#> <#Name#>", aa, ma];
            kSCNCodeSnippetScope scope = kSCNCodeSnippetScopeClassInterfaceMethods;
            SCNCodeSnippet *c = [SCNCodeSnippet codeSnippetObjCWithTitle:title shortcut:shortcut scopes:@[@(scope)] contents:contents];
            [codeSinppets addObject:c];
        }
    }
    NSError *error = nil;
    [SCNCodeSnippetManager.sharedManager addCodeSnippets:codeSinppets error:&error];
    if (error) {
        NSLog(@"Error: %@", error);
    } else {
        NSLog(@"The simple code snippets generated.");
    }
}

@end
