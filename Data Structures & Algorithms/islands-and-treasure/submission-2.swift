class Solution {
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        guard !grid.isEmpty, !grid[0].isEmpty else { return }
        let rows = grid.count
        let cols = grid[0].count
        let INF = 2147483647

        var queue = [(Int, Int)]()
        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 0 {
                queue.append((r, c))
            }
        }

        var head = 0
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while head < queue.count {
            let (r,c) = queue[head]
            head += 1
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                guard nr >= 0, 
                    nr < rows, 
                    nc >= 0, 
                    nc < cols, 
                    grid[nr][nc] == INF else {
                        continue
                    }

                grid[nr][nc] = grid[r][c] + 1
                queue.append((nr, nc))
            }
        }
    }
}
