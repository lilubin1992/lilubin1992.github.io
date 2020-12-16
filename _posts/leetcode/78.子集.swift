/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 *
 * https://leetcode-cn.com/problems/subsets/description/
 *
 * algorithms
 * Medium (79.18%)
 * Likes:    858
 * Dislikes: 0
 * Total Accepted:    165.3K
 * Total Submissions: 208.7K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 * 
 * 说明：解集不能包含重复的子集。
 * 
 * 示例:
 * 
 * 输入: nums = [1,2,3]
 * 输出:
 * [
 * ⁠ [3],
 * [1],
 * [2],
 * [1,2,3],
 * [1,3],
 * [2,3],
 * [1,2],
 * []
 * ]
 * 
 */

// @lc code=start
class Solution {
    func dpSubsets(_ nums: [Int], _ path: [Int], _ ans: inout [[Int]]) {
        for i in 0..<nums.count {
            let newNums = Array(nums[(i+1)...])
            var newPath = path 
            newPath.append(nums[i])
            ans.append(newPath)
            dpSubsets(newNums, newPath, &ans)
        }
    }

    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        ans.append([Int]())
        dpSubsets(nums, [Int](), &ans)
        return ans
    }
}
// @lc code=end

