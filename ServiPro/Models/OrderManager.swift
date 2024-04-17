class OrderManager {
    static let shared = OrderManager()
    
    private init() {}
    
    func processOrder(order: Order) {
        print("Обробка замовлення...")
    }
    
    func cancelOrder(orderId: Int) {
        print("Замволення " ,orderId ," скасовано!")
    }
}
