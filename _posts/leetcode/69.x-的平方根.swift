/*
 * @lc app=leetcode.cn id=69 lang=swift
 *
 * [69] x 的平方根
 *
 * https://leetcode-cn.com/problems/sqrtx/description/
 *
 * algorithms
 * Easy (38.96%)
 * Likes:    555
 * Dislikes: 0
 * Total Accepted:    235.4K
 * Total Submissions: 603.4K
 * Testcase Example:  '4'
 *
 * 实现 int sqrt(int x) 函数。
 * 
 * 计算并返回 x 的平方根，其中 x 是非负整数。
 * 
 * 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 * 
 * 示例 1:
 * 
 * 输入: 4
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 输入: 8
 * 输出: 2
 * 说明: 8 的平方根是 2.82842..., 
 * 由于返回类型是整数，小数部分将被舍去。
 * 
 * 
 */

// @lc code=start
class Solution {
    func mySqrt(_ num: Int) -> Int {
        var left = 0
        var right = num
        while left < right {
            let mid = (right + left + 1) / 2
            if mid * mid > num {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}
// @lc code=end

