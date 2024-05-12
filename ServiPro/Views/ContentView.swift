import SwiftUI

struct ContentView: View {
    @StateObject var user: User = User(userId: 1, username: "john_doe", password: "password123", email: "john.doe@example.com", userType: .client)
    @State private var isEditingProfile = false
    @State private var newName = ""
    @State private var newEmail = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
           
            user.displayUserInfo()
            
            Button("Update Profile") {
                isEditingProfile = true
                newName = user.username
                newEmail = user.email
            }
            .buttonStyle(PrimaryButtonStyle())
            .sheet(isPresented: $isEditingProfile) {
                EditProfileView(user: user, newName: $newName, newEmail: $newEmail, isEditingProfile: $isEditingProfile)
            }
        }
        .padding()
        .navigationTitle("User Profile")
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
                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .padding(.top, 5)
            
            TextField("New Username", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("New Email", text: $newEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                user.updateProfile(username: newName, email: newEmail)
                isEditingProfile = false
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding()
        }
        .padding()
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
