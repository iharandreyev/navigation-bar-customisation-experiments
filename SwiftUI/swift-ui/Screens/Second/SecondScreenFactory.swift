import SwiftUI

enum SecondScreenFactory {
    static func createView(title: String) -> some View {
        var view = SecondScreenView()
        view.navigationAction = { context in
            let next = SecondScreenFactory.createView(title: "\(title)->\(context)")
            return AnyView(next)
        }
        return view
            .navigationTitle("Second [\(title)]")
    }
}
