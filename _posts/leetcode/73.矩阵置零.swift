/*
 * @lc app=leetcode.cn id=73 lang=swift
 *
 * [73] 矩阵置零
 *
 * https://leetcode-cn.com/problems/set-matrix-zeroes/description/
 *
 * algorithms
 * Medium (55.85%)
 * Likes:    319
 * Dislikes: 0
 * Total Accepted:    58.3K
 * Total Submissions: 104.3K
 * Testcase Example:  '[[1,1,1],[1,0,1],[1,1,1]]'
 *
 * 给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。
 * 
 * 示例 1:
 * 
 * 输入: 
 * [
 * [1,1,1],
 * [1,0,1],
 * [1,1,1]
 * ]
 * 输出: 
 * [
 * [1,0,1],
 * [0,0,0],
 * [1,0,1]
 * ]
 * 
 * 
 * 示例 2:
 * 
 * 输入: 
 * [
 * [0,1,2,0],
 * [3,4,5,2],
 * [1,3,1,5]
 * ]
 * 输出: 
 * [
 * [0,0,0,0],
 * [0,4,5,0],
 * [0,3,1,0]
 * ]
 * 
 * 进阶:
 * 
 * 
 * 一个直接的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 * 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 * 你能想出一个常数空间的解决方案吗？
 * 
 * 
 */

// @lc code=start
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix.first!.count
        var rows = [Int]()
        var cols = [Int]()

        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    rows.append(i)
                    cols.append(j)
                }
            }
        }

        for row in rows {
            for col in 0..<n {
                matrix[row][col] = 0
            }
        }

        for col in cols {
            for row in 0..<m {
                matrix[row][col] = 0
            }
        }
    }
}
// @lc code=end

