class Solution {
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty, !board[0].isEmpty else { return }
        let rows = board.count
        let cols = board[0].count
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        func capture(_ r: Int, _ c: Int) {
            board[r][c] = "T"
            for (dc, dr) in directions {
                let nr = dr + r
                let nc = dc + c
                guard 
                    nr >= 0, 
                    nr < rows, 
                    nc >= 0, 
                    nc < cols, 
                    board[nr][nc] == "O" else {
                        continue
                    }
                capture(nr, nc)
            }
        }

        for r in 0..<rows {
            for c in 0..<cols where board[r][c] == "O" && 
                (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) {
                    capture(r, c)
                }
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "O" {
                    board[r][c] = "X"
                } else if board[r][c] == "T" {
                    board[r][c] = "O"
                }
            }
        }
    }
}
