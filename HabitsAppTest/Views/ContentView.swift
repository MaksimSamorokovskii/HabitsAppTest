//
//  ContentView.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitsListPresenter = HabitsListViewModel()
    @State private var selectedHabit: HabitModel?

    var body: some View {
        NavigationView {
            HabitsListView(presenter: habitsListPresenter, selectedHabit: $selectedHabit)
                .navigationTitle("Выберите привычки ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

