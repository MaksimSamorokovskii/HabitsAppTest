//
//  MyAccountView.swift
//  HabitsAppTest
//
//  Created by Максим Самороковский on 02.02.2024.
//

import SwiftUI

struct MyAccountView: View {
    var body: some View {
        VStack {
            Text("My Account")
                .font(.largeTitle)
                .bold()
        }
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
