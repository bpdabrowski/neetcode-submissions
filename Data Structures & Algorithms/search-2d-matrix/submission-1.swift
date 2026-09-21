class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let cols = matrix[0].count
        var l = 0
        var r = (rows * cols) - 1

        while l <= r {
            let m = (l + r) / 2
            let value = matrix[m / cols][m % cols]
            if target > value {
                l = m + 1
            } else if target < value {
                r = m - 1
            } else {
                return true
            }
        }

        return false
    }
}
