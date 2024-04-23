class Order:Identifiable {
    var orderId: Int
    var client: Client
    var employee: Employee
    var serviceType: String
    var status: String
    var details: String?
    var workPrice: Double  // Додана властивість для ціни роботи

    init(orderId: Int, client: Client, employee: Employee, serviceType: String, status: String, details: String?, workPrice: Double) {
        self.orderId = orderId
        self.client = client
        self.employee = employee
        self.serviceType = serviceType
        self.status = status
        self.details = details
        self.workPrice = workPrice
    }

    var updateStatusLambda: (String) -> Void {
        return { [weak self] newStatus in
            self?.status = newStatus
            print("Статус замовлення оновлено до: \(newStatus)")
        }
    }

    func printOrderDetails() {
        print("Замовлення ID: \(orderId)")
        print("Клієнт: \(client.username)")
        print("Працівник: \(employee.username)")
        print("Тип послуги: \(serviceType)")
        print("Статус: \(status)")
        if let orderDetails = details {
            print("Деталі: \(orderDetails)")
        } else {
            print("Деталі відсутні")
        }
        print("Ціна роботи: \(workPrice)")  // Друкуємо ціну роботи
    }
}
