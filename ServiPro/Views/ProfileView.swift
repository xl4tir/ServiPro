import SwiftUI

struct ProfileView: View {
    let employee = Employee(userId: 1, username: "Іван_Петренко", password: "пароль123", email: "ivan.petro@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday])
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                employee.displayUserInfo()
                
                Button("View Schedule") {
                    employee.viewSchedule()
                }
                .padding()
                
                Spacer()
                
                List {
                    NavigationLink(destination: ContentView()) {
                        Label("User", systemImage: "person.circle")
                    }
                    NavigationLink(destination: EmployeeView()) {
                        Label("Employee", systemImage: "person.2.circle")
                    }
                    NavigationLink(destination: OrderView()) {
                        Label("Order", systemImage: "cart.circle")
                    }
                    NavigationLink(destination: VerticalItems()) {
                        Label("Vertical", systemImage: "list.bullet")
                    }
                    NavigationLink(destination: HorizontalItems()) {
                        Label("Horizontal", systemImage: "lines.measurement.horizontal")
                    }
                    NavigationLink(destination: EmployeeListView()) {
                        Label("Employee List", systemImage: "list.bullet.clipboard")
                    }
                    NavigationLink(destination: EmployeeListView2()) {
                        Label("Employee List 2", systemImage: "list.bullet.clipboard")
                    }
                    NavigationLink(destination: EmployeeGridView()) {
                        Label("Employee Grid", systemImage: "square.grid.3x3.fill")
                    }
                }
                .listStyle(PlainListStyle())
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 400)
                .navigationTitle("Profile")
                
            }
            .padding()
            
            
        }
    }
}
