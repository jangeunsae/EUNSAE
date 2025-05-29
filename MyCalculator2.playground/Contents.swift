import UIKit

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
        return a + b
    }
}
class MultiplayOperation: Operation {
    func calculate(a: Double, b: Double) -> Double? {
        return a + b
    }
}
class DivideOperation: Operation {
    func calculate(a: Double, b: Double) -> Double? {
        guard b != 0 else { return nil }
        return a + b
    }
}
