import Foundation

struct Transaction: Hashable, Codable {
    let amount: Double
    let type: String
    let date: Date


    func hash(into hasher: inout Hasher) {
        hasher.combine(amount)
        hasher.combine(type)
        hasher.combine(date)
    }

    static func ==(lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.amount == rhs.amount &&
               lhs.type == rhs.type &&
               lhs.date == rhs.date
    }
}
