/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var oldToCopy: [ObjectIdentifier: Node] = [:]

        func copy(of node: Node?) -> Node? {
            guard let node else { return nil }
            return oldToCopy[ObjectIdentifier(node)]
        }

        var cur = head
        while let node = cur {
            oldToCopy[ObjectIdentifier(node)] = Node(node.val)
            cur = node.next
        }

        cur = head
        while let node = cur {
            let clone = copy(of: node)!
            clone.next = copy(of: node.next)
            clone.random = copy(of: node.random)
            cur = node.next
        }

        return copy(of: head)
    }
}
