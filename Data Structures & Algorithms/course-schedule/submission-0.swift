class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var preReqs = [[Int]](repeating: [], count: numCourses)
        for edge in prerequisites {
            preReqs[edge[0]].append(edge[1])
        }

        var visit = Set<Int>()
        func dfs(_ crs: Int) -> Bool {
            if visit.contains(crs) { return false }
            if preReqs[crs].isEmpty { return true }

            visit.insert(crs)
            for pre in preReqs[crs] {
                if !dfs(pre) { return false }
            }
            visit.remove(crs)
            preReqs[crs] = []
            return true
        }

        for c in 0..<numCourses {
            if !dfs(c) { return false }
        }
        return true
    }
}
