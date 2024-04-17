import SwiftUI

struct EmployeeRow: View {
    let employee: Employee
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(employee.username)
                    .font(.headline)
                Text("Service Type: \(employee.serviceType)")
                    .font(.subheadline)
                Text("Email: \(employee.email)")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}


struct AllEmployeesView: View {
    let employees: [Employee]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(employees) { employee in
                    EmployeeRow(employee: employee)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct SortedEmployeesView: View {
    let employees: [Employee]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(employees.sorted { $0.username < $1.username }) { employee in
                    EmployeeRow(employee: employee)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct DeliveryEmployeesView: View {
    let employees: [Employee]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(employees.filter { $0.serviceType == "Доставка" }) { employee in
                    EmployeeRow(employee: employee)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct EmployeeListView2: View {
    
    let employees = [
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

    var body: some View {
            TabView {
                AllEmployeesView(employees: employees)
                    .tabItem {
                        Text("All")
                    }
                
                SortedEmployeesView(employees: employees)
                    .tabItem {
                        Text("Sorted")
                    }
                
                DeliveryEmployeesView(employees: employees)
                    .tabItem {
                        Text("Delivery")
                    }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

