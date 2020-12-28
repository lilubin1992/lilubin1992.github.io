/*
 * @lc app=leetcode.cn id=90 lang=swift
 *
 * [90] 子集 II
 *
 * https://leetcode-cn.com/problems/subsets-ii/description/
 *
 * algorithms
 * Medium (61.29%)
 * Likes:    333
 * Dislikes: 0
 * Total Accepted:    54.6K
 * Total Submissions: 89K
 * Testcase Example:  '[1,2,2]'
 *
 * 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 * 
 * 说明：解集不能包含重复的子集。
 * 
 * 示例:
 * 
 * 输入: [1,2,2]
 * 输出:
 * [
 * ⁠ [2],
 * ⁠ [1],
 * ⁠ [1,2,2],
 * ⁠ [2,2],
 * ⁠ [1,2],
 * ⁠ []
 * ]
 * 
 */

// @lc code=start
class Solution {
    func dfs(_ nums: [Int], _ path: [Int], _ ans: inout [[Int]]) {
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }

            let newNums = Array(nums[(i+1)...])
            var newPath = path 
            newPath.append(nums[i])
            ans.append(newPath)
            dfs(newNums, newPath, &ans)
        }
    }

    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        ans.append([Int]())
        dfs(nums.sorted(), [Int](), &ans)
        return ans
    }
}
// @lc code=end

