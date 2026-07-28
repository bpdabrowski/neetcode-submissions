class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var res = 0

        func expand(_ left: Int, _ right: Int) {
            var l = left
            var r = right
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                res += 1
                l -= 1
                r += 1
            }
        }

        for i in 0..<chars.count {
            expand(i, i)
            expand(i, i + 1)
        }
        return res
    }
}
