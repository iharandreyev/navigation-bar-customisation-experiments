import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FirstScreenFactory.createView()
            }
            .onAppear {
                UINavigationBar.configureCurrent { item in
                    let appearance = UINavigationBarAppearance()

                    let textColor = ColorToken.textTetriary
                    appearance.backgroundColor = UIColor.with(token: .backgroundSecondary)
                    appearance.largeTitleTextAttributes = StringAttributes(.init(font: .titleBigger, color: textColor))
                    appearance.titleTextAttributes = StringAttributes(.init(font: .titleDefault, color: textColor))
                    let backImage = UIImage.with(token: .backButton).tintedWith(color: UIColor.with(token: textColor)).withRenderingMode(.alwaysOriginal)
                    appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
                    appearance.backButtonAppearance.normal.titleTextAttributes = [
                        .font: UIFont.systemFont(ofSize: 0),
                        .foregroundColor: UIColor.clear
                    ]

                    item.scrollEdgeAppearance = appearance
                    item.standardAppearance = appearance

                }
            }
        }
    }
}
