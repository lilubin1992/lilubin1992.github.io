/*
 * @lc app=leetcode.cn id=108 lang=swift
 *
 * [108] 将有序数组转换为二叉搜索树
 *
 * https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/description/
 *
 * algorithms
 * Easy (74.45%)
 * Likes:    667
 * Dislikes: 0
 * Total Accepted:    131K
 * Total Submissions: 175.7K
 * Testcase Example:  '[-10,-3,0,5,9]'
 *
 * 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
 * 
 * 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 * 
 * 示例:
 * 
 * 给定有序数组: [-10,-3,0,5,9],
 * 
 * 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
 * 
 * ⁠     0
 * ⁠    / \
 * ⁠  -3   9
 * ⁠  /   /
 * ⁠-10  5
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {
            return nil
        }

        if nums.count == 1 {
            return TreeNode(nums.first!)
        }

        let mid = nums.count / 2
        let val = nums[mid]

        let leftNums = Array(nums[0..<mid])
        let rightnums = Array(nums[mid+1..<nums.count])

        return TreeNode(val, sortedArrayToBST(leftNums), sortedArrayToBST(rightnums))
    }
}
// @lc code=end

