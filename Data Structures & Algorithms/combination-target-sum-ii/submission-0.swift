class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        let nums = candidates.sorted()
        var cur = [Int]()

        func dfs(_ i: Int, _ total: Int) {
            if total == target {
                res.append(cur)
                return
            }

            if i >= nums.count || total > target{
                return
            }

            cur.append(nums[i])
            dfs(i + 1, total + nums[i])
            cur.removeLast()

            var i = i
            while i + 1 < nums.count && nums[i] == nums[i + 1] {
                i += 1
            }
            dfs(i + 1, total)
        }

        dfs(0,0)
        return res
    }
}
