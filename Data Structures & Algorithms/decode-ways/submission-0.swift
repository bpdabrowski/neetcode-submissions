class Solution {
    func numDecodings(_ s: String) -> Int {
        var chars = Array(s)
        var dp = [chars.count: 1]

        func dfs(_ i: Int) -> Int {
            if let cached = dp[i] {
                return cached
            }

            if chars[i] == "0" {
                return 0
            }

            var res = dfs(i + 1)

            if i + 1 < chars.count && (chars[i] == "1" || (chars[i] == "2" && "0123456".contains(chars[i + 1]))) {
                res += dfs(i + 2)
            } 

            dp[i] = res
            return res
        }

        return dfs(0)
    }
}
