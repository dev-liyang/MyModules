//
//  ReverseList.h
//  Algorithm-Training
//
//  Created by liyang on 2019/1/25.
//  Copyright © 2018年 liyang. All rights reserved.
//

#ifndef ReverseList_h
#define ReverseList_h

//链表相关算法题
#include <stdio.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

//构造一个链表
struct ListNode * constuctList(void);
//构造一个链表
struct ListNode * constuctList2(void);
//打印链表
void printfList(struct ListNode *head);

//-------------------- LeetCode ------------------- //
//LeetCode:2.两数相加
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2);

//LeetCode:19. 删除链表的倒数第N个节点
struct ListNode* removeNthFromEnd(struct ListNode* head, int n);

//LeetCode:21. 合并两个有序链表
struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2);

//LeetCode:206.反转链表
struct ListNode * reverseList(struct ListNode *head);

#endif /* ReverseList_h */
