class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordset = Set(wordList)
        guard wordset.contains(endWord) else { return 0 }
        wordset.insert(beginWord)
        var neighbors = [String: [String]]()

        for word in wordset {
            var chars = Array(word)
            for j in chars.indices {
                let original = chars[j]
                chars[j] = "*"
                neighbors[String(chars), default: []].append(word)
                chars[j] = original
            }
        }

        var visited: Set<String> = [beginWord]
        var level = [beginWord]
        var res = 1

        while !level.isEmpty {
            var next: [String] = []

            for word in level {
                if word == endWord { return res }

                var chars = Array(word)
                for j in chars.indices {
                    let original = chars[j]
                    chars[j] = "*"
                    let pattern = String(chars)
                    chars[j] = original

                    for neighbor in neighbors[pattern] ?? [] {
                        if !visited.contains(neighbor) {
                            visited.insert(neighbor)
                            next.append(neighbor)
                        }
                    }
                }
            }
            level = next
            res += 1
        }
        
        return 0
    }
}
