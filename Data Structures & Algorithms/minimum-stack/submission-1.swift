class MinStack {

    var stack: [Int]
    var minStack: [Int]

    init() {
        stack = []
        minStack = []
    }

    func push(_ val: Int) {
        stack.append(val)
        minStack.append(min(val, minStack.last ?? val))
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        stack.last!
    }

    func getMin() -> Int {
        minStack.last!
    }
}
