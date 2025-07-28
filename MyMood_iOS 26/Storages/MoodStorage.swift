import Combine
import Foundation


class MoodStorage: ObservableObject {
    @Published private(set) var moods: [MoodEntry] = []
    
    private let key = "savedMoods"
    
    init() {
        load()
    }
    
    func add(_ entry: MoodEntry) {
        moods.insert(entry, at: 0)
        save()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(moods) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key) {
            let saved = try? JSONDecoder().decode([MoodEntry].self, from: data)
            moods = saved ?? []
        }
    }
}
