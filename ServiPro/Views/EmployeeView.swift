import SwiftUI

struct EmployeeView: View {
    // Створюємо екземпляр класу Employee з дефолтними значеннями
    let employee = Employee(userId: 1, username: "Іван_Петренко", password: "пароль123", email: "ivan.petro@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday])

    
    var body: some View {
        VStack(spacing: 20) {
            
            employee.displayUserInfo()
            
            
            Button("View Schedule") {
                employee.viewSchedule()
            }
            .padding()
            
          
            Button("Static Method") {
                Employee.staticMethod()
            }
            .padding()
            
            
            Button("Accept Order") {
                employee.acceptOrder(orderId: 1)
            }
            .padding()
            
            Button("Reject Order") {
                employee.rejectOrder(orderId: 1)
            }
            .padding()
            
            Button("Change Order Status") {
                employee.changeOrderStatus(orderId: 1, newStatus: "Виконується")
            }
            .padding()
        }
        .padding()
    }
}

