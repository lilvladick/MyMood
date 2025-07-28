enum MoodLevel: Int, CaseIterable, Identifiable, Codable {
    case veryBad = 1
    case bad = 2
    case neutral = 3
    case good = 4
    case great = 5

    var id: Int { rawValue }

    var emoji: String {
        switch self {
        case .veryBad: return "😩"
        case .bad: return "😕"
        case .neutral: return "😐"
        case .good: return "🙂"
        case .great: return "😄"
        }
    }

    var description: String {
        switch self {
        case .veryBad: return "Terrible"
        case .bad: return "Bad"
        case .neutral: return "Okay"
        case .good: return "Good"
        case .great: return "Great"
        }
    }
}
