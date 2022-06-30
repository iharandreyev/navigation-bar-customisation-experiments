import SwiftUI

@main
struct MainApp: App {
    init() {
        UINavigationBar.persistDefaultConfig()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                FirstScreenFactory.createView()
            }
        }
    }
}
