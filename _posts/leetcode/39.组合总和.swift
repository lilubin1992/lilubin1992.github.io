/*
 * @lc app=leetcode.cn id=39 lang=swift
 *
 * [39] 组合总和
 *
 * https://leetcode-cn.com/problems/combination-sum/description/
 *
 * algorithms
 * Medium (71.57%)
 * Likes:    1024
 * Dislikes: 0
 * Total Accepted:    175.9K
 * Total Submissions: 245.8K
 * Testcase Example:  '[2,3,6,7]\n7'
 *
 * 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 * 
 * candidates 中的数字可以无限制重复被选取。
 * 
 * 说明：
 * 
 * 
 * 所有数字（包括 target）都是正整数。
 * 解集不能包含重复的组合。 
 * 
 * 
 * 示例 1：
 * 
 * 输入：candidates = [2,3,6,7], target = 7,
 * 所求解集为：
 * [
 * ⁠ [7],
 * ⁠ [2,2,3]
 * ]
 * 
 * 
 * 示例 2：
 * 
 * 输入：candidates = [2,3,5], target = 8,
 * 所求解集为：
 * [
 * [2,2,2,2],
 * [2,3,3],
 * [3,5]
 * ]
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= candidates.length <= 30
 * 1 <= candidates[i] <= 200
 * candidate 中的每个元素都是独一无二的。
 * 1 <= target <= 500
 * 
 * 
 */

// @lc code=start
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()

        var sum = [Int]()

        dfs(candidates, target, &sum, &res, 0)

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
            let item = candidates[i]
            sum.append(item)
            dfs(candidates, target-item, &sum, &res, i)
            sum.removeLast()
        }
    }

}
// @lc code=end

