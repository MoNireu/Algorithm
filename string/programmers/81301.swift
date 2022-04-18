// https://programmers.co.kr/learn/courses/30/lessons/81301
// 숫자 문자열과 영단어

import Foundation

func solution(_ s:String) -> Int {
    var answer = s
    let numberWords: [String] = [
        "zero",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine"
    ]
    
    for (index, numberWord) in numberWords.enumerated() {
        var range: Range<String.Index>? = nil
        while true {
            range = answer.range(of: numberWord)
            if let range = range {
                answer.replaceSubrange(range, with: [Character(String(index))])
            }
            else { break }
        }
    }
    return Int(answer)!
}

solution("one4seveneight")
