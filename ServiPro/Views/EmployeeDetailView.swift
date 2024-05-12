import SwiftUI

struct EmployeeDetailView: View {
    let employee: Employee
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username: \(employee.username)")
                .font(.headline)
            Text("Service Type: \(employee.serviceType)")
                .font(.subheadline)
            Text("Email: \(employee.email)")
                .font(.subheadline)
            
     
            OrderFormView()
        }
        .padding()
        .navigationBarTitle("Employee Details")
    }
}


struct OrderFormView: View {

    var body: some View {
     
        Text("Order Form")
    }
}
