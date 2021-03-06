struct NavigationBarStyle {
    struct Appearance {
        var titleStyle: TextStyle
        var backgroundColor: ColorToken
        var backgroundEffect: BackgroundEffect?
        var hasShadow: Bool
        var backIndicatorImage: ImageToken

        init(
            titleStyle: TextStyle,
            backgroundColor: ColorToken,
            backgroundEffect: BackgroundEffect? = nil,
            hasShadow: Bool = true,
            backIndicatorImage: ImageToken = .backButton
        ) {
            self.titleStyle = titleStyle
            self.backgroundColor = backgroundColor
            self.backgroundEffect = backgroundEffect
            self.hasShadow = hasShadow
            self.backIndicatorImage = backIndicatorImage
        }
    }

    var scrollEdgeAppearance: Appearance?
    var standardAppearance: Appearance

    init(
        scrollEdgeAppearance: Appearance? = nil,
        standardAppearance: Appearance
    ) {
        self.scrollEdgeAppearance = scrollEdgeAppearance
        self.standardAppearance = standardAppearance
    }
}

extension NavigationBarStyle.Appearance {
    static func transparent(
        titleStyle: TextStyle,
        backIndicatorImage: ImageToken = .backButton
    ) -> Self {
        Self(
            titleStyle: titleStyle,
            backgroundColor: .clear,
            backgroundEffect: nil,
            hasShadow: false,
            backIndicatorImage: backIndicatorImage
        )
    }

    static func blurred(
        titleStyle: TextStyle,
        backIndicatorImage: ImageToken = .backButton
    ) -> Self {
        Self(
            titleStyle: titleStyle,
            backgroundColor: .clear,
            backgroundEffect: .systemMaterial,
            hasShadow: false,
            backIndicatorImage: backIndicatorImage
        )
    }
}

// MARK: - NavigationBarStyle + Presets

extension NavigationBarStyle {
    static func first() -> Self {
        .init(
            scrollEdgeAppearance: .transparent(
                titleStyle: TextStyle(font: .titleDefault, color: .textPrimary)
            ),
            standardAppearance: .blurred(
                titleStyle: TextStyle(font: .titleDefault, color: .textSecondary)
            )
        )
    }

    static func second() -> Self {
        .init(
            scrollEdgeAppearance: .init(
                titleStyle: TextStyle(font: .titleBigger, color: .textSecondary),
                backgroundColor: .backgroundSecondary,
                backgroundEffect: nil,
                hasShadow: true,
                backIndicatorImage: .backButton
            ),
            standardAppearance: .blurred(
                titleStyle: TextStyle(font: .titleBigger, color: .textTetriary)
            )
        )
    }

    static func third() -> Self {
        .init(
            scrollEdgeAppearance: .init(
                titleStyle: TextStyle(font: .titleBigger, color: .textTetriary),
                backgroundColor: .backgroundSecondary,
                backgroundEffect: nil,
                hasShadow: true,
                backIndicatorImage: .backButton
            ),
            standardAppearance: .blurred(
                titleStyle: TextStyle(font: .titleBigger, color: .textSecondary)
            )
        )
    }
}
