class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard n > 0 else { return true }
        guard edges.count == n - 1 else { return false }

        var adj = [[Int]](repeating: [], count: n)
        for edge in edges {
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
        }

        var visited = [Bool](repeating: false, count: n)
        var stack = [0]
        visited[0] = true
        var count = 1

        while let node = stack.popLast() {
            for next in adj[node] where !visited[next] {
                visited[next] = true
                stack.append(next)
                count += 1
            } 
        }


        return count == n
    }
}
