/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func reorderList(_ head: ListNode?) {
        guard let head else { return }

        var slow = head
        var fast = head.next
        while let fastNext = fast?.next, let slowNext = slow.next {
            slow = slowNext
            fast = fastNext.next
        }

        var second = slow.next
        slow.next = nil
        var prev: ListNode? = nil
        while let node = second {
            second = node.next
            node.next = prev
            prev = node
        }

        var first: ListNode? = head
        second = prev
        while let s = second {
            let tmp1 = first?.next
            let tmp2 = s.next
            first?.next = s
            s.next = tmp1
            first = tmp1
            second = tmp2
        } 
    }
}
