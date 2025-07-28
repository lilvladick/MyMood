import Foundation

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let title: String
    let details: String
    let mood: MoodLevel
    let date: Date
    
    init(title: String, details: String, mood: MoodLevel, date: Date = Date()) {
        self.id = UUID()
        self.title = title
        self.details = details
        self.mood = mood
        self.date = date
    }
}
