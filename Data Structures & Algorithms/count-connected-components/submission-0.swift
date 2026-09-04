class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var parent = Array(0..<n)
        var size = Array(repeating: 1, count: n)

        func find(_ node: Int) -> Int {
            var current = node
            while current != parent[current] {
                parent[current] = parent[parent[current]]
                current = parent[current]
            }
            return current
        }

        func union( _ a: Int, _ b: Int) -> Bool {
            var groupA = find(a)
            var groupB = find(b)
            guard parent[groupA] != parent[groupB] else { return false }

            if parent[groupA] < parent[groupB] {
                parent[groupA] = groupB
                size[groupB] += size[groupA]
            } else {
                parent[groupB] = groupA
                size[groupA] += size[groupB]
            }
            return true
        }

        var components = n
        for edge in edges {
            if union(edge[0], edge[1]) { components -= 1 }
        }
        return components
    }
}
