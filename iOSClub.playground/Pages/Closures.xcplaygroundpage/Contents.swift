//: [Previous](@previous)

import Foundation
// MARK:- Value Type Capture
struct ValueType {
    var value: Int
}

var valueInstance = ValueType(value: 42)
var closureVal = { [valueInstance] in
    print("Значение: \(valueInstance.value)")
}
valueInstance.value = 100
closureVal() // Печатает: "Значение: 42", так как была захвачена копия valueInstance

// MARK:- Reference Type Capture
class ReferenceType {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}
var referenceInstance = ReferenceType(value: 42)
let closureRef = { [referenceInstance] in
    print("Значение: \(referenceInstance.value)")
}
referenceInstance.value = 100
closureRef() // Печатает: "Значение: 100", так как была захвачена ссылка на referenceInstance


class OperationManager {
    var completionHandlers: [() -> Void] = []
    
    func addOperation(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
        return
    }
    
    func executeOperations() {
        for handler in completionHandlers {
            handler()
        }
    }
}

let manager = OperationManager()
manager.addOperation {
    print("Performing escaping closure1")
}
manager.addOperation {
    print("Performing escaping closure2")
}
manager.addOperation {
    print("Performing escaping closure3")
}
manager.executeOperations()

let closure01 = {
    print("Безымянная кложура")
}
closure01()

class SimpleClass{
    var parameter: Int = 0
    func function() {
        parameter = 1
        print("Функция кложура \(parameter)")
        func embedFunction() {
            parameter = 10
            print("Вложенная функция \(parameter)")
        }
        embedFunction()
        let parameter2 = 0
        let closure01 = {
            self.parameter = 15
            print("Безымянная кложура\(parameter2)")
        }
    }
}
let cl = SimpleClass()
cl.function()

var array: Array<Int> = [10,15,30,40] // <Int> = <Element>
var array2: Array<String> = ["t", "i", "p"] // <String> = <Element>

array.map { (value: Int) -> String in
    return String(value)
}

array
    .filter { $0 < 20 } // n - количество элементов
    .sorted(by: { $0 > $1 }) // nlogn
    .map { String($0) } // n

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}
array.myMap { value in
    String(value)
}


//    $0 = i
//    array[i]


//: [Next](@next)
