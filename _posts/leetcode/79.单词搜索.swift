/*
 * @lc app=leetcode.cn id=79 lang=swift
 *
 * [79] 单词搜索
 *
 * https://leetcode-cn.com/problems/word-search/description/
 *
 * algorithms
 * Medium (43.66%)
 * Likes:    667
 * Dislikes: 0
 * Total Accepted:    116.8K
 * Total Submissions: 267.5K
 * Testcase Example:  '[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]\n"ABCCED"'
 *
 * 给定一个二维网格和一个单词，找出该单词是否存在于网格中。
 * 
 * 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
 * 
 * 
 * 
 * 示例:
 * 
 * board =
 * [
 * ⁠ ['A','B','C','E'],
 * ⁠ ['S','F','C','S'],
 * ⁠ ['A','D','E','E']
 * ]
 * 
 * 给定 word = "ABCCED", 返回 true
 * 给定 word = "SEE", 返回 true
 * 给定 word = "ABCB", 返回 false
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * board 和 word 中只包含大写和小写英文字母。
 * 1 <= board.length <= 200
 * 1 <= board[i].length <= 200
 * 1 <= word.length <= 10^3
 * 
 * 
 */

// @lc code=start
class Solution {

    func dfs(_ board: [[Character]], _ row: Int, _ col: Int, _ word: [Character], _ index: Int, _ used: [[Bool]]) -> Bool {
        if index >= word.count {
            return true
        }

        if row < 0 || row >= board.count {
            return false
        }

        if col < 0 || col >= board.first!.count {
            return false
        }

        if used[row][col] {
            return false
        }

        if board[row][col] != word[index] {
            return false
        }

        var newUsed = used
        newUsed[row][col] = true

        if dfs(board, row-1, col, word, index+1, newUsed) || dfs(board, row, col+1, word, index+1, newUsed) || dfs(board, row+1, col, word, index+1, newUsed) || dfs(board, row, col-1, word, index+1, newUsed) {
            return true
        }

        return false
    }

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board.first!.count

        let used = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)

        let sAry = Array(word)

        for i in 0..<rows {
            for j in 0..<cols {
                if dfs(board, i, j, sAry, 0, used) {
                    return true
                }
            }
        }

        return false
    }
}
// @lc code=end

