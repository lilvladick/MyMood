import SwiftUI

struct NewMoodFormView: View {
    @EnvironmentObject var moodStorage: MoodStorage
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var mood: MoodLevel = .neutral
    @State private var sliderValue: Double = 3

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Ttile")) {
                    TextField("How do you feel?", text: $title)
                }
                Section(header: Text("Mood")) {
                    VStack(spacing: 12) {
                        Text(mood.emoji)
                            .font(.system(size: 50))
                            .transition(.scale)
                            .animation(.easeInOut(duration: 0.25), value: mood)

                        Text(mood.description)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .animation(.easeInOut(duration: 0.25), value: mood)

                        Slider(value: $sliderValue, in: 1...5)
                            .tint(.accentColor)
                            .onChange(of: sliderValue) { _, newValue in
                                if let newMood = MoodLevel(rawValue: Int(newValue.rounded())) {
                                    withAnimation {
                                        mood = newMood
                                    }
                                }
                            }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section(header: Text("Details")) {
                    TextEditor(text: $details)
                        .frame(height: 100)
                        .padding(.vertical, 4)
                }

                Section {
                    Button {
                        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {return}
                        let entry = MoodEntry(title: title, details: details, mood: mood)
                        moodStorage.add(entry)
                        
                        dismiss()
                    } label: {
                        Label("Save Mood", systemImage: "checkmark.circle")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("New Mood")
        }
    }
}
