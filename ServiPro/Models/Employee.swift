import Foundation

class Employee: User, Identifiable {
    var employeeId: Int
    var serviceType: String
    var schedule: [ScheduleType] // Розклад у форматі днів тижня
    
    // Конструктор з параметрами та дефолтними значеннями
    init(userId: Int = 0, username: String = "", password: String = "", email: String = "", employeeId: Int = 0, serviceType: String = "", schedule: [ScheduleType] = []) {
        self.employeeId = employeeId
        self.serviceType = serviceType
        self.schedule = schedule
        super.init(userId: userId, username: username, password: password, email: email, userType: .employee)
    }
    
    // Функція для перегляду розкладу працівника
    func viewSchedule() {
        print("Employee \(self.username) schedule:")
        for day in schedule {
            print("- \(ScheduleType.stringFromScheduleType(day))")
        }
    }
    
    // Функція для прийняття замовлення
    func acceptOrder(orderId: Int) {
        print("Order \(orderId) has been accepted by \(self.username)")
    }
    
    // Функція для відхилення замовлення
    func rejectOrder(orderId: Int) {
        print("Order \(orderId) has been rejected by \(self.username)")
    }
    
    // Функція для зміни статусу замовлення
    func changeOrderStatus(orderId: Int, newStatus: String) {
        print("Order \(orderId) status changed to \(newStatus) by \(self.username)")
    }
    
    // Статичний метод для класу Employee
    static func staticMethod() {
        print("This is a static method of Employee class.")
    }
}
