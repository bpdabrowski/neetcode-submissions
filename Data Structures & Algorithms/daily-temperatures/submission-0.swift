class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        stack.reserveCapacity(temperatures.count)

        for (i, t) in temperatures.enumerated() {
            while let prev = stack.last, temperatures[prev] < t {
                stack.removeLast()
                res[prev] = i - prev
            }
            stack.append(i)
        }

        return res
    }
}
