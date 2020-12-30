/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (68.41%)
 * Likes:    735
 * Dislikes: 0
 * Total Accepted:    124.9K
 * Total Submissions: 182.6K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * 根据一棵树的前序遍历与中序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 前序遍历 preorder = [3,9,20,15,7]
 * 中序遍历 inorder = [9,3,15,20,7]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count != 0, inorder.count != 0 else {
            return nil
        }

        if preorder.count == 1 && inorder.count == 1 && preorder.first! == inorder.first! {
            return TreeNode(preorder.first!)
        }

        let val = preorder.first!

        var loc = 0

        for (index, value) in inorder.enumerated() {
            if value == val {
                loc = index
                break
            }
        }

        let leftMid = Array(inorder[0..<loc])
        let rightMid = Array(inorder[loc+1..<inorder.count])

        let leftPre = Array(preorder[1..<1+leftMid.count])
        let rightPre = Array(preorder[1+leftMid.count..<preorder.count])

        return TreeNode.init(val, buildTree(leftPre, leftMid), buildTree(rightPre, rightMid))
    }
}
// @lc code=end

