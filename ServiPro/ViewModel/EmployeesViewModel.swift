import SwiftUI
import Foundation

class EmployeesViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var sortedEmployees: [Employee] = []
    @Published var filteredEmployees: [Employee] = []

        
    func loadEmployees() {
        
        self.employees = [
            Employee(userId: 1, username: "Іван", password: "ivan123", email: "ivan@example.com", employeeId: 101, serviceType: "Доставка", schedule: [.monday, .wednesday, .friday]),
            Employee(userId: 2, username: "Марія", password: "maria456", email: "maria@example.com", employeeId: 102, serviceType: "Консультація", schedule: [.tuesday, .thursday]),
            Employee(userId: 3, username: "Петро", password: "petro789", email: "petro@example.com", employeeId: 103, serviceType: "Монтаж", schedule: [.monday, .wednesday, .friday]),
            Employee(userId: 4, username: "Олексій", password: "oleksiy789", email: "oleksiy@example.com", employeeId: 104, serviceType: "Доставка", schedule: [.monday, .thursday]),
            Employee(userId: 5, username: "Анна", password: "anna456", email: "anna@example.com", employeeId: 105, serviceType: "Консультація", schedule: [.tuesday, .wednesday]),
            Employee(userId: 6, username: "Василь", password: "vasyl123", email: "vasyl@example.com", employeeId: 106, serviceType: "Монтаж", schedule: [.wednesday, .friday]),
            Employee(userId: 7, username: "Олена", password: "olena789", email: "olena@example.com", employeeId: 107, serviceType: "Доставка", schedule: [.monday, .tuesday]),
            Employee(userId: 8, username: "Сергій", password: "sergiy456", email: "sergiy@example.com", employeeId: 108, serviceType: "Консультація", schedule: [.wednesday, .thursday]),
            Employee(userId: 9, username: "Тетяна", password: "tetyana123", email: "tetyana@example.com", employeeId: 109, serviceType: "Монтаж", schedule: [.thursday, .friday]),
            Employee(userId: 10, username: "Максим", password: "maxym789", email: "maxym@example.com", employeeId: 110, serviceType: "Доставка", schedule: [.tuesday, .friday])
        ]
    }
    
    func sortEmployees(by sortType: SortType) {
            switch sortType {
            case .byNameAscending:
                sortedEmployees = employees.sorted(by: { $0.username < $1.username })
            case .byNameDescending:
                sortedEmployees = employees.sorted(by: { $0.username > $1.username })
            }
        }
        
        func filterEmployees(by serviceType: String) {
            filteredEmployees = employees.filter { $0.serviceType.lowercased() == serviceType.lowercased() }
        }
}

enum SortType {
    case byNameAscending
    case byNameDescending
}
