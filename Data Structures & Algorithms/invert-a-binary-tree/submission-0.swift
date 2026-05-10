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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else {
            return nil
        }

        let tmp = root.left
        root.left = root.right
        root.right = tmp

        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}
