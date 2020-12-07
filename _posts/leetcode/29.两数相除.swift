/*
 * @lc app=leetcode.cn id=29 lang=swift
 *
 * [29] 两数相除
 */

// @lc code=start
class Solution {
    func lcdiv(_ divided: Int, _ divisor: Int) -> Int {
        if divided < divisor {
            return 0
        }

        var count = 1
        var tb = divisor

        while (tb+tb) <= divided {
            count += count
            tb += tb
        }

        count += lcdiv(divided-tb, divisor)
        
        return count
    }

    func divide(_ divided: Int, _ divisor: Int) -> Int {
        var flag = 1
        if (divided > 0 && divisor < 0) || (divided < 0 && divisor > 0) {
            flag = -1
        }
        var count = lcdiv(abs(divided), abs(divisor)) * flag
        if count > Int32.max {
            count = Int(Int32.max)
        }
        return count
    }
}
// @lc code=end

