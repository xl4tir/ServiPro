import SwiftUI
import Combine

class User: ObservableObject {
    @Published var userId: Int
    @Published var username: String
    @Published var password: String
    @Published var email: String
    @Published var userType: UserType

    init(userId: Int, username: String, password: String, email: String, userType: UserType) {
        self.userId = userId
        self.username = username
        self.password = password
        self.email = email
        self.userType = userType
    }
    
    func login() {
    
    }
    
    func logout() {
        
    }
    
    func updateProfile(username: String, email: String) {
        self.username = username
        self.email = email
    }
    
    func viewOrders() {
     
    }
    
    func displayUserInfo() -> AnyView {
            return AnyView(
                VStack(alignment: .leading, spacing: 10) {
                    Text("User Information:")
                        .font(.title)
                    
                    Text("Username: \(self.username)")
                    Text("Email: \(self.email)")
                    Text("User Type: \(self.userType == .client ? "Client" : "Employee")")
                }
            )
        }
}


