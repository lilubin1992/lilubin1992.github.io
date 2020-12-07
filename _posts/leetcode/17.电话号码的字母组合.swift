/*
 * @lc app=leetcode.cn id=17 lang=swift
 *
 * [17] 电话号码的字母组合
 */

// @lc code=start
class Solution {
    
    static let phoneMap = [
        "2" : ["a","b","c"],
        "3" : ["d","e","f"],
        "4" : ["g","h","i"],
        "5" : ["j","k","l"],
        "6" : ["m","n","o"],
        "7" : ["p","q","r","s"],
        "8" : ["t","u","v"],
        "9" : ["w","x","y","z"],
    ]

    func dfs(_ phone: String, _ index: Int, _ str: String, _ ans: inout [String]) {
        if index == phone.count {
            ans.append(str)
            return
        }
        let num : String = String(phone[phone.index(phone.startIndex, offsetBy: index)])

        for item in Solution.phoneMap[num]! {
            var nStr = str 
            nStr.append(item)
            dfs(phone, index+1, nStr, &ans)
        }
    }

    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return [String]()
        }
        var ans = [String]()
        dfs(digits, 0, "", &ans)
        return ans
    }
}
// @lc code=end

