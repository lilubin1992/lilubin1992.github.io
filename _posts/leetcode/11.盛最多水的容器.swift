/*
 * @lc app=leetcode.cn id=11 lang=swift
 *
 * [11] 盛最多水的容器
 */

// @lc code=start
//使用双指针，移动短的挡板
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var left = 0
        var right  = height.count - 1

        while left < right {
            let rect = min(height[left], height[right]) * (right - left)
            result = max(rect, result)

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return result
    }
}
// @lc code=end

