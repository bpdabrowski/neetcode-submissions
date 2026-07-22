class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var res = [String]()
        let digitToChar: [Character: String] = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]
        let digits = Array(digits)

        func dfs(_ i: Int, _ curStr: String) {
            if curStr.count == digits.count {
                res.append(curStr)
                return
            }

            for c in digitToChar[digits[i]]! {
                dfs(i + 1, curStr + String(c))
            }
        }

        if !digits.isEmpty {
            dfs(0, "")
        }
        return res
    }
}
