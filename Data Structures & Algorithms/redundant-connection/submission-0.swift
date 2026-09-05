class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var parent = Array(0...n)
        var size = Array(repeating: 1, count: n + 1)

        func find(_ node: Int) -> Int {
            var node = node
            while node != parent[node] {
                parent[node] = parent[parent[node]]
                node = parent[node]
            }
            return node
        }

        func union(_ a: Int, _ b: Int) -> Bool {
            var groupA = find(a)
            var groupB = find(b)

            guard groupA != groupB else { return false }

            if size[groupA] < size[groupB] {
                parent[groupA] = groupB
                size[groupB] += groupA
            } else {
                parent[groupB] = groupA
                size[groupA] += groupB
            }

            return true
        }

        for edge in edges where !union(edge[0], edge[1]) {
            return edge
        }

        return []
    }
}
