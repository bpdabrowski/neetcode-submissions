class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var col = Set<Int>()
        var posDiag = Set<Int>()
        var negDiag = Set<Int>()
        let charArray = [Character](repeating: ".", count: n)
        var board = [[Character]](repeating: charArray, count: n)

        func backtrack(_ r: Int) {
            if r == n {
                let copy = board.map { String($0) }
                res.append(copy)
                return
            }

            for c in 0..<n {
                if col.contains(c) || posDiag.contains(r + c) || negDiag.contains(r - c) {
                    continue
                }

                col.insert(c)
                posDiag.insert(r + c)
                negDiag.insert(r - c)
                board[r][c] = "Q"

                backtrack(r + 1)

                col.remove(c)
                posDiag.remove(r + c)
                negDiag.remove(r - c)
                board[r][c] = "."
            }
        }

        backtrack(0)
        return res
    }
}
