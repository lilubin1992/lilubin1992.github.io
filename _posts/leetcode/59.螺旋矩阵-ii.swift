/*
 * @lc app=leetcode.cn id=59 lang=swift
 *
 * [59] 螺旋矩阵 II
 *
 * https://leetcode-cn.com/problems/spiral-matrix-ii/description/
 *
 * algorithms
 * Medium (78.39%)
 * Likes:    256
 * Dislikes: 0
 * Total Accepted:    50.9K
 * Total Submissions: 64.9K
 * Testcase Example:  '3'
 *
 * 给定一个正整数 n，生成一个包含 1 到 n^2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。
 * 
 * 示例:
 * 
 * 输入: 3
 * 输出:
 * [
 * ⁠[ 1, 2, 3 ],
 * ⁠[ 8, 9, 4 ],
 * ⁠[ 7, 6, 5 ]
 * ]
 * 
 */

// @lc code=start
class Solution {

    func makeMatrix(_ matrix : inout [[Int]], _ center: Int, _ index: inout Int) {
        
        var row = 0
        var col = 0

        let m = matrix.count - center * 2

        if m == 1 {
            matrix[center][center] = matrix.count * matrix.count
        }

        let total = m * 4 - 4

        for i in 0..<total {
            
            matrix[center + row][center + col] = index
            index += 1
            if i < m - 1 {
                col += 1
            } else if i < m * 2 - 2 {
                row += 1
            } else if i < m + m * 2 - 3 {
                col -= 1
            } else {
                row -= 1
            }

        }

    }

    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

        let count = n / 2 - (n % 2 == 0 ? 1 : 0)

        var index = 1

        for i in 0...count {
            makeMatrix(&matrix, i, &index)
        }

        return matrix
    }
}
// @lc code=end

