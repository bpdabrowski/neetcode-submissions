class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        let n = chars.count

        let words = wordDict.map(Array.init)

        var dp = [Bool](repeating: false, count: n + 1)
        dp[n] = true

        for i in stride(from: n - 1, through: 0, by: -1) {
            for word in words {
                let wordLength = word.count
                if i + wordLength <= n && matches(chars: chars, at: i, word){
                    dp[i] = dp[i + wordLength]
                }
                if dp[i] {
                    break
                }
            }
        }

        return dp[0]
    }

    private func matches(chars: [Character], at i: Int, _ word: [Character]) -> Bool {
        for k in 0..<word.count {
            if chars[i + k] != word[k] {
                return false
            }
        }
        return true
    }
}
