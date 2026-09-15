class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        let nums = nums.sorted()

        for (i, a) in nums.enumerated() {
            if i > 0 && a == nums[i - 1] {
                continue
            }

            var l = i + 1, r = nums.count - 1
            while l < r {
                let threeSum = a + nums[l] + nums[r]
                if threeSum > 0 {
                    r -= 1
                } else if threeSum < 0 {
                    l += 1
                } else {
                    res.append([a, nums[l], nums[r]])
                    l += 1
                    while nums[l] == nums[l - 1] && l < r {
                        l += 1
                    }
                }
            }
        }
        return res
    }
}
