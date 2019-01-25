//
//  ReverseList.c
//  Algorithm-Training
//
//  Created by liyang on 2019/1/25.
//  Copyright © 2018年 liyang. All rights reserved.
//

#include "ReverseList.h"

//构造一个链表1
struct ListNode * constuctList(void){
    //头结点
    struct ListNode *head = NULL;
    //当前节点
    struct ListNode *curt = NULL;
    
    for (int i = 1; i < 3; i ++) {
        struct ListNode *node = malloc(sizeof(struct ListNode));
        node->val = i;
        node->next = NULL;
        if (head == NULL) {
            head = node;
        }else{
            curt->next = node;
        }
        curt = node;
    }
    
    return head;
}
//构造一个链表2
struct ListNode * constuctList2(void){
    //头结点
    struct ListNode *head = NULL;
    //当前节点
    struct ListNode *curt = NULL;
    
    for (int i = 2; i < 5; i ++) {
        struct ListNode *node = malloc(sizeof(struct ListNode));
        node->val = i;
        node->next = NULL;
        if (head == NULL) {
            head = node;
        }else{
            curt->next = node;
        }

        curt = node;
    }
    
    return head;
}

//打印链表
void printfList(struct ListNode *head){
    struct ListNode *node = head;
    while (node != NULL) {
        printf("%d->", node->val);
        node = node->next;
    }
    printf("NULL\n\n");
}

//-------------------- LeetCode ------------------- //
//LeetCode:2.两数相加
//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    int carried = 0; //进位
    struct ListNode* result = NULL;
    struct ListNode* curtNode = NULL;
    while (1) {
        int sum = 0;//当前位的和
        if (l1 == NULL && l2 == NULL) {
            if (carried == 0) { //链表当前节点都无值并且没有进位时，结束循环
                break;
            } else {
                sum = carried;
            }
        } else if (l1 == NULL && l2 != NULL) { //l2当前节点有值
            sum = l2->val + carried;
        } else if(l1 != NULL && l2 == NULL){ //l1当前节点有值
            sum = l1->val + carried;
        } else { //都有值
            sum = l1->val + l2->val + carried;
        }
        int indexNum = sum % 10;
        
        struct ListNode* temp = malloc(sizeof(struct ListNode));
        temp->val = indexNum;
        temp->next = NULL;
        if (result == NULL) {
            result = temp;
        } else {
            curtNode->next = temp;
        }
        curtNode = temp;
        
        carried = sum / 10; //下一次是否进位
        
        if (l1 == NULL && l2 == NULL) {
            break;
        } else if (l1 == NULL && l2 != NULL) { //l2当前节点有值
            l2 = l2->next;
        } else if(l1 != NULL && l2 == NULL){ //l1当前节点有值
            l1 = l1->next;
        } else { //都有值
            l1 = l1->next;
            l2 = l2->next;
        }
    }
    return result;
}

//LeetCode:21. 合并两个有序链表
struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode* result = NULL;
    struct ListNode* curtNode = NULL;
    int indexNum = 0;
    while (l1 != NULL || l2 != NULL) {
        
        if (l1 != NULL && l2 != NULL) { //都有值
            if (l1->val < l2->val) {
                indexNum = l1->val;
                l1 = l1->next;
            } else {
                indexNum = l2->val;
                l2 = l2->next;
            }
        } else if (l1 == NULL && l2 != NULL) { //l2当前节点有值
            indexNum = l2->val;
            l2 = l2->next;
        } else if(l1 != NULL && l2 == NULL){ //l1当前节点有值
            indexNum = l1->val;
            l1 = l1->next;
        }
        
        struct ListNode* temp = malloc(sizeof(struct ListNode));
        temp->val = indexNum;
        temp->next = NULL;
        if (result == NULL) {
            result = temp;
        } else {
            curtNode->next = temp;
        }
        curtNode = temp;
    }
    return result;
}

//LeetCode:206.反转链表
struct ListNode * reverseList(struct ListNode *head){
    
    struct ListNode *p = head;
    struct ListNode *newH = NULL;
    
    while (p != NULL) {
        struct ListNode *temp = p->next;
        p->next = newH;
        newH = p;
        p = temp;
    }
    return newH;
}
