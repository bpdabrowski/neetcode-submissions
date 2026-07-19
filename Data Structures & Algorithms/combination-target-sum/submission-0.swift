class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var cur = [Int]()

        func dfs(_ i: Int, _ total: Int) {
            if total == target {
                res.append(cur)
                return
            }

            if i >= nums.count || total > target {
                return
            }

            cur.append(nums[i])
            dfs(i, total + nums[i])
            cur.removeLast()
            dfs(i + 1, total)
        }
        
        dfs(0,0)
        return res
    }
}
