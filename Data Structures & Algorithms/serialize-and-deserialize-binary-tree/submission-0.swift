/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var res = [String]()

        func dfs(_ node: TreeNode?) {
            guard let node else {
                res.append("N")
                return
            }

            res.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)
        return res.joined(separator: ",")
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        let vals = data.split(separator: ",").map { String ($0) }
        var i = 0

        func dfs() -> TreeNode? {
            if vals[i] == "N" {
                i += 1
                return nil
            }
            let node = TreeNode(Int(vals[i])!)
            i += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }

        return dfs()
    }
}
