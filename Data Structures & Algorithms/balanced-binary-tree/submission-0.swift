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
    func isBalanced(_ root: TreeNode?) -> Bool {
        func dfs(_ root: TreeNode?) -> (Bool, Int) {
            guard let root else {
                return (true, 0)
            }
            var left = dfs(root.left)
            var right = dfs(root.right)
            var balanced = (left.0 && right.0 && abs(left.1 - right.1) <= 1)
            return (balanced, 1 + max(left.1, right.1))
        }

        return dfs(root).0
    }
}
