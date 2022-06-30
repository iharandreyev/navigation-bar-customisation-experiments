import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FirstScreenFactory.createView()
            }
        }
    }
}
