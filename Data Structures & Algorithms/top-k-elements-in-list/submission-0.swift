class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        for n in nums {
            count[n, default: 0] += 1
        }

        var freq = [[Int]](repeating: [], count: nums.count + 1)
        for (n, c) in count {
            freq[c].append(n)
        }

        var res = [Int]()
        for c in (1..<freq.count).reversed() {
            for n in freq[c] {
                res.append(n)
                if res.count == k { return res }
            }
        }
        return res
    }
}
