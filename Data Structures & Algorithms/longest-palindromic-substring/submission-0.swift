class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var res = ""
        var resLen = 0

        func expand(_ left: Int, _ right: Int) {
            var l = left
            var r = right

            while l >= 0 && r < chars.count && chars[r] == chars[l] {
                if (r - l + 1) > resLen {
                    res = String(chars[l...r])
                    resLen = r - l + 1
                }
                l -= 1
                r += 1
            }
        }

        for i in 0..<chars.count {
            expand(i, i) // odd case
            expand(i, i + 1) // even case
        }

        return res
    }
}
