/*
 * @lc app=leetcode.cn id=88 lang=swift
 *
 * [88] 合并两个有序数组
 *
 * https://leetcode-cn.com/problems/merge-sorted-array/description/
 *
 * algorithms
 * Easy (48.85%)
 * Likes:    673
 * Dislikes: 0
 * Total Accepted:    225K
 * Total Submissions: 460.6K
 * Testcase Example:  '[1,2,3,0,0,0]\n3\n[2,5,6]\n3'
 *
 * 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
 * 
 * 
 * 
 * 说明：
 * 
 * 
 * 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 * 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 * 
 * 
 * 
 * 
 * 示例：
 * 
 * 
 * 输入：
 * nums1 = [1,2,3,0,0,0], m = 3
 * nums2 = [2,5,6],       n = 3
 * 
 * 输出：[1,2,2,3,5,6]
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * -10^9 
 * nums1.length == m + n
 * nums2.length == n
 * 
 从后向前赋值
 * 
 */

// @lc code=start
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var mp = m - 1
        var np = n - 1
        let total = m + n

        for i in (0..<total).reversed() {
            if mp >= 0 && np >= 0 {
                if nums1[mp] > nums2[np] {
                    nums1[i] = nums1[mp]
                    mp -= 1
                } else {
                    nums1[i] = nums2[np]
                    np -= 1
                }
            } else if mp >= 0 {
                nums1[i] = nums1[mp]
                mp -= 1
            } else {
                nums1[i] = nums2[np]
                np -= 1
            }
        }
    }
}
// @lc code=end

