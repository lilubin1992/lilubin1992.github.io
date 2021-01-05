/*
 * @lc app=leetcode.cn id=113 lang=swift
 *
 * [113] 路径总和 II
 *
 * https://leetcode-cn.com/problems/path-sum-ii/description/
 *
 * algorithms
 * Medium (61.20%)
 * Likes:    400
 * Dislikes: 0
 * Total Accepted:    108.9K
 * Total Submissions: 177.6K
 * Testcase Example:  '[5,4,8,11,null,13,4,7,2,null,null,5,1]\n22'
 *
 * 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
 * 
 * 说明: 叶子节点是指没有子节点的节点。
 * 
 * 示例:
 * 给定如下二叉树，以及目标和 sum = 22，
 * 
 * ⁠             5
 * ⁠            / \
 * ⁠           4   8
 * ⁠          /   / \
 * ⁠         11  13  4
 * ⁠        /  \    / \
 * ⁠       7    2  5   1
 * 
 * 
 * 返回:
 * 
 * [
 * ⁠  [5,4,11,2],
 * ⁠  [5,8,4,5]
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var res = [[Int]]()

        pathSumHelper(root, sum, [Int](), &res)

        return res
    }

    func pathSumHelper(_ root: TreeNode?, _ target: Int, _ path: [Int], _ res: inout [[Int]]) {
        
        guard let _ = root else {
            return
        }

        var cur = path 
        cur.append(root!.val)

        if root!.left == nil && root!.right == nil && root!.val == target {
            res.append(cur)
        }

        if let _ = root!.left {
            pathSumHelper(root!.left, target - root!.val, cur, &res)
        }

        if let _ = root!.right {
            pathSumHelper(root!.right, target - root!.val, cur, &res)
        }


    }
}
// @lc code=end

