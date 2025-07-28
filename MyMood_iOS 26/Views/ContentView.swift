//
//  ContentView.swift
//  MyMood_iOS 26
//
//  Created by Владислав Кириллов on 26.07.2025.
//

import SwiftUI

enum Tabs {
    case mood, stats, newmood
}

struct ContentView: View {
    @State var selectedTabs: Tabs = .mood
    @State var isShowNewMood: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTabs) {
            Tab("All Moods", systemImage: "eyes", value: .mood) {
                AllMoodsView()
            }
            Tab("Stats", systemImage: "chart.line.uptrend.xyaxis", value: .stats) {
                Color.gray.ignoresSafeArea()
            }
            
            Tab("New Mood", systemImage: "plus", value: .newmood, role: .search) {
                Color.clear
            }
        }
        .onChange(of: selectedTabs) { oldvalue, value in
            if value == .newmood {
                isShowNewMood = true
                selectedTabs = .mood
            }
        }
        .sheet(isPresented: $isShowNewMood) {
            NewMoodFormView()
                .presentationDetents([.large])
        }
    }
}

#Preview {
    ContentView()
}
