class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = [Int](repeating: 1, count: nums.count)
        var prefix = 1
        for i in nums.indices {
            res[i] = prefix
            prefix *= nums[i]
        }

        var postfix = 1
        for i in nums.indices.reversed() {
            res[i] *= postfix
            postfix *= nums[i]
        }

        return res
    }
}
