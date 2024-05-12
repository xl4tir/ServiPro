import SwiftUI

struct HorizontalItemView: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
        }
        .padding(10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct HorizontalItems: View {
    var body: some View {
        VStack(spacing: 20) {
            HorizontalItemView(title: "User", imageName: "person.fill")
            HorizontalItemView(title: "Top Employee", imageName: "star.fill")
            HorizontalItemView(title: "Orders", imageName: "book.fill")
        }
        .padding()
    }
}
