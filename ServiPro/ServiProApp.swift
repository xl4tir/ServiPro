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
    
    var body: some Scene {
        WindowGroup {
            
                
                
                TabView {
                                ProfileView()
                                    .tabItem {
                                        Label("TestView", systemImage: "person.circle")
                                    }
                                
                                EmployeeGridView()
                                    .tabItem {
                                        Label("Employee", systemImage: "person.2.circle")
                                    }
                                
                                // Додайте екран для замовлень (Orders)
                                OrderView()
                                    .tabItem {
                                        Label("Orders", systemImage: "cart.circle")
                                    }
                                
                                // Додайте екран для балансу (Balance)
                                HorizontalItems()
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
