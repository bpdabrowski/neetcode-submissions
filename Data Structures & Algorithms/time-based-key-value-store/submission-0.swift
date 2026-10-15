class TimeMap {

    private var store: [String: [(value: String, timestamp: Int)]] = [:]
    init() {

    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((value, timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = store[key] else { return "" }

        var res = ""
        var l = 0
        var r = values.count - 1
        while l <= r {
            var m = (l + r) / 2
            if values[m].timestamp <= timestamp {
                res = values[m].value
                l = m + 1
            } else {
                r = m - 1
            }
        }
        return res
    }
}
