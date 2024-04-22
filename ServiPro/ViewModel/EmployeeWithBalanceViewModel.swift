import Foundation

class EmployeeWithBalanceViewModel: ObservableObject {
    private var employee: EmployeeWithBalance
    
    @Published var currentBalance: Double
    @Published var transactions: [Transaction]
    
    init(employee: EmployeeWithBalance) {
        self.employee = employee
        self.currentBalance = employee.balance.amount
        self.transactions = []
    }
    
    func deposit(amount: Double) {
        employee.deposit(amount: amount)
        updateBalanceAndTransactions()
    }
    
    func withdraw(amount: Double) {
        employee.withdraw(amount: amount)
        updateBalanceAndTransactions()
    }
    
    func updateBalanceAndTransactions() {
        self.currentBalance = employee.balance.amount
        self.transactions = employee.transactions
    }
}
