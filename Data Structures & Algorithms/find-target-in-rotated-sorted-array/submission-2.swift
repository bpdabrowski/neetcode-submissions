class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let m = l + (r - l) / 2

            if nums[m] == target {
                return m
            }

            if nums[l] <= nums[m] {
                if target < nums[m] && target >= nums[l] {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else {
                if target > nums[m] && target <= nums[r] {
                    l = m + 1
                } else {
                    r = m - 1
                }
            }
        }

        return -1
    }
}
