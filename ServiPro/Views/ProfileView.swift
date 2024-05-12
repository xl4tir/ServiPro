import SwiftUI

struct ProfileView: View {
    @State private var selection: NavigationLinkDestination?
    let employee = EmployeeWithBalance(userId: 1, username: "Владислав_Опиченік", password: "pass123", email: "vlad.opychenik@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday], balance: 100.0)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                employee.displayUserInfo()
                
    
                Spacer()
                
                List {
                    NavigationLink(destination: ContentView(), tag: .contentView, selection: $selection) {
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
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Profile").fontWeight(.semibold)
                            .font(.system(size: 20))
                            
                    }
                }

                
            }
            .padding()
            .onAppear {
                        
                selection = .contentView
                       }
            
        }
    }
}
enum NavigationLinkDestination {
    case contentView
    // Add more cases for other destinations if needed
}
