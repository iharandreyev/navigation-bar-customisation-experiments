import SwiftUI

struct ThirdScreenView: View {
    var body: some View {
        List {
            ForEach(0 ..< 20) { row in
                let itemTitle = "Item \(row)"
                Text(itemTitle)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Doesn't work
            UINavigationBar.configureCurrent { item in
                item.configure(with: .second())
            }
        }
    }
}

struct ThirdScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreenView()
    }
}
