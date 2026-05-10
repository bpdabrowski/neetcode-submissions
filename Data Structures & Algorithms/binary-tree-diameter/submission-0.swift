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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ root: TreeNode?) -> Int {
            guard let root else {
                return -1
            }

            let left = dfs(root.left)
            let right = dfs(root.right)
            res = max(res, 2 + left + right)

            return 1 + max(left, right)
        }

        dfs(root)
        return res
    }
}
