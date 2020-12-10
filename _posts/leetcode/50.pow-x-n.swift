/*
 * @lc app=leetcode.cn id=50 lang=swift
 *
 * [50] Pow(x, n)
 *
 * https://leetcode-cn.com/problems/powx-n/description/
 *
 * algorithms
 * Medium (36.96%)
 * Likes:    554
 * Dislikes: 0
 * Total Accepted:    143.8K
 * Total Submissions: 388.9K
 * Testcase Example:  '2.00000\n10'
 *
 * 实现 pow(x, n) ，即计算 x 的 n 次幂函数。
 * 
 * 示例 1:
 * 
 * 输入: 2.00000, 10
 * 输出: 1024.00000
 * 
 * 
 * 示例 2:
 * 
 * 输入: 2.10000, 3
 * 输出: 9.26100
 * 
 * 
 * 示例 3:
 * 
 * 输入: 2.00000, -2
 * 输出: 0.25000
 * 解释: 2^-2 = 1/2^2 = 1/4 = 0.25
 * 
 * 说明:
 * 
 * 
 * -100.0 < x < 100.0
 * n 是 32 位有符号整数，其数值范围是 [−2^31, 2^31 − 1] 。
 * 
 * 
 */

// @lc code=start
class Solution {
    // func myPow(_ x: Double, _ n: Int) -> Double {
    //     var ans : Double = 1.0
    //     var absN = abs(n)

    //     if absN == 0 {
    //         ans = 1.0
    //     } else if absN == 1 {
    //         ans = x * 1.0
    //     } else if absN % 2 == 0 {
    //         ans = myPow(x * x, absN / 2)
    //     } else {
    //         ans = x * myPow(x * x, absN / 2)
    //     }

    //     if n < 0 {
    //         return 1.0 / ans
    //     } else {
    //         return ans
    //     }
    // }

    func myPow(_ x: Double, _ n: Int) -> Double {

        return n > 0 ? mulELe(x, n) : (1.0 / mulELe(x, -n))
    }

    func mulELe(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        let y = mulELe(x*x, n/2)
        return n % 2 == 0 ? y : x * y
    }
}
// @lc code=end

