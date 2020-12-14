/*
 * @lc app=leetcode.cn id=63 lang=swift
 *
 * [63] 不同路径 II
 *
 * https://leetcode-cn.com/problems/unique-paths-ii/description/
 *
 * algorithms
 * Medium (36.96%)
 * Likes:    429
 * Dislikes: 0
 * Total Accepted:    107.2K
 * Total Submissions: 290K
 * Testcase Example:  '[[0,0,0],[0,1,0],[0,0,0]]'
 *
 * 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 * 
 * 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 * 
 * 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
 * 
 * 
 * 
 * 网格中的障碍物和空位置分别用 1 和 0 来表示。
 * 
 * 说明：m 和 n 的值均不超过 100。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * [0,0,0],
 * [0,1,0],
 * [0,0,0]
 * ]
 * 输出: 2
 * 解释:
 * 3x3 网格的正中间有一个障碍物。
 * 从左上角到右下角一共有 2 条不同的路径：
 * 1. 向右 -> 向右 -> 向下 -> 向下
 * 2. 向下 -> 向下 -> 向右 -> 向右
 * 
 * 
 */

// @lc code=start
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let n = obstacleGrid.count
        let m = obstacleGrid.first!.count

        var tables = [[Int]](repeating: [Int](repeating: 1, count: m), count: n)

        //第一行，第一列， stone之后的路径均为0
        var existStone = false
        for i in 0..<m {
            if obstacleGrid[0][i] == 1 || existStone {
                tables[0][i] = 0
                existStone = true
            }
        }

        //重置stone，开始第一列遍历
        existStone = false
        for i in 0..<n {
            if obstacleGrid[i][0] == 1 || existStone {
                tables[i][0] = 0
                existStone = true
            }
        }

        for i in 1..<n {
            for j in 1..<m {
                if obstacleGrid[i][j] == 1 {
                    tables[i][j] = 0
                } else {
                    tables[i][j] = tables[i-1][j] + tables[i][j-1]
                }
            }
        }

        return tables[n-1][m-1]
    }
}
// @lc code=end

