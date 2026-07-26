class Solution {
    func rob(_ nums: [Int]) -> Int {
        return max(nums[0], helper(Array(nums[1...])), helper(Array(nums[..<(nums.count - 1)])))
    }

    func helper(_ nums: [Int]) -> Int {
        var rob1 = 0
        var rob2 = 0

        for n in nums {
            let newRob = max(n + rob1, rob2)
            rob1 = rob2
            rob2 = newRob
        }

        return rob2
    }
}
