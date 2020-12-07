/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        var ans = 0
        var sNum : Int = x

        while sNum != 0 {
            let last = sNum % 10
            if ans > Int32.max / 10 {
                return 0
            }

            if ans < Int32.min / 10 {
                return 0
            }

            ans = ans * 10 + last
            sNum = sNum / 10
        }

        return ans
    }
}
// @lc code=end

