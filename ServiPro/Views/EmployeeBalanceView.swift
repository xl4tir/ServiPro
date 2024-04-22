import SwiftUI

struct EmployeeWithBalanceView: View {
    @ObservedObject var viewModel: EmployeeWithBalanceViewModel
    
    @State private var depositAmount: String = ""
    @State private var withdrawAmount: String = ""
    @State private var isDepositModalPresented: Bool = false
    @State private var isWithdrawModalPresented: Bool = false
    
    var sortedTransactions: [Transaction] {
        return viewModel.transactions.sorted(by: { $0.date > $1.date })
    }
    
    var body: some View {
        VStack {
            Text("Balance")
                .font(.title)
                .padding()
            Text("\(viewModel.currentBalance)")
                .font(.title)
                .padding()
            
            HStack {
                Button(action: {
                    isDepositModalPresented = true
                }) {
                    VStack {
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.system(size: 30))
                        Text("Deposit")
                    }
                }
                .padding()
                .sheet(isPresented: $isDepositModalPresented) {
                    DepositModalView(isPresented: $isDepositModalPresented, viewModel: viewModel)
                }
                
                Button(action: {
                    isWithdrawModalPresented = true
                }) {
                    VStack {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 30))
                        Text("Withdraw")
                    }
                }
                .padding()
                .sheet(isPresented: $isWithdrawModalPresented) {
                    WithdrawModalView(isPresented: $isWithdrawModalPresented, viewModel: viewModel)
                }
            }
            
            List(sortedTransactions, id: \.self) { transaction in
                VStack(alignment: .leading) {
                    Text("\(transaction.type): \(transaction.amount)")
                    Text("Date: \(transaction.date)")
                        .font(.caption)
                }
            }
            .padding()
        }
    }
}

struct DepositModalView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: EmployeeWithBalanceViewModel
    
    @State private var depositAmount: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter amount", text: $depositAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Confirm Deposit") {
                if let amount = Double(depositAmount) {
                    viewModel.deposit(amount: amount)
                    isPresented = false
                }
            }
            .padding()
        }
    }
}

struct WithdrawModalView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: EmployeeWithBalanceViewModel
    
    @State private var withdrawAmount: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter amount", text: $withdrawAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Confirm Withdraw") {
                if let amount = Double(withdrawAmount) {
                    viewModel.withdraw(amount: amount)
                    isPresented = false
                }
            }
            .padding()
        }
    }
}
