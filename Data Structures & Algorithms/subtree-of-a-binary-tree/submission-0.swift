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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        if root == nil { 
            print("isSubtree line 19")
            return false 
        }

        if isSameTree(root, subRoot) {
            return true
        }

        return isSubtree(root!.left, subRoot) || isSubtree(root!.right, subRoot)
    }

    func isSameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }

        if let root, let subRoot, root.val == subRoot.val {
            print("isSameTree - line 36")
            return isSameTree(root.left, subRoot.left) && isSameTree(root.right, subRoot.right)
        }

        print("isSameTree - line 40")
        return false
    }
}
