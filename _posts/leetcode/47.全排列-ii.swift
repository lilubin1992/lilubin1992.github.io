/*
 * @lc app=leetcode.cn id=47 lang=swift
 *
 * [47] 全排列 II
 *
 * https://leetcode-cn.com/problems/permutations-ii/description/
 *
 * algorithms
 * Medium (62.29%)
 * Likes:    538
 * Dislikes: 0
 * Total Accepted:    124.4K
 * Total Submissions: 199.7K
 * Testcase Example:  '[1,1,2]'
 *
 * 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [1,1,2]
 * 输出：
 * [[1,1,2],
 * ⁠[1,2,1],
 * ⁠[2,1,1]]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [1,2,3]
 * 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * -10 
 * 
 * 
 */

// @lc code=start
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()

        dfsUnique(&res, path, nums.sorted())

        return res
    }

    func dfsUnique(_ res: inout [[Int]], _ path: [Int], _ nums: [Int]) {
        
        if nums.count == 0 {
            res.append(path)
            return
        }

        var used = [Bool](repeating: false, count: nums.count) //记录该数是否使用过

        for (index, item) in nums.enumerated() {
            used[index] = true

            if index > 0 && nums[index] == nums[index - 1] && used[index - 1] { //同层剪枝
                continue
            }

            var newPath = path 
            newPath.append(item)

            var newNums = nums 
            newNums.remove(at: index)

            dfsUnique(&res, newPath, newNums)
        }

    }
}
// @lc code=end

