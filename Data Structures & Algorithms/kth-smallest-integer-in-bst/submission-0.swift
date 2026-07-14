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

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var n = 0
        var stack = [TreeNode]()
        var cur = root

        while cur != nil || !stack.isEmpty {
            while let node = cur {
                stack.append(node)
                cur = node.left
            }

            let node = stack.removeLast()
            n += 1

            if n == k {
                return node.val
            }
            cur = node.right
        }

        return -1
    }
}
