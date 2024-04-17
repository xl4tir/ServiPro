class OrderManager {
    static let shared = OrderManager()
    
    private init() {}
    
    func processOrder(order: Order) {
        print("Обробка замовлення...")
    }
    
    func cancelOrder(order: Order) {
        order.status = "Скасовано"
        print("Замволення " ,order.orderId ," скасовано!")
       
    }
}
