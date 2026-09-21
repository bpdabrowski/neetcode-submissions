class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        let windowSize = s1Chars.count
        guard windowSize <= s2Chars.count else { return false }

        var need: [Character: Int] = [:]
        for ch in s1Chars { need[ch, default: 0] += 1 }

        var window: [Character: Int] = [:]
        var matches = 0

        for r in 0..<s2Chars.count {
            let add = s2Chars[r]
            if let target = need[add] {
                window[add, default: 0] += 1
                let count = window[add, default: 0]
                if count == target {
                    matches += 1
                } else if count == target + 1 {
                    matches -= 1
                }
            }

            if r >= windowSize {
                let drop = s2Chars[r - windowSize]
                if let target = need[drop] {
                    window[drop, default: 0] -= 1
                    let count = window[drop, default: 0]
                    if count == target {
                        matches += 1
                    } else if count == target - 1 {
                        matches -= 1
                    }
                 }
            }

            if matches == need.count { return true }
        }

        return false
    }
}
