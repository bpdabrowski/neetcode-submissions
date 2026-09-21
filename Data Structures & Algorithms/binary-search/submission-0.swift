class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            var m = l + ((r - l) / 2)

            if nums[m] < target {
                l = m + 1
            } else if nums[m] > target {
                r = m - 1
            } else {
                return m
            }
        }

        return -1
    }
}
