/*
 * @lc app=leetcode.cn id=96 lang=swift
 *
 * [96] 不同的二叉搜索树
 *
 * https://leetcode-cn.com/problems/unique-binary-search-trees/description/
 *
 * algorithms
 * Medium (69.20%)
 * Likes:    922
 * Dislikes: 0
 * Total Accepted:    95.9K
 * Total Submissions: 138.5K
 * Testcase Example:  '3'
 *
 * 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？
 * 
 * 示例:
 * 
 * 输入: 3
 * 输出: 5
 * 解释:
 * 给定 n = 3, 一共有 5 种不同结构的二叉搜索树:
 * 
 * ⁠  1         3     3      2      1
 * ⁠   \       /     /      / \      \
 * ⁠    3     2     1      1   3      2
 * ⁠   /     /       \                 \
 * ⁠  2     1         2                 3
 * 
 */

// @lc code=start
class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)

        if n == 0 || n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }

        dp[0] = 1
        dp[1] = 1
        dp[2] = 2

        for i in 3...n {
            for j in 0...(i-1) {
                dp[i] += dp[j] * dp[i-j-1]
            }
        }

        return dp[n]
    }
}
// @lc code=end

