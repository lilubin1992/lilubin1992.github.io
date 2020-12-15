/*
 * @lc app=leetcode.cn id=64 lang=swift
 *
 * [64] 最小路径和
 *
 * https://leetcode-cn.com/problems/minimum-path-sum/description/
 *
 * algorithms
 * Medium (67.62%)
 * Likes:    706
 * Dislikes: 0
 * Total Accepted:    155.6K
 * Total Submissions: 230.1K
 * Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
 *
 * 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 * 
 * 说明：每次只能向下或者向右移动一步。
 * 
 * 示例:
 * 
 * 输入:
 * [
 * [1,3,1],
 * ⁠ [1,5,1],
 * ⁠ [4,2,1]
 * ]
 * 输出: 7
 * 解释: 因为路径 1→3→1→1→1 的总和最小。
 * 
 * 
 */

// @lc code=start
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid.first!.count

        var sums = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        // sums[0][0] = grid[0][0]

        // for i in 1..<n {
        //     sums[0][i] = sums[0][i-1] + grid[0][i]
        // }

        // for i in 1..<m {
        //     sums[i][0] = sums[i-1][0] + grid[i][0]
        // }

        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    sums[i][j] = grid[i][j]
                }
                else if i == 0 {
                    sums[i][j] = grid[i][j] + sums[i][j-1]
                } else if j == 0 {
                    sums[i][j] = grid[i][j] + sums[i-1][j]
                } else {
                    sums[i][j] = grid[i][j] + min(sums[i-1][j], sums[i][j-1])
                }

            }
        }

        return sums[m-1][n-1]
    }
}
// @lc code=end

