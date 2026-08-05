class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var LIS = Array(repeating: 1, count: nums.count)

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            for j in (i + 1)..<nums.count {
                if nums[i] < nums[j] {
                    LIS[i] = max(LIS[i], 1 + LIS[j])
                }
            }
        }

        return LIS.max()!
    }
}
