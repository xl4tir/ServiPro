//
//  ServiProApp.swift
//  ServiPro
//
//  Created by Владислав Опиченік on 12.04.2024.
//

import SwiftUI
import SwiftData

@main

struct ServiProApp: App {
    let employee = EmployeeWithBalance(userId: 1, username: "Іван_Петренко", password: "пароль123", email: "ivan.petro@example.com", employeeId: 1001, serviceType: "Послуги з ремонту", schedule: [.monday, .wednesday, .friday], balance: 100.0)
    
    var body: some Scene {
        WindowGroup {
            

            

                
                
                TabView {
                                ProfileView()
                                    .tabItem {
                                        Label("TestView", systemImage: "person.circle")
                                    }
                                
                                EmployeeListView2()
                                    .tabItem {
                                        Label("Employee", systemImage: "person.2.circle")
                                    }
                                
                                // Додайте екран для замовлень (Orders)
                                OrderView()
                                    .tabItem {
                                        Label("Orders", systemImage: "cart.circle")
                                    }
                                
                                // Додайте екран для балансу (Balance)
                    EmployeeWithBalanceView(viewModel:EmployeeWithBalanceViewModel(employee:employee))
                                    .tabItem {
                                        Label("Balance", systemImage: "creditcard.circle")
                                    }
                                
                                // Додайте екран для профілю користувача (Profile)
                            ProfileView()
                                    .tabItem {
                                        Label("Profile", systemImage: "person.crop.circle")
                                    }
                            }
                            .accentColor(.blue)
                    
                
            
        }
    }
}
