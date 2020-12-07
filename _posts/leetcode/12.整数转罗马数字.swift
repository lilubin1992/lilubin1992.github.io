/*
 * @lc app=leetcode.cn id=12 lang=swift
 *
 * [12] 整数转罗马数字
 */

// @lc code=start
class Solution {
    func intToRoman(_ num: Int) -> String {
        var iterNum = num
        var ans = ""
        let romanMap : [String] = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]

        let nums : [Int] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

        var i = 0

        while iterNum > 0 {
            let iv = nums[i]
            while iterNum >= iv {
                ans.append(romanMap[i])
                iterNum -= iv
            }

            i += 1
        }

        return ans
    }
}
// @lc code=end

