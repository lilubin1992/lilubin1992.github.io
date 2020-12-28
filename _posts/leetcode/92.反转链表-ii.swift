/*
 * @lc app=leetcode.cn id=92 lang=swift
 *
 * [92] 反转链表 II
 *
 * https://leetcode-cn.com/problems/reverse-linked-list-ii/description/
 *
 * algorithms
 * Medium (51.81%)
 * Likes:    603
 * Dislikes: 0
 * Total Accepted:    90.4K
 * Total Submissions: 174.2K
 * Testcase Example:  '[1,2,3,4,5]\n2\n4'
 *
 * 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 * 
 * 说明:
 * 1 ≤ m ≤ n ≤ 链表长度。
 * 
 * 示例:
 * 
 * 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 * 输出: 1->4->3->2->5->NULL
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var pHead = head
        var dummyM : ListNode?
        let dummy = ListNode(-1)
        var firstH : ListNode?

        for i in 1...n {
            let cur = pHead
            pHead = pHead?.next
            if i == m-1 {
                dummyM = cur
            } else if i >= m && i <= n {
                cur?.next = dummy.next
                dummy.next = cur
                if i == m {
                    firstH = cur
                }
            }
        }

        firstH?.next = pHead
        if m == 1 {
            return dummy.next
        }

        dummyM?.next = dummy.next
        return head
    }
}
// @lc code=end

