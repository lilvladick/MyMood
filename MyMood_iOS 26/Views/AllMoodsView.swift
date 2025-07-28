import SwiftUI

struct AllMoodsView: View {
    @EnvironmentObject var moodStorage: MoodStorage
    
    var body: some View {
        List(moodStorage.moods) {entry in
            HStack {
                Text(entry.mood.emoji).font(.largeTitle)
                VStack(alignment: .leading) {
                    Text(entry.title).bold()
                    Text(entry.date, style: .date).font(.footnote).foregroundStyle(.secondary)
                }
            }
        }
    }
}
