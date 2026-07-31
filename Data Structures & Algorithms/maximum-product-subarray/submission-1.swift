class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums.max()!
        var curMax = 1
        var curMin = 1

        for n in nums {
            let tmp = curMax * n
            curMax = max(curMax * n, max(n, curMin * n))
            curMin = min(tmp, min(n, curMin * n))
            res = max(res, curMax)
        }

        return res
    }
}
