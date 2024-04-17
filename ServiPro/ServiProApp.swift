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
                
                
                TabView {
                    ContentView()
                        .tabItem {
                            Label("User", systemImage: "1.circle")
                        }

                    EmployeeView()
                        .tabItem {
                            Label("Employee", systemImage: "2.circle")
                        }
                    
                    OrderView()
                        .tabItem {
                            Label("Order", systemImage: "3.circle")
                        }
                    
                    VerticalItems()
                        .tabItem {
                            Label("Vertical", systemImage: "4.circle")
                        }
                    
                    HorizontalItems()
                        .tabItem {
                            Label("Horizontal", systemImage: "5.circle")
                        }
                    EmployeeListView()
                        .tabItem {
                            Label("Employee List", systemImage: "6.circle")
                        }
                    
                }
            }
        }
    }
}
