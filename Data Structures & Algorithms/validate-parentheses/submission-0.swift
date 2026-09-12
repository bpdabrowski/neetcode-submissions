class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        var closeToOpen: [Character: Character] = [")": "(", "}": "{", "]": "["]

        for c in s {
            guard let open = closeToOpen[c] else {
                stack.append(c)
                continue
            }

            guard stack.popLast() == open else { return false }
        }

        return stack.isEmpty
    }
}
