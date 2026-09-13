class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 > $1.0 }
        var fleets = 0
        var leadTime = 0.0

        for (p, s) in cars {
            var time = Double(target - p) / Double(s)
            if time > leadTime {
                fleets += 1
                leadTime = time
            }
        }

        return fleets
    }
}
