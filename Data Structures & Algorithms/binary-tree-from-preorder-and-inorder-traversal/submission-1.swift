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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderIndex = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            inorderIndex[value] = index
        }

        var preorderIndex = 0

        func build(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }

            let rootVal = preorder[preorderIndex]
            preorderIndex += 1
            let root = TreeNode(rootVal)

            let mid = inorderIndex[rootVal]!

            root.left = build(left, mid - 1)
            root.right = build(mid + 1, right)

            return root
        }

        return build(0, inorder.count - 1)
    }
}
