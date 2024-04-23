
import SwiftUI
import SwiftData


let employee = EmployeeWithBalance(userId: 1, username: "Владислав_Опиченік", password: "pass123", email: "vlad.opychenik@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday], balance: 100.0)
let allOrders: [Order] = [
    Order(orderId: 1, client: Client(), employee: employee, serviceType: "Ремонт кухні", status: "В процесі", details: nil, workPrice: 200.0),
    Order(orderId: 2, client: Client(), employee: employee, serviceType: "Обслуговування сантехніки", status: "Завершено", details: "Необхідно замінити кран", workPrice: 150.0),
    Order(orderId: 3, client: Client(), employee: employee, serviceType: "Монтаж електрики", status: "Очікує оплату", details: "Провести нові лінії живлення", workPrice: 300.0),
    Order(orderId: 4, client: Client(), employee: employee, serviceType: "Ремонт ванної кімнати", status: "Скасовано", details: "Клієнт змінив плани", workPrice: 250.0)
]

@main

struct ServiProApp: App {
    
    @StateObject var balanceViewModel = EmployeeWithBalanceViewModel(employee: employee)
    @StateObject var employeesViewModel = EmployeesViewModel()
    @StateObject var orderListViewModel = OrderListViewModel(employee: employee, allOrders: allOrders)
    
    
    var body: some Scene {
        WindowGroup {
            TabView {
            
               
                OrdersView(orderListViewModel: orderListViewModel)
                    .tabItem {
                        Label("Orders", systemImage: "cart.circle")
                    }
                
                EmployeesView()
                    .tabItem {
                        Label("Employee", systemImage: "person.2.circle")
                    }
                EmployeeWithBalanceView(viewModel: balanceViewModel)

                        .tabItem {
                            Label("Balance", systemImage: "creditcard.circle")
                        }
                        .environmentObject(balanceViewModel)
                ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle")
                        }
                }
                .accentColor(.blue)
    
                
            
        }
    }
}
