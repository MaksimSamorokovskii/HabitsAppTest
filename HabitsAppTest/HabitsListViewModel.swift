//
//  HabitsListViewModel.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

class HabitsListViewModel: ObservableObject {
    @Published var habits: [HabitModel]
    
    init() {
        self.habits = DataManager.shared.loadHabits()
    }
    
    // Передаем список привычек
    func habitNames() -> [String] {
        return DataManager.habitNames()
    }

    // Добавление новой привычки
    func addNewHabit(name: String, type: HabitType, startDate: Date) {
        let newHabit = HabitModel(name: name, type: type, progress: ProgressModel(startDate: startDate, status: "Not Started"))
        habits.append(newHabit)
        saveHabits()
    }

    // Добавление существующей привычки
    func addHabit(_ habit: HabitModel) {
        habits.append(habit)
        saveHabits()
    }

    // Сохранение привычек в UserDefaults
    private func saveHabits() {
        DataManager.shared.saveHabits(habits)
    }
}
