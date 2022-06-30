import SwiftUI

struct FirstScreenView: View {
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
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
