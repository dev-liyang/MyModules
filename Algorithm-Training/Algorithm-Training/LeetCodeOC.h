//
//  LeetCodeOC.h
//  Algorithm-Training
//
//  Created by liyang on 2019/1/25.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeetCodeOC : NSObject

//LeetCode: 3.无重复字符的最长子串（滑动窗口）
- (int)lengthOfLongestSubstring:(NSString *)s;

//LeetCode: 14.最长公共前缀(Debug)
- (NSString *)longestCommonPrefix:(NSArray *)strs;

//LeetCode: 26.从排序数组中删除重复项
int removeDuplicates(int* nums, int numsSize);

//LeetCode: 88.合并两个有序数组
void mergeList(int a[], int aLen, int b[], int bLen, int result[]);

//LeetCode: 136.找到第一个只出现一次的字符
char firstAppearOnceChar(char *str);
//LeetCode: 136.只出现一次的数字
int singleNumber(int* nums, int numsSize) ;

//LeetCode: 283.移动零
void moveZeroes(int* nums, int numsSize);

//LeetCode: 344.反转字符串
void reversalString(char *cha);
    
@end

NS_ASSUME_NONNULL_END
