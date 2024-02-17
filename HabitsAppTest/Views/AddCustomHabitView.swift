//
//  AddCustomHabitView.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//

import SwiftUI

struct AddCustomHabitView: View {
    @ObservedObject var presenter: HabitsListViewModel
    @State private var customHabitName: String = ""
    @State private var startDate: Date = Date()
    
    var body: some View {
        VStack {
            TextField("Введите свое название привычки", text: $customHabitName)
                .padding()
            
            DatePicker("Выберите дату начала", selection: $startDate, displayedComponents: .date)
                .padding()
            
            Button("Добавить привычку") {
                if !customHabitName.isEmpty {
                    presenter.addNewHabit(name: customHabitName, type: .positive, startDate: startDate)
                }
            }
            .padding()
        }
        .padding()
    }
}

struct AddCustomHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomHabitView(presenter: HabitsListViewModel())
    }
}
