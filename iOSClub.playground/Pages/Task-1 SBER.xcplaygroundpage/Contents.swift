//: [Previous](@previous)

import Foundation

func solution(array: [Int]) -> (Int, Int) {

    var tuple = (-1, -1)
    var dict = [Int: Int]()
    for i in array { // O(N)
        //  Заполняем словарь
        let b: Int
        if let a = dict[i] {
            b = a + 1
        } else {
            b = 1
        }
        dict[i] = b
        if tuple.1 < b {
            tuple.0 = i
            tuple.1 = b
        }
    }
    return tuple
}
print(solution(array: [30]))


//: [Next](@next)
