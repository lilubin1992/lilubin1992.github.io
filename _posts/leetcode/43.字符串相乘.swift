/*
 * @lc app=leetcode.cn id=43 lang=swift
 *
 * [43] 字符串相乘
 *
 * https://leetcode-cn.com/problems/multiply-strings/description/
 *
 * algorithms
 * Medium (44.53%)
 * Likes:    529
 * Dislikes: 0
 * Total Accepted:    115.9K
 * Total Submissions: 260.1K
 * Testcase Example:  '"2"\n"3"'
 *
 * 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 * 
 * 示例 1:
 * 
 * 输入: num1 = "2", num2 = "3"
 * 输出: "6"
 * 
 * 示例 2:
 * 
 * 输入: num1 = "123", num2 = "456"
 * 输出: "56088"
 * 
 * 说明：
 * 
 * 
 * num1 和 num2 的长度小于110。
 * num1 和 num2 只包含数字 0-9。
 * num1 和 num2 均不以零开头，除非是数字 0 本身。
 * 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 * 
 * 
 */

// @lc code=start
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {

        let num1Array = Array(num1)
        let num2Array = Array(num2)
        let toNumMap: [String: Int] = ["0":0, "1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9]
        let toStrArray: [String] = ["0","1","2","3","4","5","6","7","8","9"]
        var ans = "0"

        if num1 == "0" || num2 == "0" {
            return "0"
        }

        for (i, iEle) in num1Array.reversed().enumerated() {
            let iValue = toNumMap[String(iEle)]!

            var carry = 0
            var curValue = ""
            for _ in 0..<i {
                curValue += "0"
            }

            for jEle in num2Array.reversed() {
                let jValue = toNumMap[String(jEle)]!

                let mulValue = iValue * jValue + carry
                // curValue = "\(curValue)\(toStrArray[mulValue % 10])"
                curValue += toStrArray[mulValue % 10]
                carry = mulValue / 10
            }

            if carry != 0 {
                curValue += toStrArray[carry % 10]
                carry = 0
            }

            ans = addStrings(ans, String(curValue.reversed()))
        }

        return ans
    }

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

