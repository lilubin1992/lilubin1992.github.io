/*
 * @lc app=leetcode.cn id=40 lang=swift
 *
 * [40] 组合总和 II
 *
 * https://leetcode-cn.com/problems/combination-sum-ii/description/
 *
 * algorithms
 * Medium (64.47%)
 * Likes:    430
 * Dislikes: 0
 * Total Accepted:    114.8K
 * Total Submissions: 178.1K
 * Testcase Example:  '[10,1,2,7,6,1,5]\n8'
 *
 * 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 * 
 * candidates 中的每个数字在每个组合中只能使用一次。
 * 
 * 说明：
 * 
 * 
 * 所有数字（包括目标数）都是正整数。
 * 解集不能包含重复的组合。 
 * 
 * 
 * 示例 1:
 * 
 * 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 * 所求解集为:
 * [
 * ⁠ [1, 7],
 * ⁠ [1, 2, 5],
 * ⁠ [2, 6],
 * ⁠ [1, 1, 6]
 * ]
 * 
 * 
 * 示例 2:
 * 
 * 输入: candidates = [2,5,2,1,2], target = 5,
 * 所求解集为:
 * [
 * [1,2,2],
 * [5]
 * ]
 * 
 */

// @lc code=start
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()

        var sum = [Int]()

        dfs(candidates.sorted(), target, &sum, &res, 0)

        return res
    }

    func dfs(_ candidates: [Int], _ target: Int, _ sum: inout [Int], _ res: inout [[Int]], _ index: Int) {
        
        if target <= 0 {
            if target == 0 {
                res.append(sum)
            }
            return
        }

        for i in index..<candidates.count {
            if i > index && candidates[i] == candidates[i-1] {
                continue //剪枝去重，不是很理解？
            }
            let item = candidates[i]
            sum.append(item)
            dfs(candidates, target-item, &sum, &res, i+1)
            sum.removeLast()
        }
    }
}
// @lc code=end

