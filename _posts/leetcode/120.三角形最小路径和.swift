/*
 * @lc app=leetcode.cn id=120 lang=swift
 *
 * [120] 三角形最小路径和
 *
 * https://leetcode-cn.com/problems/triangle/description/
 *
 * algorithms
 * Medium (66.78%)
 * Likes:    630
 * Dislikes: 0
 * Total Accepted:    114.4K
 * Total Submissions: 171.4K
 * Testcase Example:  '[[2],[3,4],[6,5,7],[4,1,8,3]]'
 *
 * 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 * 
 * 相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。
 * 
 * 
 * 
 * 例如，给定三角形：
 * 
 * [
 * ⁠    [2],
 * ⁠   [3,4],
 * ⁠  [6,5,7],
 * ⁠ [4,1,8,3]
 * ]
 * 
 * 
 * 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 * 
 * 
 * 
 * 说明：
 * 
 * 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
 * 
 */

// @lc code=start
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var ans = Int.max
        dfs(triangle, 0, 0, 0, &ans)

        return ans
    }

    func dfs(_ triangle: [[Int]], _ level: Int, _ index: Int, _ sum: Int, _ ans: inout Int) {
        if level == triangle.count {
            ans = min(ans, sum)
            return
        }

        let row = triangle[level]
        if index >= row.count {
            return
        }

        dfs(triangle, level+1, index, sum + row[index], &ans)

        dfs(triangle, level+1, index+1, sum + row[index], &ans)
    }
}
// @lc code=end

