class LRUCache {

    private final class Node {
        let key: Int
        var val: Int
        var next: Node? = nil
        var prev: Node? = nil

        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }

    private let capacity: Int
    private var cache: [Int: Node] = [:]
    private var mru = Node(0, 0)
    private var lru = Node(0, 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        lru.next = mru
        mru.prev = lru
    }

    func get(_ key: Int) -> Int {
        guard let node = self.cache[key] else { return -1}
        remove(node)
        insert(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.val = value
            remove(node)
            insert(node)
            return
        }

        let node = Node(key, value)
        cache[key] = node
        insert(node)

        if cache.count > capacity, let victim = lru.next {
            remove(victim)
            cache[victim.key] = nil
        }
    }

    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    private func insert(_ node: Node) {
        let last = mru.prev
        last?.next = node
        node.prev = last
        node.next = mru
        mru.prev = node
    }
}
