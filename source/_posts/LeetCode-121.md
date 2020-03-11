---
title: LeetCode_121.买卖股票的最佳时机
date: 2020-03-11 11:35:19
tags: "LeetCode"
categories: "LeetCode"
---
## 题目描述
给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。

注意你不能在买入股票前卖出股票。
<!--more-->
### 示例1：
```
输入: [7,1,5,3,6,4]
输出: 5
解释: 在第 2 天（股票价格 = 1）的时候买入   
      在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。

```
### 示例2:
```
输入: [7,6,4,3,1]
输出: 0
解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
```
## 题解：
### 方法1：暴力
**思路**   
emmm 找最小 那就先每个都比较一下 纯暴力解法
循环嵌套 遍历数组 计算每一次买入卖出的利润   
比较所有利润 返回最大的
**算法**   
```
public class Solution {
    public int maxProfit(int prices[]) {
        int result = 0;
        for (int i = 0; i < prices.length - 1; i++) {
            for (int j = i + 1; j < prices.length; j++) {
                int profit = prices[j] - prices[i];
                if (profit > result)
                    result = profit;
            }
        }
        return result;
    }
}
```
**分析**
* 时间复杂度：O(n^2) 冒泡排序
* 空间复杂度：O(1) 常量级别



### 方法2：DP:单循环存值
**思路**   
很容易想，动态规划的思想 for循环遍历数组
* 记下「当天的最小值」
* 比较「当天价格，之前最小值」，计算「之前买入，当天卖出所获利」
* 比较「每天获利大小」 返回最终最大的

>定义两个常量 存值
1. 一个存最小价格(用于计算每天卖出获利)
1. 一个存获利情况(最终返回)

**算法**   
```java
class Solution {
    public int maxProfit(int[] prices) {
        if(prices.length <= 1){
            return 0;
        }
        int buyPrice = prices[0];//最小值
        int result = 0;

        for(int i = 1 ;i < prices.length; i++ ){
            buyPrice = Math.min(buyPrice,prices[i]);
            result = Math.max(prices[i]-buyPrice,result);
        }
        return result;
    }
}
```
**分析**   
* 时间复杂度：O(n) 单循环遍历
* 空间复杂度：O(1) 常量级别


## 更多题解详见：
[LeetCode 个人题解汇总(持续更新....)](https://www.macchac.com/2020/03/10/LeetCode-ALL/)
