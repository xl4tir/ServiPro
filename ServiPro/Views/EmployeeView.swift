import SwiftUI

struct EmployeeView: View {
   
    let employee = Employee(userId: 1, username: "Іван_Петренко", password: "пароль123", email: "ivan.petro@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday])

    var body: some View {

        ScrollView {
            VStack(spacing: 20) {
                employee.displayUserInfo()
                
                Button("View Schedule") {
                    employee.viewSchedule()
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Static Method") {
                    Employee.staticMethod()
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Accept Order") {
                    employee.acceptOrder(orderId: 1)
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Reject Order") {
                    employee.rejectOrder(orderId: 1)
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Change Order Status") {
                    employee.changeOrderStatus(orderId: 1, newStatus: "Виконується")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Spacer()
            }
            .padding()
        }
            .navigationTitle("Employee Profile")
        }
    }




struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
    }
}
