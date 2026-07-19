class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted()
        var subsets = [Int]()

        func backtrack(_ i: Int) {
            if i >= nums.count {
                res.append(subsets)
                return
            }

            subsets.append(nums[i])
            backtrack(i + 1)
            subsets.removeLast()
            
            var i = i
            while i + 1 < nums.count && nums[i] == nums[i + 1] {
                i += 1
            }
            backtrack(i + 1)
        }

        backtrack(0)
        return res
    }
}
