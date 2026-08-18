class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count

        func dfs(_ r: Int, _ c: Int) -> Int {
            guard r >= 0, r < rows, c >= 0, c < cols, grid[r][c] == 1 else {
                return 0
            }

            grid[r][c] = 0

            return (
                1 + 
                dfs(r + 1, c) + 
                dfs(r - 1, c) +
                dfs(r, c + 1) + 
                dfs(r, c - 1)
            )
        }

        var area = 0
        for r in 0..<rows {
            for c in 0..<cols {
                area = max(area, dfs(r, c))
            }
        }

        return area
    }
}
