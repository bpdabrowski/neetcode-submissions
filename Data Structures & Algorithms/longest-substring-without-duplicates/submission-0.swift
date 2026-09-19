class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var window = Set<Character>()
        var l = 0
        var res = 0

        for (r, ch) in chars.enumerated() {
            while window.contains(ch) {
                window.remove(chars[l])
                l += 1
            }

            window.insert(ch)
            res = max(res, r - l + 1)
        } 

        return res
    }
}
