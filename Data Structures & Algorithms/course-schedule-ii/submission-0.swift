class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var prereq = Array(repeating: [Int](), count: numCourses)

        for edge in prerequisites {
            prereq[edge[0]].append(edge[1])
        }

        var output = [Int]()
        var inPath = Array(repeating: false, count: numCourses)
        var visiting = Array(repeating: false, count: numCourses)

        func dfs(_ crs: Int) -> Bool {
            if inPath[crs] { return false }
            if visiting[crs] { return true }

            inPath[crs] = true
            for pre in prereq[crs] {
                if !dfs(pre) { return false }
            }
            inPath[crs] = false
            visiting[crs] = true
            output.append(crs)
            return true
        }

        for c in 0..<numCourses {
            if !dfs(c) { return [] }
        }

        return output
    }
}
