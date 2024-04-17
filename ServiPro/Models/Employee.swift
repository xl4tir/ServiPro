class Employee: User {
    var employeeId: Int
    var serviceType: String
    var schedule: [String] // Припустимо, розклад у форматі днів тижня
    
    init(userId: Int, username: String, password: String, email: String, employeeId: Int, serviceType: String, schedule: [String]) {
        self.employeeId = employeeId
        self.serviceType = serviceType
        self.schedule = schedule
        super.init(userId: userId, username: username, password: password, email: email, userType: .employee)
    }
    
    func viewSchedule() {
        // Логіка перегляду розкладу працівника
    }
    
    func acceptOrder(orderId: Int) {
        // Логіка прийняття замовлення
    }
    
    func rejectOrder(orderId: Int) {
        // Логіка відхилення замовлення
    }
    
    func changeOrderStatus(orderId: Int, newStatus: String) {
        // Логіка зміни статусу замовлення
    }
}
