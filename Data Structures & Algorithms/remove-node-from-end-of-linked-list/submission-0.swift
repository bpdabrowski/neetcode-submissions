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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var left = dummy
        var right = head

        for _ in 0..<n {
            right = right?.next
        }

        while let node = right {
            left = left.next!
            right = node.next
        }

        left.next = left.next?.next
        return dummy.next
    }
}
