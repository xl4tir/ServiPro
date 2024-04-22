import SwiftUI
import Foundation

class EmployeeWithBalanceViewModel: ObservableObject {
    private var employee: EmployeeWithBalance
    
    @AppStorage("currentBalance") var currentBalance: Double = 0.0
    @Published var transactions: [Transaction]
    
    init(employee: EmployeeWithBalance) {
        self.employee = employee
        self.transactions = []
        self.currentBalance = UserDefaults.standard.double(forKey: "currentBalance")
        self.employee.balance.amount = self.currentBalance
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
        saveCurrentBalance()
    }
    
    private func saveCurrentBalance() {
            UserDefaults.standard.set(currentBalance, forKey: "currentBalance")
        }
}


//import SwiftUI
//import Foundation
//
//class EmployeeWithBalanceViewModel: ObservableObject {
//    private var employee: EmployeeWithBalance
//    
//    @AppStorage("currentBalance") var currentBalance: Double = 0.0
//    @AppStorage("transactions") var transactionsData: Data = Data()
//    
//    @Published var transactions: [Transaction] {
//        didSet {
//            saveTransactions()
//        }
//    }
//    
//    init(employee: EmployeeWithBalance) {
//        self.employee = employee
//        self.transactions = []
//        self.currentBalance = UserDefaults.standard.double(forKey: "currentBalance")
//        self.employee.balance.amount = self.currentBalance
//        // Завантаження збережених транзакцій з UserDefaults при ініціалізації
//        if let savedTransactionsData = UserDefaults.standard.data(forKey: "transactions"),
//           let savedTransactions = try? JSONDecoder().decode([Transaction].self, from: savedTransactionsData) {
//            self.transactions = savedTransactions
//        }
//    }
//    
//    func deposit(amount: Double) {
//        employee.deposit(amount: amount)
//        updateBalanceAndTransactions()
//    }
//    
//    func withdraw(amount: Double) {
//        employee.withdraw(amount: amount)
//        updateBalanceAndTransactions()
//    }
//    
//    private func updateBalanceAndTransactions() {
//        self.currentBalance = employee.balance.amount
//        self.transactions = employee.transactions
//        saveCurrentBalance()
//        saveTransactions()
//    }
//    
//    private func saveTransactions() {
//        if let encodedData = try? JSONEncoder().encode(transactions) {
//            transactionsData = encodedData
//            UserDefaults.standard.set(transactionsData, forKey: "transactions")
//        }
//    }
//    
//    private func saveCurrentBalance() {
//            UserDefaults.standard.set(currentBalance, forKey: "currentBalance")
//        }
//}
