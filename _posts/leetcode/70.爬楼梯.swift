/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 *
 * https://leetcode-cn.com/problems/climbing-stairs/description/
 *
 * algorithms
 * Easy (50.93%)
 * Likes:    1377
 * Dislikes: 0
 * Total Accepted:    333.1K
 * Total Submissions: 652.8K
 * Testcase Example:  '2'
 *
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 
 * 注意：给定 n 是一个正整数。
 * 
 * 示例 1：
 * 
 * 输入： 2
 * 输出： 2
 * 解释： 有两种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶
 * 2.  2 阶
 * 
 * 示例 2：
 * 
 * 输入： 3
 * 输出： 3
 * 解释： 有三种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶 + 1 阶
 * 2.  1 阶 + 2 阶
 * 3.  2 阶 + 1 阶
 * 
 * 
 */

// @lc code=start
class Solution {
    var memCache = [Int:Int]()
    func climbStairs(_ n: Int) -> Int {
        /*方法一：
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        } else {

            if let path = memCache[n] {
                return path
            }

            let paths = climbStairs(n-1) + climbStairs(n-2)
            memCache[n] = paths

            return paths
        }
        */

        //方法二
        if n == 1 {
            return 1
        }
        var dp = [Int]()
        dp.append(1)
        dp.append(1)

        for i in 2...n {
            dp.append(dp[i-1]+dp[i-2])
        }
        return dp[n]
    }
}
// @lc code=end

