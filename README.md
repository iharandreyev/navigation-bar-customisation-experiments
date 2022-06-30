# Problem

Need to implement a navigation bar styling solution, which would be applicable to both UIKit and SwiftUI via framework-specific extensions.
Each view controlle/view in the navigation stack should have it's own back button appearance (image and image color), title appearance (title, title color and title font), background appearance (background color and/or optional blur effect) and an arbitrary number of right button items.

# Issues

I'm just beginning experimenting with the SwiftUI framework, but there are two things I can't get the proper way to customise navigation.

In UIKit, we have navigationItem property for every view controller. Through it, we can customise navigation bar extensively enough, without accessing UINavigationBar instance. This gives us consistent experience with zero headaches. But I can't find anything like that in SwiftUI. People propose updating UINavigationBar.appearance() proxy, but then I need some sort of mechanism to revert the changes every time. And it's way too easy to break things. Not an option. Another way proposed in the web is to wrap NavigationView and NavigationLink into custom views, but then we loose scrollEdgeAppearance functionality, which is a requirement by my current project. So, no luck here as well. Not sure if wrapping SwiftUI into UIKit view controller is a good idea as well. Need your thoughts. 

Another thing is navigation flexibility. In UIKit, we could use delegation pattern to present any kind of view controller by using an abstract interface (ultimate implementation of such an approach is the Coordinator pattern). But in SwiftUI we need to embed concrete view types. Yes, we can use `AnyView` wrapper, but this comes at a performance hit, and I can't get my head around building proper architecture around such a solution. So again, need your thoughts. 

# Investigations

After some investigation I've discovered that even with `UINavigationBar.appearance()` proxy the looks of the navigation bar can be customised only once. 