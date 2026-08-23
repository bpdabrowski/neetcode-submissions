class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        guard !heights.isEmpty, !heights[0].isEmpty else { return [] }
        let rows = heights.count
        let cols = heights[0].count
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        var pacific = Array(
            repeating: Array(repeating: false, count: cols), 
            count: rows
        )
        var atlantic = Array(
            repeating: Array(repeating: false, count: cols), 
            count: rows
        )

        func dfs(_ r: Int, _ c: Int, _ ocean: inout [[Bool]]) {
            ocean[r][c] = true
            for (dr, dc) in directions {
                let nr = dr + r
                let nc = dc + c
                guard 
                    nr >= 0, 
                    nr < rows, 
                    nc >= 0, 
                    nc < cols, 
                    !ocean[nr][nc],
                    heights[nr][nc] >= heights[r][c] else { continue }
                dfs(nr, nc, &ocean)
            }
        }

        for c in 0..<cols {
            dfs(0, c, &pacific)
            dfs(rows - 1, c, &atlantic)
        }

        for r in 0..<rows {
            dfs(r, 0, &pacific)
            dfs(r, cols - 1, &atlantic)
        }

        var result = [[Int]]()
        for r in 0..<rows {
            for c in 0..<cols where pacific[r][c] && atlantic[r][c] {
                result.append([r, c])
            }
        }
        return result
    }
}
