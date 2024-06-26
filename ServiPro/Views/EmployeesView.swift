import SwiftUI

struct EmployeesView: View {
    @StateObject var viewModel = EmployeesViewModel()
    @State private var selectedServiceType: String = ""
    @State private var selectedSortType: SortType = .byNameAscending
    @State private var selectedTab = 0
     static let gridItems = [GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Picker(selection: $selectedTab, label: Text("")) {
                    Text("All").tag(0)
                    Text("Sorted").tag(1)
                    Text("Filtered").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 20)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
                
                switch selectedTab {
                case 0:
                    EmployeeGridView1(employees: viewModel.employees, title: "All Employees")
                case 1:
                    VStack {
                        HStack {
                            Text("Sort By:")
                            Button(action: {
                                selectedSortType = (selectedSortType == .byNameAscending) ? .byNameDescending : .byNameAscending
                                viewModel.sortEmployees(by: selectedSortType)
                            }) {
                                Image(systemName: selectedSortType == .byNameAscending ? "arrow.down.circle" : "arrow.up.circle")
                            }
                        }
                        EmployeeGridView1(employees: viewModel.sortedEmployees, title: "Sorted Employees")
                    }
                case 2:
                    FilteredEmployeeView(viewModel: viewModel, selectedServiceType: $selectedServiceType)
                default:
                    EmployeeGridView1(employees: viewModel.employees, title: "All Employees")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.loadEmployees()
        }
    }
}

struct EmployeeGridView1: View {
    let employees: [Employee]
    let title: String
    let gridItems = [GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(employees, id: \.username) { employee in
                    EmployeeRow2(employee: employee)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
        .navigationTitle(title)
    }
}

struct FilteredEmployeeView: View {
    @ObservedObject var viewModel: EmployeesViewModel
    @Binding var selectedServiceType: String
    
    var body: some View {
        VStack {
            TextField("Service Type", text: $selectedServiceType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Filter") {
                viewModel.filterEmployees(by: selectedServiceType)
            }
            .padding()
            
            ScrollView {
                LazyVGrid(columns: EmployeesView.gridItems, spacing: 10) {
                    ForEach(viewModel.filteredEmployees, id: \.username) { employee in
                        EmployeeRow2(employee: employee)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
            .navigationTitle("Filtered Employees")
        }
    }
}
struct EmployeeRow2: View {
    let employee: Employee
    
    var body: some View {
        NavigationLink(destination: EmployeeDetailView(employee: employee)) {
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
}

