/*
 * @lc app=leetcode.cn id=34 lang=swift
 *
 * [34] 在排序数组中查找元素的第一个和最后一个位置
 */

// @lc code=start
class Solution {

    func findLowwer(_ nums:[Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right-left)/2
            if nums[mid] == target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        if nums[left] == target {
            return left
        }
        return -1
    }

    func findUpper(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left + 1)/2
            if nums[mid] == target {
                left = mid
            } else if nums[mid] < target {
                 left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return right
    }

    /*
    func findLowwerLocation(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2

            if nums[mid] == target {
                right = mid - 1
            } else if nums[mid] < target {
                left =  mid + 1
            } else {
                right = mid - 1
            }
        }

        if left >= nums.count {
            return -1
        }

        if nums[left] == target {
            return left
        }

        return -1
    }

    func findUpperLocation(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left+right)/2
            if nums[mid] == target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        if nums[right] == target {
            return right
        }
        return -1
    } */

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else {
            return [-1, -1]
        }
        let lowwer = findLowwer(nums, target)
        if lowwer == -1 {
            return [-1, -1]
        }
        let upper = findUpper(nums, target)
        return [lowwer, upper]
    }
}
// @lc code=end

