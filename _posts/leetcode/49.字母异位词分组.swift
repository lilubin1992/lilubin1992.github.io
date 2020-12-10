/*
 * @lc app=leetcode.cn id=49 lang=swift
 *
 * [49] 字母异位词分组
 *
 * https://leetcode-cn.com/problems/group-anagrams/description/
 *
 * algorithms
 * Medium (64.06%)
 * Likes:    535
 * Dislikes: 0
 * Total Accepted:    124.7K
 * Total Submissions: 194.6K
 * Testcase Example:  '["eat","tea","tan","ate","nat","bat"]'
 *
 * 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 * 
 * 示例:
 * 
 * 输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
 * 输出:
 * [
 * ⁠ ["ate","eat","tea"],
 * ⁠ ["nat","tan"],
 * ⁠ ["bat"]
 * ]
 * 
 * 说明：
 * 
 * 
 * 所有输入均为小写字母。
 * 不考虑答案输出的顺序。
 * 
 * 
 */

// @lc code=start
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var wordMap = [String: [String]]()

        for word in strs {
            let sortedWord = String(word.sorted())
            var sortedArray = wordMap[sortedWord] ?? [String]()
            // if let sAry = wordMap[sortedWord] {
                // sortedArray = sAry
            // }
            //  = wordMap[sortedWord] ?? [String]()
            sortedArray.append(word)
            wordMap[sortedWord] = sortedArray
        }

        return Array(wordMap.values)
    }
}
// @lc code=end

