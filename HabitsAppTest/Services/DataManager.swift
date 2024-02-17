//
//  DataManager.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    static func habitNames() -> [String] {
        return ["Собственная Привычка", "Курение", "Алкоголь", "Фастфуд", "Соцсети", "Мат", "Сахар"]
    }
    
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    func saveHabits(_ habits: [HabitModel]) {
        if let encodeData = try? JSONEncoder().encode(habits) {
            userDefaults.set(encodeData, forKey: "habits")
        }
    }
    
    func loadHabits() -> [HabitModel] {
        if let data = userDefaults.data(forKey: "habits"),
           let habits = try? JSONDecoder().decode([HabitModel].self, from: data) {
            return habits
        }
        return []
    }
}
