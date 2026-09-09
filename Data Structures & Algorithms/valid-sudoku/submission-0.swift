class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var squares = Array(repeating: Set<Character>(), count: 9)

        for r in 0..<9 {
            for c in 0..<9 {
                let value = board[r][c]
                guard value != "." else { continue }

                let s = (r / 3) * 3 + c / 3

                guard rows[r].insert(value).inserted,
                    columns[c].insert(value).inserted,
                    squares[s].insert(value).inserted else {
                        return false
                    }
            }
        }
        return true
    }
}
