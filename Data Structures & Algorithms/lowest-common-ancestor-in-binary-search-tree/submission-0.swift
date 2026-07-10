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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var cur = root

        while cur != nil {
            if p!.val > cur!.val && q!.val > cur!.val {
                cur = cur!.right
            } else if p!.val < cur!.val && q!.val < cur!.val {
                cur = cur!.left
            } else {
                return cur
            }
        }

        return cur
    }
}
