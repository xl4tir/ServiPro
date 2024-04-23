import SwiftUI

struct OrderView: View {
        let client = Client(userId: 1, username: "Марія", password: "password", email: "maria@example.com", clientId: 101, contactInfo: "телефон: 0987654321")
        
        let employee = Employee(userId: 2, username: "Іван", password: "12345", email: "ivan@example.com", employeeId: 201, serviceType: "Доставка", schedule: [.monday, .wednesday, .friday])
        

        @State private var order: Order?
        
        var body: some View {
            VStack {
                
                Text("Деталі замовлення:")
                    .font(.title)
                    .padding()
                
                Button(action: {
                    order = Order(orderId: 1, client: client, employee: employee, serviceType: "Доставка їжі", status: "В процесі", details: nil, workPrice: 100)

                    print("Замовлення створено!")
                }, label: {
                    Text("Створити замовлення")
                        .padding()
                })
                
                Button(action: {
                    order?.updateStatusLambda("Завершено")
                }, label: {
                    Text("Оновити статус замовлення")
                        .padding()
                })
                
                Button(action: {
         
                    order?.printOrderDetails()
                }, label: {
                    Text("Вивести деталі замовлення")
                        .padding()
                })
                
                Button(action: {
      
                    if let order = order {
                        OrderManager.shared.processOrder(order: order)
                    }
                }, label: {
                    Text("Обробити замовлення")
                        .padding()
                })
                
                Button(action: {
                    if let order = order {
                        OrderManager.shared.cancelOrder(order: order)

                    }
                }, label: {
                    Text("Скасувати замовлення")
                        .padding()
                })

            }
        }
}


