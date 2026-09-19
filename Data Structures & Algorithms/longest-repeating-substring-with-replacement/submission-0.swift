class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)                  // [Character], so it can be indexed by position
        var count: [Character: Int] = [:]
        var l = 0, maxf = 0, res = 0

        for r in 0..<chars.count {
            count[chars[r], default: 0] += 1
            maxf = max(maxf, count[chars[r]]!)   // safe: we just inserted it

            // chars to replace = window length − most frequent count
            while (r - l + 1) - maxf > k {
                count[chars[l]]! -= 1            // safe: chars[l] is inside the window
                l += 1   // maxf deliberately NOT decremented
            }
            res = max(res, r - l + 1)
        }
        return res
    }
}
