class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return [[]]
        }

        var perms = permute(Array(nums[1...]))
        var res = [[Int]]()

        for p in perms {
            for i in 0...p.count {
                var pCopy = p
                pCopy.insert(nums[0], at: i)
                res.append(pCopy)
            }
        }
        return res
    }
}
