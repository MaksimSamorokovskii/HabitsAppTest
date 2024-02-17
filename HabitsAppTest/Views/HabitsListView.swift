//
//  HabitsListView.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

struct HabitsListView: View {
    
    @ObservedObject var presenter: HabitsListViewModel
    @Binding var selectedHabit: HabitModel?
    
    var body: some View {
        List(presenter.habitNames(), id: \.self) { habitName in
            Text(habitName)
                .onTapGesture {
                    if let habit = presenter.habits.first(where: { $0.name == habitName }) {
                        selectedHabit = habit
                    }
                }
        }
        .sheet(item: $selectedHabit) { habit in
            HabitDetailsView(presenter: HabitDetailsViewModel(habit: habit))
        }
    }
}

struct HabitsListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsListView(presenter: HabitsListViewModel(), selectedHabit: .constant(nil))
    }
}

