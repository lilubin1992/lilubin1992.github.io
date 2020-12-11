/*
 * @lc app=leetcode.cn id=54 lang=swift
 *
 * [54] 螺旋矩阵
 *
 * https://leetcode-cn.com/problems/spiral-matrix/description/
 *
 * algorithms
 * Medium (41.39%)
 * Likes:    530
 * Dislikes: 0
 * Total Accepted:    88.2K
 * Total Submissions: 213K
 * Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
 *
 * 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * ⁠[ 1, 2, 3 ],
 * ⁠[ 4, 5, 6 ],
 * ⁠[ 7, 8, 9 ]
 * ]
 * 输出: [1,2,3,6,9,8,7,4,5]
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * [
 * ⁠ [1, 2, 3, 4],
 * ⁠ [5, 6, 7, 8],
 * ⁠ [9,10,11,12]
 * ]
 * 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
 * 
 * 
 */

// @lc code=start
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        let count = min(matrix.count, matrix.first!.count) / 2
        var ans = [Int]()

        for i in 0...count {
            ans.append(contentsOf: outOrder(matrix, i))
        }

        return ans
    }

    func outOrder(_ matrix: [[Int]], _ center: Int) -> [Int] {
        
        var row = 0
        var col = 0

        let m = matrix.count - center * 2
        let n = matrix.first!.count - center * 2

        // if m == 1 {
        //     return matrix.first!
        // }

        if m == 0 || n == 0 {
            return []
        }

        // if m == 1 && n == 1 {
        //     return [matrix[center][center]]
        // }

        var total = m * 2 + n * 2 - 4
        if m == 1 || n == 1{
            total = max(m, n)
        }

        var path = [Int]()

        for i in 0..<total {
            path.append(matrix[center + row][center + col])
            if i < n - 1 {
                col += 1
            } else if i < m + n - 1 - 1 {
                row += 1
            } else if i < m + n * 2 - 2 - 1 {
                col -= 1
            } else {
                row -= 1
            }
        }

        return path
    }
}
// @lc code=end

