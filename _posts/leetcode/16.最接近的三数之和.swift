/*
 * @lc app=leetcode.cn id=16 lang=swift
 *
 * [16] 最接近的三数之和
 */

// @lc code=start
class Solution {
    func threeSumClosest(_ snums: [Int], _ target: Int) -> Int {
        let nums = snums.sorted()

        var ans = 0

        if nums.count < 4 {
            for num in nums {
                ans += num
            }
            return ans
        }

        ans = nums[0] + nums[1] + nums[2]

        for i in 0..<nums.count {
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == target {
                    return sum
                }
                if abs(target-sum) < abs(ans-target) {
                    ans = sum
                }
                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return ans
    }
}
// @lc code=end

