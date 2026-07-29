class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for a in 1...amount {
            for c in coins {
                if a - c >= 0 {
                    dp[a] = min(dp[a], 1 + dp[a - c])
                }
            }
        }

        return dp[amount] != amount + 1 ? dp[amount] : -1
    }
}
