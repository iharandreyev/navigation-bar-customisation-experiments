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
            .onAppear {
                UINavigationBar.configureCurrent { item in
                    let appearance = NavigationBarStyle.Appearance(
                        titleStyle: TextStyle(font: .titleDefault, color: .textTetriary),
                        backgroundColor: .backgroundSecondary,
                        backgroundEffect: nil,
                        hasShadow: true,
                        backIndicatorImage: .backButton
                    )
                    let style = NavigationBarStyle(
                        scrollEdgeAppearance: appearance,
                        standardAppearance: appearance)

                    item.configure(with: style)
                }
            }
        }
    }
}
