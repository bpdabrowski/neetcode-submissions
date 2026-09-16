class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var water = 0
        var l = 0
        var r = height.count - 1
        var leftMax = height[l]
        var rightMax = height[r]

        while l < r {
            if height[l] < height[r] {
                l += 1
                leftMax = max(leftMax, height[l])
                water += leftMax - height[l]
            } else {
                r -= 1
                rightMax = max(rightMax, height[r])
                water += rightMax - height[r]
            }
        }

        return water
    }
}
