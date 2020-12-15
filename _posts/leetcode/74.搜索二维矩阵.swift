/*
 * @lc app=leetcode.cn id=74 lang=swift
 *
 * [74] 搜索二维矩阵
 *
 * https://leetcode-cn.com/problems/search-a-2d-matrix/description/
 *
 * algorithms
 * Medium (39.16%)
 * Likes:    268
 * Dislikes: 0
 * Total Accepted:    68.3K
 * Total Submissions: 174.4K
 * Testcase Example:  '[[1,3,5,7],[10,11,16,20],[23,30,34,50]]\n3'
 *
 * 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
 * 
 * 
 * 每行中的整数从左到右按升序排列。
 * 每行的第一个整数大于前一行的最后一个整数。
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]], target = 3
 * 输出：true
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]], target = 13
 * 输出：false
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：matrix = [], target = 0
 * 输出：false
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * m == matrix.length
 * n == matrix[i].length
 * 0 
 * -10^4 
 * 
 * 
 */

// @lc code=start
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        let rowCount = matrix.count

        if rowCount == 0 {
            return false
        }

        let colCount = matrix.first!.count
        if colCount == 0 {
            return false
        }

        let count = rowCount * colCount

        var left = 0
        var right = count - 1

        while left <= right {
            let mid = (right + left) / 2

            let row = mid / colCount
            let col = mid % colCount

            let cur = matrix[row][col]
            if cur == target {
                return true
            } else if cur > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return false

    }
}
// @lc code=end

