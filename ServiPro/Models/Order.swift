import Foundation

class Order {
    var orderId: Int
    var client: Client
    var employee: Employee
    var serviceType: String
    var status: String
    var details: String? // Поле details тепер стало опціональним (nullable)

    init(orderId: Int, client: Client, employee: Employee, serviceType: String, status: String, details: String?) {
        self.orderId = orderId
        self.client = client
        self.employee = employee
        self.serviceType = serviceType
        self.status = status
        self.details = details
    }
    
    func updateStatus(newStatus: String) {
        // Логіка оновлення статусу замовлення
        self.status = newStatus
    }
}
