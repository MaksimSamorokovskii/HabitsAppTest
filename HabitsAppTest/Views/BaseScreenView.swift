//
//  BaseScreenView.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 30.01.2024.
//


import SwiftUI

struct BaseScreenView: View {
    
    @State var showScreenHabitsList = false
    @State var showScreenMyAccount = false
    @State var showScreenSettings = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("badHabits")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                    .cornerRadius(20)
                Spacer()
                
                // Добавлен ZStack
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(Color.blue.opacity(0.9))
                    
                    HStack(spacing: 110) {
                        // Первая кнопка для перехода на экран HabitsListView
                        Button {
                            self.showScreenHabitsList.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .fullScreenCover(isPresented: $showScreenHabitsList) {
                            HabitsListView(presenter: HabitsListViewModel(), selectedHabit: .constant(nil))
                        }
                        
                        // Вторая кнопка для перехода на экран MyAccountView
                        Button {
                            self.showScreenMyAccount.toggle()
                        } label: {
                            Image(systemName: "person")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .fullScreenCover(isPresented: $showScreenMyAccount) {
                            MyAccountView()
                        }
                        
                        // Третья кнопка для перехода на экран SettingsView
                        Button {
                            self.showScreenSettings.toggle()
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .fullScreenCover(isPresented: $showScreenSettings) {
                            SettingsView()
                        }
                    }
                }
            }
        }
    }
}

struct BaseScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BaseScreenView()
    }
}
