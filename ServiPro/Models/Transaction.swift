import Foundation

struct Transaction: Hashable {
    let amount: Double
    let type: String // "Deposit" or "Withdrawal"
    let date: Date

    // Implementing Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(amount)
        hasher.combine(type)
        hasher.combine(date)
    }

    // Implementing Equatable conformance
    static func ==(lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.amount == rhs.amount &&
               lhs.type == rhs.type &&
               lhs.date == rhs.date
    }
}
