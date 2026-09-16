class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var res = 0
        var l = 0
        var r = heights.count - 1

        while l < r {
            let lh = heights[l]
            let rh = heights[r]
            res = max(res, (r - l) * min(lh, rh))

            if lh < rh {
                l += 1
            } else {
                r -= 1
            }
        }

        return res
    }
}
