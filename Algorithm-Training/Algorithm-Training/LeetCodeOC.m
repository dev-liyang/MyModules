//
//  LeetCodeOC.m
//  Algorithm-Training
//
//  Created by liyang on 2019/1/25.
//  Copyright © 2019 liyang. All rights reserved.
//

#import "LeetCodeOC.h"

@implementation LeetCodeOC

//--------------------------- Debug Start ---------------------------//

//--------------------------- Debug End ---------------------------//


//LeetCode: 3.无重复字符的最长子串（滑动窗口）
- (int)lengthOfLongestSubstring:(NSString *)s{
    int n = (int)s.length;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    int i = 0, j = 0, len = 0;
    while (i < n && j < n) {
        NSString *charS = [s substringWithRange:NSMakeRange(j, 1)];//指针j所在位置的字符
        if (!dic[charS]) { //j所在字符没有在当前哈希表中，将该字符存进哈希表中，并将窗口j向右滑动一位，长度等于j减去i的差值
            dic[charS] = @"YES";
            j++;
            len = MAX(len, j-i);
        } else { //j所在字符已存在哈希表中，先从哈希表中删除当前i所在位置字符，然后将i向右滑动一位
            NSString *charIndexIS = [s substringWithRange:NSMakeRange(i, 1)];//指针i所在位置的字符
            dic[charIndexIS] = nil;
            i ++;
        }
    }
    return len;
}

/**
 LeetCode:14.最长公共前缀
 */
- (NSString *)longestCommonPrefix:(NSArray *)strs{
    int arrCount = (int)strs.count;
    int index = 0;
    while (1) {
        char temp = '\0';
        int count = 0;
        for (int i = 0; i < arrCount; i ++) {
            NSString *subString = strs[i];
            if (index >= subString.length) {
                return [[strs firstObject] substringToIndex:index];
            }
            
            char sub = [subString characterAtIndex:index];
            if (temp == '\0') {
                temp = sub;
                
            } else if(sub == temp){
                count ++;
                
            } else {
                return [[strs firstObject] substringToIndex:index];
            }
        }
        index ++;
    }
}

/**
 LeetCode: 26.从排序数组中删除重复项
 条件：给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 比如:[0,0,1,1,1,2,2,3,3,4]
 返回:5  (这时数组的前5个元素变成0,1,2,3,4)
 */
int removeDuplicates(int* nums, int numsSize) {
    if (numsSize == 0) {
        return 0;
    }
    int value = nums[0];
    int curtIndex = 1;
    int nextIndex = 1;
    int count = 1;
    while (curtIndex < numsSize && nextIndex < numsSize) {
        if (value >= nums[curtIndex]) {
            if (value < nums[nextIndex]) {
                int temp = nums[curtIndex];
                nums[curtIndex] = nums[nextIndex];
                nums[nextIndex] = temp;
                value = nums[curtIndex];
                nextIndex ++;
                curtIndex ++;
                count ++;
            }else{
                nextIndex ++;
            }
        }else{
            value = nums[curtIndex];
            nextIndex ++;
            curtIndex ++;
            count ++;
        }
    }
    
    for (int i = 0; i < count; i ++) {
        printf("%d\n", nums[i]);
    }
    
    return count;
}

#pragma mark - LeetCode:70. 爬楼梯
/**
 解题思路：爬楼梯就是一个裴波那契数列，从第三项起，是前两项之和。F(n)=F(n-1)+F(n-2)。
 编程方法可用递归，但递归调用不适合太多次，此题可转化为for循环解决
 */
int climbStairs(int n) {
    if (n<=2) return n;
    int first = 1;
    int second = 2;
    for (int i = 2; i < n; i ++) {
        int sum = first + second;
        first = second;
        second = sum;
    }
    return second;
}

#pragma mark -  LeetCode: 88.合并两个有序数组
/**
 有序数组合并，合并后保持有序
 比如:  [1,2,5,6,8]  和 [3,6,7,8,9]
 合并后为:   [1,2,3,5,6,6,7,8,8,9]
 */
void mergeList(int a[], int aLen, int b[], int bLen, int result[]){
    int p = 0;
    int q = 0;
    int length = 0;
    while (p < aLen || q < bLen) {
        
        if (p < aLen && q < bLen) {
            if (a[p] <= b[q]) {
                result[length] = a[p];
                p++;
            }else{
                result[length] = b[q];
                q++;
            }
        }else if(p < aLen){
            result[length] = a[p];
            p++;
        }else{
            result[length] = b[q];
            q++;
        }
        length ++;
    }
    
    for (int i = 0; i < length; i ++) {
        printf("%d\n", result[i]);
    }
}

#pragma mark - LeetCode: 136.找到第一个只出现一次的字符
char firstAppearOnceChar(char *str){
    
    char result = '\0';
    
    int array[256];
    
    char *p = str;
    
    while (*p != '\0') {
        array[*p] = ++array[*p];
        p++;
    }
    
    p = str;
    while (*p != '\0') {
        if (array[*p] == 1) {
            result = *p;
            break;
        }
        p ++;
    }
    
    return result;
}

/*
 LeetCode: 136.只出现一次的数字
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 示例 1:
 输入: [4,0,4]
 输出: 0
 
 异或操作(两个相同的数按位异或是0，与0按位异或的数是它本身)
 
 0x100 = 4
 0x000 = 0
 ||
 0x100
 0x100 = 4
 ||
 0x000 => 0
 
 示例 2:
 输入: [4,1,2,1,2]
 输出: 4
 
 0x100 = 4
 0x001 = 1
 ||
 0x101
 0x010 = 2
 ||
 0x111
 0x001 = 1
 ||
 0x110
 0x010 = 2
 ||
 0x100 => 4
 */
int singleNumber(int* nums, int numsSize) {
    if (numsSize < 1) {
        return 0;
    }
    
    int result = nums[0];
    for (int i = 1; i < numsSize; i ++) {
        result = result ^ nums[i];
    }
    return result;
}

#pragma mark - LeetCode: 169.求众数
/**
 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 你可以假设数组是非空的，并且给定的数组总是存在众数。
 示例 1:
 输入: [3,2,3]
 输出: 3
 解题思路：分析得知众数一定是出现次数最多的那个数
 */
- (int)majorityElement:(NSArray *)arr{
    NSMutableDictionary *numCountDic = [NSMutableDictionary dictionary];
    int countMaxNumber = 0;//出现次数最多的数字
    int maxCount = 0;//出现最多的次数
    for (NSString *numberStr in arr) {
        int numCount = [[numCountDic objectForKey:numberStr] intValue];//该数字出现的次数
        numCount ++;
        [numCountDic setValue:@(numCount) forKey:numberStr];
        if (maxCount < numCount) {
            maxCount = numCount;
            countMaxNumber = [numberStr intValue];
        }
    }
    return countMaxNumber;
}


/**
 LeetCode: 283.移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 说明:
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 比如： [0, 1, 0, 3, 12]   ->  [1, 3, 12, 0, 0]
 [4,2,4,0,0,3,0,5,1,0]
 注意有负数！！！
 第1次提交报错的测试用例 [4,2,4,0,0,0,6,5,3]
 第2次提交报错的测试用例 [-959151711,623836953,209446690,-1950418142,1339915067,-733626417,481171539,-2125997010,-1225423476,1462109565,147434687,-1800073781,-1431212205,-450443973,50097298,753533734,-747189404,-2070885638,0,-1484353894,-340296594,-2133744570,619639811,-1626162038,669689561,0,112220218]
 */
void moveZeroes(int* nums, int numsSize) {
    int current = 0;
    int next = 1;
    
    while (current < numsSize && next < numsSize) {
        if (nums[current] == 0) {
            if (nums[next] != 0) {
                int temp = nums[next];
                nums[next] = nums[current];
                nums[current] = temp;
                current ++ ;
                next ++;
            }else{
                next ++;
            }
        }else{
            current ++;
            next ++;
        }
    }
}

/**
 LeetCode: 344.反转字符串
 tips:将“hello,world”  转化为 “dlrow,olleh”
 */
void reversalString(char *cha){
    char *begin = cha;
    char *end = cha + strlen(cha) - 1;
    
    while (begin < end) {
        char temp = *begin;
        
        //        *begin = *end;
        //        *end = temp;
        //
        //        begin ++;
        //        end --;
        
        //上面注释的等价于下面👇
        
        *(begin ++) = *end;
        *(end --) = temp;
    }
}

@end
