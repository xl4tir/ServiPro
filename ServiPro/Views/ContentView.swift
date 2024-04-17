//
//  ContentView.swift
//  ServiPro
//
//  Created by Владислав Опиченік on 12.04.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var user: User = User(userId: 1, username: "john_doe", password: "password123", email: "john.doe@example.com", userType: .client)
    @State private var isEditingProfile = false
    @State private var newName = ""
    @State private var newEmail = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                user.displayUserInfo()
                
                Button("Update Profile") {
                    isEditingProfile = true
                    newName = user.username
                    newEmail = user.email
                }
                .sheet(isPresented: $isEditingProfile) {
                    EditProfileView(user: user, newName: $newName, newEmail: $newEmail, isEditingProfile: $isEditingProfile)
                }
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

struct EditProfileView: View {
    @ObservedObject var user: User
    @Binding var newName: String
    @Binding var newEmail: String
    @Binding var isEditingProfile: Bool
    
    var body: some View {
        VStack {
            Text("Edit Profile")
                .font(.headline)
                .padding(.bottom, 20)
            
            TextField("New Username", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("New Email", text: $newEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                user.updateProfile(username: newName, email: newEmail)
                newName = ""
                newEmail = ""
                isEditingProfile = false
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
