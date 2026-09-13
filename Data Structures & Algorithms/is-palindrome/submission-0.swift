class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s.lowercased())
        var l = 0
        var r = chars.count - 1

        while l < r {
            while l < r, !chars[l].isAlphanumeric { l += 1 }
            while l < r, !chars[r].isAlphanumeric { r -= 1 }
            if chars[l] != chars[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}

private extension Character {
    var isAlphanumeric: Bool { isNumber || isLetter }
}