//
//  HabitDetailsViewModel.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

class HabitDetailsViewModel: ObservableObject {
    @Published var habit: HabitModel
    @Published var startDate: Date = Date()
    
    init(habit: HabitModel) {
        self.habit = habit
    }
    
    func startHabit() {
        // Реализовать логику для начала привычки и отслеживания прогресса
    }
}
