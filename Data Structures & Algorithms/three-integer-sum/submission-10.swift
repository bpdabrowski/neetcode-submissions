class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        let n = nums.count
        var res: [[Int]] = []
        guard n >= 3 else { return res }

        for i in 0..<(n - 2) {
            let a = nums[i]
            if a > 0 { break }                              // smallest of the triple is positive → no zero sum left
            if i > 0 && a == nums[i - 1] { continue }       // skip duplicate anchors

            var l = i + 1, r = n - 1
            while l < r {
                let sum = a + nums[l] + nums[r]
                if sum > 0 {
                    r -= 1
                } else if sum < 0 {
                    l += 1
                } else {
                    res.append([a, nums[l], nums[r]])
                    l += 1
                    while l < r && nums[l] == nums[l - 1] { l += 1 }   // bounds check first
                }
            }
        }
        return res
    }
}
