class Client: User {
    var clientId: Int
    var contactInfo: String
    
    init(userId: Int, username: String, password: String, email: String, clientId: Int, contactInfo: String) {
        self.clientId = clientId
        self.contactInfo = contactInfo
        super.init(userId: userId, username: username, password: password, email: email, userType: .client)
    }
    

    init() {
        self.clientId = 0
        self.contactInfo = ""
        super.init(userId: 0, username: "Anonymous", password: "password", email: "client@example.com", userType: .client)
    }
    
    func placeOrder(serviceType: String, details: String) {

    }
    
    func contactEmployee(employeeId: Int) {

    }
}
