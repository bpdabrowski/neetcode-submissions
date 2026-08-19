/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var oldToNew = [ObjectIdentifier: Node]()

        func dfs(_ node: Node) -> Node {
            let id = ObjectIdentifier(node)
            if let copy = oldToNew[id] {
                return copy
            }

            let copy = Node(node.val)
            oldToNew[id] = copy
            for nei in node.neighbors {
                if let nei {
                    copy.neighbors.append(dfs(nei))
                }
            }

            return copy
        }

        guard let node else { return nil }
        return dfs(node)
    }
}
