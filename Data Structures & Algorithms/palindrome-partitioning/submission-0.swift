class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        var res = [[String]]()
        var part = [String]()

        func dfs(_ i: Int) {
            if i >= chars.count {
                res.append(part)
                return
            }

            for j in i..<chars.count {
                if isPali(chars, i, j) {
                    part.append(String(chars[i...j]))
                    dfs(j + 1)
                    part.removeLast()
                }
            }
        }

        dfs(0)
        return res
    }

    func isPali(_ s: [Character], _ l: Int, _ r: Int) -> Bool {
        var l = l
        var r = r
        while l < r {
            if s[l] != s[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}
