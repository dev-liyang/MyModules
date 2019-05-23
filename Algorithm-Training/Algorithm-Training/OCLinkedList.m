//
//  OCLinkedList.m
//  Algorithm-Training
//
//  Created by liyang on 2019/5/10.
//  Copyright © 2019 liyang. All rights reserved.
//

#import "OCLinkedList.h"


@implementation ListNode

@end


@interface OCLinkedList ()
{
    int size;
    ListNode *first;
}
@end

@implementation OCLinkedList

- (void)addNode:(int)value{
    if (first == nil) {
        ListNode *node = [ListNode new];
        node.value = value;
        
        ListNode *firstNode = [ListNode new];
        first = firstNode;
        first.next = node;
    } else {
        ListNode *tmp = first;
        while (tmp) {
            if (tmp.next == nil) {
                ListNode *node = [ListNode new];
                node.value = value;
                tmp.next = node;
                break;
            }
            tmp = tmp.next;
        }
    }
    size ++;
}

- (void)deleteElement:(int)element{
    ListNode *head = first.next;
    for (int i = 0; i < size; i ++) {
        if (head.value == element) {
            head.value = head.next.value;
            head.next = head.next.next;
            i --;
            size --;
            continue;
        }
        head = head.next;
    }
}

- (void)deleteOfIndex:(int)index{
    
    if (index == 0) {
        first.next = first.next.next;
        return;
    }
    
    ListNode *preNode = [self getNodeOfIndex:index - 1];
    preNode.next = preNode.next.next;
    size --;
}

- (int)getOfIndex:(int)index{
    return [self getNodeOfIndex:index].value;
}

- (void)printfLinedList{
    NSMutableString *listStr = [NSMutableString string];
    ListNode *head = first.next;
    while (head != nil) {
        [listStr appendFormat:@"%d->", head.value];
        head = head.next;
    }
    [listStr appendFormat:@"null"];
    NSLog(@"---start\n%@\nend", listStr);
}

#pragma mark - private methods

- (ListNode *)getNodeOfIndex:(int)index{
    
    if ([self rangeCheckIndex:index]) {
        return nil;
    }
    
    ListNode *node = first.next;
    for (int i = 0; i < index; i ++) {
        node = node.next;
    }
    
    return node;
}

- (BOOL)rangeCheckIndex:(int)index{
    if (index < 0 && index >= size) {
        return YES;
    }
    return NO;
}


@end
