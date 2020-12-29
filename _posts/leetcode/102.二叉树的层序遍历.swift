/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-level-order-traversal/description/
 *
 * algorithms
 * Medium (63.75%)
 * Likes:    733
 * Dislikes: 0
 * Total Accepted:    234K
 * Total Submissions: 366.1K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 * 
 * 
 * 
 * 示例：
 * 二叉树：[3,9,20,null,null,15,7],
 * 
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 * 返回其层序遍历结果：
 * 
 * 
 * [
 * ⁠ [3],
 * ⁠ [9,20],
 * ⁠ [15,7]
 * ]
 * 
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let lr = root else {
            return [[Int]]()
        }

        var res = [[Int]]()
        var stack = [TreeNode]()
        stack.append(lr)

        while stack.count != 0 {
            var cur = [Int]()
            for _ in 0..<stack.count {
                let node = stack.removeFirst()
                cur.append(node.val)

                if let leftNode = node.left {
                    stack.append(leftNode)
                }

                if let rightNode = node.right {
                    stack.append(rightNode)
                }
            }
            res.append(cur)
        }

        return res
    }
}
// @lc code=end

