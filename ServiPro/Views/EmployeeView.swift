import SwiftUI

struct EmployeeView: View {
    // Створюємо екземпляр класу Employee з дефолтними значеннями
    let employee = Employee(userId: 1, username: "johndoe", password: "12345", email: "john.doe@example.com", employeeId: 1001, serviceType: "Plumbing", schedule: ["Monday", "Wednesday", "Friday"])
    
    var body: some View {
        VStack(spacing: 20) {
            // Вивід інформації про працівника за допомогою методу displayUserInfo
            employee.displayUserInfo()
            
            // Кнопка для перегляду розкладу працівника
            Button("View Schedule") {
                employee.viewSchedule()
            }
            .padding()
            
            // Приклад виклику статичного методу
            Button("Static Method") {
                Employee.staticMethod()
            }
            .padding()
        }
        .padding()
    }
}

