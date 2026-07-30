class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var hashset = Set<Int>()

        for n in nums {
            if hashset.contains(n) {
                return true
            }
            hashset.insert(n)
        }

        return false
    }
}
