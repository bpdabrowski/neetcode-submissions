class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [[Int]: [String]]()

        for s in strs {
            var count = Array(repeating: 0, count: 26)
            for byte in s.utf8 {
                count[Int(byte) - 97] += 1
            }
            groups[count, default: []].append(s)
        }

        return Array(groups.values)
    }
}
