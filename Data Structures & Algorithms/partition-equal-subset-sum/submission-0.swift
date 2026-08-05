class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0, +)
        guard total % 2 == 0 else { return false }
        var dp: Set<Int> = [0]
        let target = total / 2

        for num in nums {
            for t in dp {
                dp.insert(t + num)
            }
        }

        return dp.contains(target)
    }
}
