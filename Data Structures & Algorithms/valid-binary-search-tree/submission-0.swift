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
    func isValidBST(_ root: TreeNode?) -> Bool {
        func checkValid(_ node: TreeNode?, _ left: Int?, _ right: Int?) -> Bool {
            guard let node else { return true }
            if let left, left >= node.val { return false }
            if let right, right <= node.val { return false } 
            return checkValid(node.left, left, node.val) && checkValid(node.right, node.val, right)
        }
        return checkValid(root, nil, nil)
    }
}
