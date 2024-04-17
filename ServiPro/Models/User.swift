import SwiftUI
import Combine



class User: ObservableObject {
    @Published var userId: Int
    @Published var username: String?
    @Published var password: String?
    @Published var email: String?
    @Published var userType: UserType?

    init(userId: Int, username: String?, password: String?, email: String?, userType: UserType?) {
        self.userId = userId
        self.username = username
        self.password = password
        self.email = email
        self.userType = userType
    }
    
    func login() {
        if let username = username, let password = password {
            // Логіка авторизації користувача з перевіркою на nil
            print("Авторизація для користувача \(username)")
        } else {
            print("Недостатньо даних для авторизації")
        }
    }
    
    func updateProfile(username: String?, email: String?) {
        if let newUsername = username {
            self.username = newUsername
        }
        if let newEmail = email {
            self.email = newEmail
        }
    }
    
    func displayUserInfo() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("User Information:")
                .font(.title)
            
            if let username = username {
                Text("Username: \(username)")
            }
            
            if let email = email {
                Text("Email: \(email)")
            }
            
            if let userType = userType {
                Text("User Type: \(userType == .client ? "Client" : "Employee")")
            }
        }
    }
}

