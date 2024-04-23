import SwiftUI

struct OrdersView: View {
    @ObservedObject var orderListViewModel: OrderListViewModel

    var body: some View {
        VStack {
            Text("All orders")
                
                .fontWeight(.semibold)
                .font(.system(size: 18))
                .padding(.top, 5)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(orderListViewModel.orders) { order in
                        OrderListView(viewModel: orderListViewModel, order: order)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("All orders")
    }
}
struct OrderListView: View {
    @ObservedObject var viewModel: OrderListViewModel
    var order: Order

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Замовлення ID: \(order.orderId)")
                .font(.headline)
            Text("Тип послуги: \(order.serviceType)")
                .font(.subheadline)
            Text("Ціна роботи: \(order.workPrice)")
                .font(.subheadline)
            Text("Статус: \(order.status)")
                .font(.subheadline)
            Button(action: {
                viewModel.changeOrderStatus(order: order)
            }) {
                Text("Змінити статус")
                    .foregroundColor(.blue)
            }
        }
        .padding(10) 
    }
}
