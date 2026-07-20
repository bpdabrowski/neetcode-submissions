class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let columns = board[0].count
        let word = Array(word)
        var path = Set<[Int]>()

        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {

            if i == word.count {
                return true
            }

            if r < 0 ||
            c < 0 ||
            r >= rows ||
            c >= columns ||
            word[i] != board[r][c] ||
            path.contains([r,c]) {
                return false
            }

            path.insert([r,c])
            let res = dfs(r + 1, c, i + 1) ||
                    dfs(r - 1, c, i + 1) ||
                    dfs(r, c + 1, i + 1) ||
                    dfs(r, c - 1, i + 1)
            path.remove([r,c])
            return res
        }

        for r in 0..<rows {
            for c in 0..<columns {
                if dfs(r, c, 0) { return true }
            }
        }

        return false
    }
}
