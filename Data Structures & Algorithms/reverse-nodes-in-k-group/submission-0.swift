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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var groupPrev = dummy  // non-optional: always a real node

        // groupStart is the group's current head and becomes its tail after reversal
        while let kth = kthNode(after: groupPrev, k), let groupStart = groupPrev.next {
            let groupNext = kth.next

            // Seed prev with groupNext so the reversed tail is already stitched to the rest
            var prev = groupNext
            var curr: ListNode? = groupStart
            while let node = curr, node !== groupNext {
                let next = node.next
                node.next = prev
                prev = node
                curr = next
            }

            groupPrev.next = kth       // kth is the new group head
            groupPrev = groupStart     // old head is now the tail, which precedes the next group
        }
        return dummy.next
    }

    // Returns the node k steps after start, or nil if fewer than k nodes remain
    private func kthNode(after start: ListNode, _ k: Int) -> ListNode? {
        var curr: ListNode? = start
        for _ in 0..<k { curr = curr?.next }
        return curr
    }
}
