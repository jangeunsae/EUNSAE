//import UIKit

//var greeting = "Hello, playground"

class Calculator {

    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    func subtract(a: Double, b: Double) -> Double {
        return a - b
    }
    func multiply(a: Double, b: Double) -> Double {
        return a * b
    }
    func divide(a: Double, b: Double) -> Double {
        return a / b
    }
    
    func remainder(a: Double, b: Double) -> Double? {
        guard b != 0 else { return nil}
        return a.truncatingRemainder(dividingBy: b)
    }
}

protocol Operation {
    func calculate (a: Double, b: Double) -> Double?
}
class AddOperation: Operation {
    func calculate(a: Double, b: Double) -> Double? {
        return a + b
    }
}
class SubtractOperation: Operation {
    func calculate(a: Double, b: Double) -> Double? {
        return a - b
    }
}
class MultiplyOperation: Operation {
    func calculate(a: Double, b: Double) -> Double? {
        return a * b
    }
}
class DivideOperation: Operation {
    func calculate(a: Double, b: Double) -> Double? {
        guard b != 0 else { return nil }
        return a / b
    }
}

let calculator = Calculator()
let result = calculator.add(a: 5 , b: 3)
print(result)
