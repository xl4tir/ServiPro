import SwiftUI

struct VerticalItemView: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
        }
        .padding(10)
    }
}


struct VerticalItems: View {
    var body: some View {
        List {
            VerticalItemView(title: "Users", imageName: "person.fill")
            VerticalItemView(title: "Top Employee", imageName: "star.fill")
            VerticalItemView(title: "Orders", imageName: "book.fill")
        }
        .padding()
    }
}

