//
//  OCLinkedList.h
//  Algorithm-Training
//
//  Created by liyang on 2019/5/10.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject
@property (nonatomic, strong) ListNode *next;
@property (nonatomic, assign) int value;
@end

@interface OCLinkedList : NSObject

- (void)addNode:(int)value;
- (void)printfLinedList;

- (void)deleteElement:(int)element;
- (void)deleteOfIndex:(int)index;
- (int)getOfIndex:(int)index;

@end


NS_ASSUME_NONNULL_END
