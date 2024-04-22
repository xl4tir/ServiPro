//
//  ServiProApp.swift
//  ServiPro
//
//  Created by Владислав Опиченік on 12.04.2024.
//

import SwiftUI
import SwiftData
let employee = EmployeeWithBalance(userId: 1, username: "Іван_Петренко", password: "пароль123", email: "ivan.petro@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday], balance: 100.0)


@main

struct ServiProApp: App {
    
    @StateObject var balanceViewModel = EmployeeWithBalanceViewModel(employee: employee)
    @StateObject var employeesViewModel = EmployeesViewModel()
    var body: some Scene {
        WindowGroup {
            
                
                TabView {
                                
                                EmployeesView()
                                    .tabItem {
                                        Label("Test", systemImage: "person.2.circle")
                                    }
                                EmployeeListView2()
                                    .tabItem {
                                        Label("Employee", systemImage: "person.2.circle")
                                    }
                                
                                OrderView()
                                    .tabItem {
                                        Label("Orders", systemImage: "cart.circle")
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
