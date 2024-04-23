import SwiftUI

class OrderListViewModel: ObservableObject {
    @Published var orders: [Order]

    init(employee: EmployeeWithBalance, allOrders: [Order]) {

        self.orders = allOrders.filter { $0.employee.employeeId == employee.employeeId }
    }
    
    func changeOrderStatus(order: Order) {
            if order.status == "В процесі" {
                order.status = "Завершено"
            } else if order.status == "Завершено" {
                order.status = "Очікує оплату"
            } else if order.status == "Очікує оплату" {
                order.status = "Скасовано"
            } else if order.status == "Скасовано" {
                order.status = "В процесі"
            }
        
            objectWillChange.send()
        }


}
