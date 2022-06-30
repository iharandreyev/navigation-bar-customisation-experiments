import SwiftUI

enum ThirdScreenFactory {
    static func createView(title: String) -> some View {
        let view = ThirdScreenView()
        return view
            .navigationTitle("Third [\(title)]")
    }
}
