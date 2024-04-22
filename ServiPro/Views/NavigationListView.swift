import SwiftUI

struct NavigationListView: View {
    var body: some View {
        NavigationView {
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
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 400)
            .navigationTitle("Menu")
            
            Text("Placeholder for main content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.1))
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    NavigationLink(destination: OrdersView()) {
                        Label("Orders", systemImage: "cart.fill")
                    }
                    Spacer()
                    NavigationLink(destination: EmployeesView()) {
                        Label("Employees", systemImage: "person.2.fill")
                    }
                    Spacer()
                    NavigationLink(destination: BalanceView()) {
                        Label("Balance", systemImage: "dollarsign.circle.fill")
                    }
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Label("Profile", systemImage: "person.fill")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct OrdersView: View {
    var body: some View {
        Text("Orders View")
    }
}

struct EmployeesView: View {
    var body: some View {
        Text("Employees View")
    }
}

struct BalanceView: View {
    var body: some View {
        Text("Balance View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}
