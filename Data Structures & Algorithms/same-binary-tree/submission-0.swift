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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if (p == nil || q == nil) || p!.val != q!.val {
            return false
        }
        return self.isSameTree(p!.left, q!.left) && self.isSameTree(p!.right, q!.right)
    }
}
