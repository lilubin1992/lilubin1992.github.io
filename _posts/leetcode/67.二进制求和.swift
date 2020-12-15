/*
 * @lc app=leetcode.cn id=67 lang=swift
 *
 * [67] 二进制求和
 *
 * https://leetcode-cn.com/problems/add-binary/description/
 *
 * algorithms
 * Easy (54.33%)
 * Likes:    530
 * Dislikes: 0
 * Total Accepted:    139.9K
 * Total Submissions: 257.4K
 * Testcase Example:  '"11"\n"1"'
 *
 * 给你两个二进制字符串，返回它们的和（用二进制表示）。
 * 
 * 输入为 非空 字符串且只包含数字 1 和 0。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: a = "11", b = "1"
 * 输出: "100"
 * 
 * 示例 2:
 * 
 * 输入: a = "1010", b = "1011"
 * 输出: "10101"
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 每个字符串仅由字符 '0' 或 '1' 组成。
 * 1 <= a.length, b.length <= 10^4
 * 字符串如果不是 "0" ，就都不含前导零。
 * 
 * 
 */

// @lc code=start
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aBinary = Array(a.reversed())
        let bBinary = Array(b.reversed())

        var carry = "0"

        var ans = ""
        let count = max(aBinary.count, bBinary.count)

        for i in 0..<count {
            var aCh = "0"
            var bCh = "0"

            if i < aBinary.count {
                aCh = String(aBinary[i])
            }

            if i < bBinary.count {
                bCh = String(bBinary[i])
            }

            if aCh == bCh {
                ans.append(carry)
                carry = aCh
            } else {
                if carry == "0" {
                    ans.append("1")
                } else {
                    ans.append("0")
                    carry = "1"
                }
            }
        }

        if carry == "1" {
            ans.append("1")
        }

        return String(ans.reversed())
    }
}
// @lc code=end

