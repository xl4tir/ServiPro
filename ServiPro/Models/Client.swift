class Client: User {
    var clientId: Int
    var contactInfo: String
    
    init(userId: Int, username: String, password: String, email: String, clientId: Int, contactInfo: String) {
        self.clientId = clientId
        self.contactInfo = contactInfo
        super.init(userId: userId, username: username, password: password, email: email, userType: .client)
    }
    
    func placeOrder(serviceType: String, details: String) {
        // Логіка розміщення нового замовлення
    }
    
    func contactEmployee(employeeId: Int) {
        // Логіка зв'язку з працівником
    }
}
