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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = root?.val ?? Int.min
        func dfs(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }

            var leftMax = dfs(root.left)
            var rightMax = dfs(root.right)
            leftMax = max(leftMax, 0)
            rightMax = max(rightMax, 0)

            res = max(res, root.val + leftMax + rightMax)
            return root.val + max(leftMax, rightMax)
        }

        _ = dfs(root)
        return res
    }
}
