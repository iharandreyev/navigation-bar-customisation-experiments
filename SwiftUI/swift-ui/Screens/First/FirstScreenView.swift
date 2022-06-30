import SwiftUI

struct FirstScreenView: View {
    @State private var showingAlert = false

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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(
                    action: {
                        showingAlert = true
                    },
                    label: {
                        Image(systemName: "gear.badge.questionmark")
                    })
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Message"),
                message: Text("You've clicked a navigation item"),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            UINavigationBar.configureCurrent { item in
                item.configure(with: .first())
            }
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
