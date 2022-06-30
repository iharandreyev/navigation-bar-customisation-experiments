import SwiftUI

struct SecondScreenView: View {
    var navigationAction: ((String) -> AnyView)?

    var body: some View {
        List {
            ForEach(0 ..< 20) { row in
                let itemTitle = "Item \(row)"
                NavigationLink(
                    destination: {
                        navigationAction?(itemTitle)
                    },
                    label: {
                        Text(itemTitle)
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                    })
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            UINavigationBar.configureCurrent { item in
                item.configure(with: .second())
            }
        }
    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView()
    }
}
