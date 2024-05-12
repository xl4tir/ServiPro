import SwiftUI

struct OrdersView: View {
    @ObservedObject var orderListViewModel: OrderListViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                Text("Orders")
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .padding(.top, 5)
                
                if horizontalSizeClass == .compact {
                    ForEach(orderListViewModel.orders) { order in
                        OrderListView(viewModel: orderListViewModel, order: order)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                    }
                } else {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 200), spacing: 10),
                        GridItem(.adaptive(minimum: 200), spacing: 10)
                    ], spacing: 10) {
                        ForEach(orderListViewModel.orders) { order in
                            OrderListView(viewModel: orderListViewModel, order: order)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.vertical, 5)
                        }
                    }
                }
            }
            .padding()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Orders").fontWeight(.semibold)
                    .font(.system(size: 20))
                    
            }
        }
    }
      
}

struct OrderListView: View {
    @ObservedObject var viewModel: OrderListViewModel
    var order: Order

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Order ID: \(order.orderId)")
                .font(.headline)
            Text("Service Type: \(order.serviceType)")
                .font(.subheadline)
            Text("Work Price: \(order.workPrice)")
                .font(.subheadline)
            Text("Status: \(order.status)")
                .font(.subheadline)
            Button(action: {
                viewModel.changeOrderStatus(order: order)
            }) {
                Text("Change Status")
                    .foregroundColor(.blue)
            }
        }
        .padding(10)
        
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}
