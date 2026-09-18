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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var tail = dummy
        var p1 = l1
        var p2 = l2
        var carry = 0

        while p1 != nil || p2 != nil || carry > 0 {
            let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
            carry = sum / 10

            let node = ListNode(sum % 10)
            tail.next = node
            tail = node

            p1 = p1?.next
            p2 = p2?.next
        }

        return dummy.next
    }
}
