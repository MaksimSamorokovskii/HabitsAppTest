//
//  HabitDetailsView.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

struct HabitDetailsView: View {
    @ObservedObject var presenter: HabitDetailsViewModel
    
    var body: some View {
        VStack {
            Text(presenter.habit.name)
            
            DatePicker("Выберите дату начала", selection: $presenter.startDate, displayedComponents: .date)
            
            Button("Начать привычку") {
                presenter.startHabit()
            }
        }
        .padding()
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailsView(presenter: HabitDetailsViewModel(habit: HabitModel(name: "Smoking", type: .negative, progress: .init(startDate: .now, status: ""))))
    }
}
