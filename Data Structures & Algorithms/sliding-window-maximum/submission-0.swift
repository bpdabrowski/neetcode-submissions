class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var output: [Int] = []
        var q = Deque<Int>()

        for r in nums.indices {
            while let last = q.last, nums[last] < nums[r] {
                q.removeLast()
            }

            q.append(r)

            while let first = q.first, first <= r - k {
                q.removeFirst()
            }

            if r + 1 >= k {
                output.append(nums[q[0]])
            }
        }

        return output
    }
}
