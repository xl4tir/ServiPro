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
    
    
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
            WindowGroup {
                TabView {
                    ContentView() // Перший вкладка з першим View
                        .tabItem {
                            Label("First", systemImage: "1.circle")
                        }

                    EmployeeView() // Другий вкладка з другим View
                        .tabItem {
                            Label("Second", systemImage: "2.circle")
                        }
                }
            }
        }
    
    
}
