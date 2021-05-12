/*
 * @lc app=leetcode.cn id=125 lang=swift
 *
 * [125] 验证回文串
 *
 * https://leetcode-cn.com/problems/valid-palindrome/description/
 *
 * algorithms
 * Easy (46.63%)
 * Likes:    308
 * Dislikes: 0
 * Total Accepted:    189.4K
 * Total Submissions: 404.9K
 * Testcase Example:  '"A man, a plan, a canal: Panama"'
 *
 * 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 * 
 * 说明：本题中，我们将空字符串定义为有效的回文串。
 * 
 * 示例 1:
 * 
 * 输入: "A man, a plan, a canal: Panama"
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: "race a car"
 * 输出: false
 * 
 * 
 */

// @lc code=start
class Solution {
    func filter(_ str: String) -> String {
        let chs = Array(str)

        var nchs = [Character]()

        for ch in chs {
            if (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") {
                nchs.append(ch)
            }
        }
        return String(nchs)
    }

    func isPalindrome(_ s: String) -> Bool {
        let source = filter(s)
        let ary = Array(source)
        var left = 0
        var right = source.count - 1
        while left < right {
            if ary[left].lowercased() != ary[right].lowercased() {
                return false
            }
            left += 1
            right -= 1
        }

        return true
    }
}
// @lc code=end

