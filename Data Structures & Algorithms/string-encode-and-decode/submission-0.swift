class Solution {

    func encode(_ strs: [String]) -> String {
        var res = ""
        for s in strs {
            res += "\(s.count)#\(s)"
        }
        return res
    }

    func decode(_ str: String) -> [String] {
        var chars = Array(str)
        var res = [String]()
        var i = 0

        while i < chars.count {
            var j = i
            while chars[j] != "#" {
                j += 1
            }
            var length = Int(String(chars[i..<j]))
            var start = j + 1
            res.append(String(chars[start..<start + length!]))
            i = start + length!
        }
        return res
    }
}
