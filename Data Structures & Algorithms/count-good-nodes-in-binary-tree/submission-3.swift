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
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ root: TreeNode?, _ maxVal: Int) -> Int {
            guard let root else { return 0 }
            print("Hitting dfs for value: \(root.val)")
            var res = 0 
            var max = maxVal
            if root.val >= maxVal {
                res = root.val >= maxVal ? 1 : 0
                max = root.val
            }
            print("max val is \(maxVal)")
            print("res is \(res)")
            res += dfs(root.left, max)
            res += dfs(root.right, max)
            return res
        }

        guard let root else { return 0 }
        return dfs(root, root.val)
    }
}
