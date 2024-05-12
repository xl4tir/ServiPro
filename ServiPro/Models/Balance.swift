import Foundation

class Balance {
    var amount: Double
    
    init(amount: Double = 0.0) {
        self.amount = amount
    }
    
    func deposit(amount: Double) {
        self.amount += amount
    }
    
    func withdraw(amount: Double) -> Bool {
        if amount <= self.amount {
            self.amount -= amount
            return true
        } else {
            return false
        }
    }
    
}
