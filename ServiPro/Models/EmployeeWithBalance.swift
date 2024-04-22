import Foundation

class EmployeeWithBalance: Employee {
    var balance: Balance
    var transactions: [Transaction] = []
    
    init(userId: Int = 0, username: String = "", password: String = "", email: String = "", employeeId: Int = 0, serviceType: String = "", schedule: [ScheduleType] = [], balance: Double = 0.0) {
        self.balance = Balance(amount: balance)
        super.init(userId: userId, username: username, password: password, email: email, employeeId: employeeId, serviceType: serviceType, schedule: schedule)
    }
    
    func deposit(amount: Double) {
        self.balance.deposit(amount: amount)
        let transaction = Transaction(amount: amount, type: "Deposit", date: Date())
        self.transactions.append(transaction)
        print("Deposited \(amount) to \(self.username)'s balance.")
    }
    
    func withdraw(amount: Double) {
        if self.balance.withdraw(amount: amount) {
            let transaction = Transaction(amount: amount, type: "Withdrawal", date: Date())
            self.transactions.append(transaction)
            print("Withdrawn \(amount) from \(self.username)'s balance.")
        } else {
            print("Insufficient balance to withdraw \(amount).")
        }
    }
    
    func printBalance() {
        print("\(self.username)'s Balance: \(self.balance.amount)")
        print("Transactions:")
        for transaction in self.transactions {
            print("- \(transaction.type): \(transaction.amount), Date: \(transaction.date)")
        }
    }
    
    
}
