import Foundation

class Employee: User, Identifiable {
    var employeeId: Int
    var serviceType: String
    var schedule: [ScheduleType]
    
   
    init(userId: Int = 0, username: String = "", password: String = "", email: String = "", employeeId: Int = 0, serviceType: String = "", schedule: [ScheduleType] = []) {
        self.employeeId = employeeId
        self.serviceType = serviceType
        self.schedule = schedule
        super.init(userId: userId, username: username, password: password, email: email, userType: .employee)
    }
    

    func viewSchedule() {
        print("Employee \(self.username) schedule:")
        for day in schedule {
            print("- \(ScheduleType.stringFromScheduleType(day))")
        }
    }
    

    func acceptOrder(orderId: Int) {
        print("Order \(orderId) has been accepted by \(self.username)")
    }
    

    func rejectOrder(orderId: Int) {
        print("Order \(orderId) has been rejected by \(self.username)")
    }
    

    func changeOrderStatus(orderId: Int, newStatus: String) {
        print("Order \(orderId) status changed to \(newStatus) by \(self.username)")
    }
    
   
    static func staticMethod() {
        print("This is a static method of Employee class.")
    }
}
