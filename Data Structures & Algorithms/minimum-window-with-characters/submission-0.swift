class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let chars = Array(s)
        guard !t.isEmpty, t.count <= chars.count else { return "" }

        var targetCount: [Character: Int] = [:]
        for c in t {
            targetCount[c, default: 0] += 1
        }

        var windowCount: [Character: Int] = [:]
        var have = 0
        var need = targetCount.count
        var bestL = 0
        var bestLen = Int.max
        var l = 0

        for r in 0..<chars.count {
            let c = chars[r]
            windowCount[c, default: 0] += 1

            if let target = targetCount[c], 
                windowCount[c, default: 0] == target {
                have += 1
            }

            while have == need {
                if r - l + 1 < bestLen {
                    bestL = l
                    bestLen = r - l + 1
                }

                let leftChar = chars[l]
                windowCount[leftChar, default: 0] -= 1
                if let target = targetCount[leftChar], windowCount[leftChar, default: 0] < target {
                    have -= 1
                }

                l += 1
            }

        }

        return bestLen == Int.max ? "" : String(chars[bestL..<bestL + bestLen])
    }
}
