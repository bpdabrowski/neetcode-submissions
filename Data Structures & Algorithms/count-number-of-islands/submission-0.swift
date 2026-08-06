class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        let rows = grid.count
        let cols = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var islands = 0

        let directions = [(1,0), (-1,0), (0,1), (0,-1)]

        func flood(_ startRow: Int, _ startCol: Int) {
            var stack = [(startRow, startCol)]
            visited[startRow][startCol] = true

            while let (r,c) = stack.popLast() {
                for (dr, dc) in directions {
                    let r = r + dr
                    let c = c + dc
                    if r >= 0, r < rows, c >= 0, c < cols, grid[r][c] == "1", !visited[r][c] {
                        visited[r][c] = true
                        stack.append((r,c))
                    }
                }
            }
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == "1" && !visited[r][c] {
                    flood(r, c)
                    islands += 1
                }
            }
        }

        return islands
    }
}
