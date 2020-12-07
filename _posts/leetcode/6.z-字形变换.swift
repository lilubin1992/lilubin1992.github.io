/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    func convert(_ s: String, _ rows: Int) -> String {
        if rows <= 1 || s.count <= rows {
            return s 
        }

        var res = [String](repeating: "", count: rows)

        var flag = 1

        var subIndex = 0

        for ele in s {
            res[subIndex].append(ele)
            subIndex = subIndex + flag
            if subIndex == rows - 1 {
                flag = -1
            } else if subIndex == 0 {
                flag = 1
            }
        }

        return res.joined()
    }
}
// @lc code=end

