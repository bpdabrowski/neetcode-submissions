class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        var stack = [(start: Int, height: Int)]()
        stack.reserveCapacity(heights.count)

        for (i, h) in heights.enumerated() {
            var start = i
            while let blocked = stack.last, blocked.height > h {
                stack.removeLast()
                maxArea = max(maxArea, blocked.height * (i - blocked.start))
                start = blocked.start
            } 
            stack.append((start, h))
        }
        

        for bar in stack {
            maxArea = max(maxArea, bar.height * (heights.count - bar.start))
        }
        
        return maxArea
    }
}
