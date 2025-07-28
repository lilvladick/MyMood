import SwiftUI

@main
struct MyMood_iOS_26App: App {
    @State var moodStorage = MoodStorage()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(moodStorage)
        }
    }
}
