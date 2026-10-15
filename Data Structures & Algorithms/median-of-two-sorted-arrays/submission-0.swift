class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums2.count < nums1.count {
            return findMedianSortedArrays(nums2, nums1)
        }

        let total = nums1.count + nums2.count
        let half = total / 2

        var l = 0
        var r = nums1.count
        while true {
            let i = (l + r) / 2
            let j = half - i

            let left1 = i > 0 ? nums1[i - 1] : Int.min
            let right1 = i < nums1.count ? nums1[i] : Int.max
            let left2 = j > 0 ? nums2[j - 1] : Int.min
            let right2 = j < nums2.count ? nums2[j] : Int.max

            if left1 <= right2 && left2 <= right1 {
                if total % 2 == 1 {
                    return Double(min(right1, right2))
                }

                return Double(max(left1, left2) + min(right1, right2)) / 2
            } else if left1 > right2 {
                r = i - 1
            } else {
                l = i + 1
            }
        }
    }
}
