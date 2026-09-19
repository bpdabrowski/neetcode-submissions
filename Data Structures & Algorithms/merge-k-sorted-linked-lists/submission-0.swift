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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        return mergeLists(lists, 0, lists.count - 1)
    }

    func mergeLists(_ lists: [ListNode?], _ low: Int, _ high: Int) -> ListNode? {
        if low == high { return lists[low] }
        let mid = low + (high - low) / 2
        return mergeTwoLists(mergeLists(lists, low, mid), mergeLists(lists, mid + 1, high))
    }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        var list1 = list1
        var list2 = list2

        while let node1 = list1, let node2 = list2 {
            var smaller: ListNode
            if node1.val <= node2.val {
                smaller = node1
                list1 = node1.next
            } else {
                smaller = node2
                list2 = node2.next
            }
            tail.next = smaller
            tail = smaller
        }

        tail.next = list1 ?? list2
        return dummy.next
    }
}
