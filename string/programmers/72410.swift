import Foundation

func solution(_ new_id:String) -> String {
    var new_id = new_id
        // step 1
    new_id = new_id.lowercased()

    //step 2
    new_id = new_id.filter({ char in
        if char.asciiValue! >= Character("a").asciiValue! && char.asciiValue! <= Character("z").asciiValue! {
            return true
        }
        else if char.asciiValue! >= Character("0").asciiValue! && char.asciiValue! <= Character("9").asciiValue! {
            return true
        }
        else if char == "-" || char == "_" || char == "." {
            return true
        }
        else {
            return false
        }
    })

    // step3
    new_id = replaceDuplicatedDots(id: new_id)

    //step 4
    replaceFirstLastDot(id: &new_id)

    //step 5
    if new_id.isEmpty {new_id = "a"}

    //step 6
    if new_id.count > 15 {
        new_id.removeSubrange(new_id.index(new_id.startIndex, offsetBy: 15)...)
        if new_id.last == "." {new_id.removeLast()}
    }

    //step 7
    if new_id.count <= 2 {
        let addCount = 3 - new_id.count
        for _ in 1...addCount {
            new_id += String(new_id.last!)
        }
    }
    return new_id
}

func replaceDuplicatedDots(id: String) -> String {
    var isPreviousDot: Bool = false
    var replacedString: String = ""
    for char in id {
        if char == "." {
            if isPreviousDot {
                continue
            }
            isPreviousDot = true
        }
        else {
            isPreviousDot = false
        }
        replacedString += String(char)
    }
    return replacedString
}

func replaceFirstLastDot(id: inout String) {
    guard let idFirst = id.first else { return }
    if idFirst == "." {id.removeFirst()}
    guard let idLast = id.last else { return }
    if idLast == "." {id.removeLast()}
}
