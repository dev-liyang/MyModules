//
//  main.m
//  Algorithm-Training
//
//  Created by liyang on 2019/1/25.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LeetCodeOC.h"
#include "ReverseList.h"
#import "OCLinkedList.h"

/**
 判断一个数是否是质数
 */
Boolean isZhiShu(int a){
    
    for (int i = 2 ; i < a; i ++) {
        if (a % i == 0) {
            return false;
        }
    }
    
    return true;
}

//LeetCode:206.反转链表
void reverseListTest(){
    
    struct ListNode *head = constuctList();
    printfList(head);
    printf("--------\n");
    
    struct ListNode *newH = reverseList(head);
    printfList(newH);
    printf("--------\n");
}

int main(int argc, const char * argv[]) {
    
    OCLinkedList *linkedList = [OCLinkedList new];
    [linkedList addNode:1];
    [linkedList addNode:2];
    [linkedList addNode:3];
    [linkedList addNode:4];
    [linkedList addNode:3];
    [linkedList addNode:10];
    
    [linkedList printfLinedList];
    
    [linkedList deleteElement:3];
    
    [linkedList printfLinedList];
    
    NSLog(@"%d", [linkedList getOfIndex:0]);
    NSLog(@"%d", [linkedList getOfIndex:2]);
    
    //-------------------------- test-------------------------//
    //    NSLog(@"是否是质数:%d", isZhiShu(3));
    //    NSLog(@"是否是质数:%d", isZhiShu(8));
    //    NSLog(@"是否是质数:%d", isZhiShu(11));
    
    
//    LeetCodeOC *leetCode = [[LeetCodeOC alloc] init];
    
    
    
    //-------------------------- (Debug) start-------------------------//
    
//    @"flower"  @"lower"
    
    //-------------------------- (Debug) end-------------------------//
    
    
    //    struct ListNode *l1 = constuctList();
    //    struct ListNode *l2 = constuctList2();
    //    //LeetCode: 2.两数相加
    //    struct ListNode *result = addTwoNumbers(l1, l2);
    //    printfList(l1);
    //    printfList(l2);
    //    printfList(result);
    
    //    LeetCode: 3.无重复字符的最长子串（滑动窗口）
    //    NSLog(@"长度:%d", [leetCode lengthOfLongestSubstring:@"abbcd"]);
    
    
    //LeetCode: 14.最长公共前缀
//    NSString *str = [leetCode longestCommonPrefix:@[@"flight", @"flower", @"flow"]];
//    NSLog(@"最长公共前缀:%@", str);
    
    
    //LeetCode:21. 合并两个有序链表
//    struct ListNode *l1 = constuctList();
//    struct ListNode *l2 = constuctList2();
//    printfList(l1);
//    printfList(l2);
//    struct ListNode *result = mergeTwoLists(l1, l2);
//    printfList(result);
    
    
    //LeetCode:70. 爬楼梯
//    int n = 5;
//    NSLog(@"%d个台阶有%d种爬法", n, climbStairs(n));
    
    
    //LeetCode: 88.合并两个有序数组
    //    int a[] = {1,2,5,6,8};
    //    int b[] = {3,6,7,8,9};
    //    int alength = sizeof(a) / sizeof(int);
    //    int blength = sizeof(b) / sizeof(int);
    //    int result[100];
    //    mergeList(a, alength, b, blength, result);

    
    //LeetCode:121. 买卖股票的最佳时机
//    int arr[4] = {7, 3, 2, 12};
//    int size = sizeof(arr)/ sizeof(int);
//    printf("最大利润：%d", maxProfit(arr, size));
    
    //    LeetCode: 136.找到第一个只出现一次的字符
    //    char first =  firstAppearOnceChar("abccafdgh");
    //    NSLog(@"%c", first);
    
    
    //LeetCode: 136.只出现一次的数字
    //    int arr[]= {22, 22, 33, 5, 33, 0, 5};
    //    int size = sizeof(arr)/sizeof(4);
    //    int res = singleNumber(arr, size);
    //    NSLog(@"%d", res);
    
    
    //LeetCode: 169.求众数
//    int number = [leetCode majorityElement:@[@"1", @"1", @"2", @"2", @"1"]];
//    NSLog(@"众数是：%d", number);
    
    
    //LeetCode:206.反转链表
    //    reverseListTest();
    
    return 0;
}
