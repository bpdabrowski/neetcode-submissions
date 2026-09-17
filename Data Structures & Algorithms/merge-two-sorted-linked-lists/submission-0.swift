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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        var a = list1
        var b = list2

        while let nodeA = a, let nodeB = b {
            var smaller = ListNode(0)
            if nodeA.val <= nodeB.val {
                smaller = nodeA
                a = nodeA.next
            } else {
                smaller = nodeB
                b = nodeB.next
            }
            tail.next = smaller
            tail = smaller
        }

        tail.next = a ?? b
        return dummy.next
    }
}
