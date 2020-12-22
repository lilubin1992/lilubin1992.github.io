/*
 * @lc app=leetcode.cn id=86 lang=swift
 *
 * [86] 分隔链表
 *
 * https://leetcode-cn.com/problems/partition-list/description/
 *
 * algorithms
 * Medium (60.20%)
 * Likes:    286
 * Dislikes: 0
 * Total Accepted:    61.6K
 * Total Submissions: 102.2K
 * Testcase Example:  '[1,4,3,2,5,2]\n3'
 *
 * 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 * 
 * 你应当保留两个分区中每个节点的初始相对位置。
 * 
 * 
 * 
 * 示例:
 * 
 * 输入: head = 1->4->3->2->5->2, x = 3
 * 输出: 1->2->2->4->3->5
 * 
 * 
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var pHead = head

        var beforeList = ListNode(-1)
        let beforeDummy = beforeList

        var afterList = ListNode(-1)
        let afterDummy = afterList

        while let cur = pHead {
            if cur.val < x {
                beforeList.next = cur
                beforeList = beforeList.next!
            } else {
                afterList.next = cur
                afterList = afterList.next!
            }
            pHead = pHead?.next
        }
        afterList.next = nil
        beforeList.next = afterDummy.next
        return beforeDummy.next
    }
}
// @lc code=end

