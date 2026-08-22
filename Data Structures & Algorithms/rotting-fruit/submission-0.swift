import Collections

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var queue = Deque<(Int, Int)>()
        var time = 0
        var fresh = 0

        let rows = grid.count
        let cols = grid[0].count

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 1 { fresh += 1 }
                if grid[r][c] == 2 { queue.append((r, c)) }
            }
        }

        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while !queue.isEmpty && fresh != 0 {
            for _ in 0..<queue.count {
                let (r, c) = queue.popFirst()!
                for (dr, dc) in directions {
                    let nr = r + dr
                    let nc = c + dc
                    guard nr >= 0,
                        nr < rows, 
                        nc >= 0,
                        nc < cols,
                        grid[nr][nc] == 1 else {
                        continue
                    }

                    grid[nr][nc] = 2
                    queue.append((nr, nc))
                    fresh -= 1
                }
            }
            time += 1
        }

        return fresh == 0 ? time : -1
    }
}
