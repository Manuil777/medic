//
//  ContentView.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "Zastavka"
    var body: some View {
        if screen == "Reset" {
            Reset(screen: $screen)
        } else if screen == "Zastavka" {
            Zastavka(screen: $screen)
        } else if screen == "OnBoarding" {
            OnBoarding(screen: $screen)
        } else if screen == "Registration" {
            Registration(screen: $screen)
        } else if screen == "Verification" {
            Verification(screen: $screen)
        } else if screen == "Password" {
            Password(screen: $screen)
        } else if screen == "Card" {
            Card(screen: $screen)
        } else if screen == "MainScreen" {
            MainScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
