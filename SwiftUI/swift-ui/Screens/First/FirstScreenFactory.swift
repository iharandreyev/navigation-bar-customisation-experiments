import SwiftUI

enum FirstScreenFactory {
    static func createView() -> some View {
        var view = FirstScreenView()
        view.navigationAction = { context in
            let next = SecondScreenFactory.createView(title: context)
            return AnyView(next)
        }
        return view
            .navigationTitle("First")
    }
}
