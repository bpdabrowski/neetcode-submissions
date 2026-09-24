class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1
        var r = piles.max()!
        var res = 0

        while l <= r {
            var k = (l + r) / 2
            var hours = 0
            for p in piles {
                hours += (p + k - 1) / k
            }

            if hours <= h {
                res = k
                r = k - 1
            } else {
                l = k + 1
            }
        }

        return res
    }
}
