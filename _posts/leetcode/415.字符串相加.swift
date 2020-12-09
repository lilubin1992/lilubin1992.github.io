/*
 * @lc app=leetcode.cn id=415 lang=swift
 *
 * [415] 字符串相加
 *
 * https://leetcode-cn.com/problems/add-strings/description/
 *
 * algorithms
 * Easy (51.86%)
 * Likes:    284
 * Dislikes: 0
 * Total Accepted:    86.4K
 * Total Submissions: 166.6K
 * Testcase Example:  '"0"\n"0"'
 *
 * 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * num1 和num2 的长度都小于 5100
 * num1 和num2 都只包含数字 0-9
 * num1 和num2 都不包含任何前导零
 * 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式
 * 
 * 
 */

// @lc code=start
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        let num1Array = Array(num1)
        let num2Array = Array(num2)
        let toNumMap: [String: Int] = ["0":0, "1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9]
        let toStrArray: [String] = ["0","1","2","3","4","5","6","7","8","9"]
        var ans = ""

        var i = num1Array.count - 1
        var j = num2Array.count - 1

        var carry = 0

        while i >= 0 || j >= 0 || carry != 0 {
            var num1 = 0
            if i >= 0 {
                let numS = num1Array[i]
                num1 = toNumMap[String(numS)]!
            }

            var num2 = 0
            if j >= 0 {
                let numS = num2Array[j]
                num2 = toNumMap[String(numS)]!
            }

            let sum = num1 + num2 + carry

            ans.append(toStrArray[sum % 10])

            carry = sum / 10

            i -= 1
            j -= 1
        }
        return String(ans.reversed())
    }
}
// @lc code=end

