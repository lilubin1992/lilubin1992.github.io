/*
 * @lc app=leetcode.cn id=55 lang=swift
 *
 * [55] 跳跃游戏
 *
 * https://leetcode-cn.com/problems/jump-game/description/
 *
 * algorithms
 * Medium (41.31%)
 * Likes:    898
 * Dislikes: 0
 * Total Accepted:    166.2K
 * Total Submissions: 402.3K
 * Testcase Example:  '[2,3,1,1,4]'
 *
 * 给定一个非负整数数组，你最初位于数组的第一个位置。
 * 
 * 数组中的每个元素代表你在该位置可以跳跃的最大长度。
 * 
 * 判断你是否能够到达最后一个位置。
 * 
 * 示例 1:
 * 
 * 输入: [2,3,1,1,4]
 * 输出: true
 * 解释: 我们可以先跳 1 步，从位置 0 到达 位置 1, 然后再从位置 1 跳 3 步到达最后一个位置。
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,2,1,0,4]
 * 输出: false
 * 解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。
 * 
 * 
 */

// @lc code=start
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        return jumpDis(nums, 0) >= nums.count - 1
    }

    func jumpDis(_ nums: [Int], _ index: Int) -> Int {
        if index >= nums.count - 1 {
            return index
        }

        let steps = nums[index]
        var distance = index

        //这个地方可以优化
        for i in 0...index+steps {
            if i >= nums.count - 1 {
                return nums.count
            }

            distance = max(distance, i + nums[i])
        }

        if distance <= index {
            return index
        }

        distance = jumpDis(nums, distance)

        return distance
    }
}
// @lc code=end

