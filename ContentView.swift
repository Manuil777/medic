//
//  ContentView.swift
//  Medic
//
//  Created by bnkwsr4 on 22.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "Zastavka"
    var body: some View {
        if screen == "Zastavka" {
            Zastavka(screen: $screen)
        }
        else if screen == "Onboarding" {
            Onboarding(screen: $screen)
        }
        else if screen == "Login" {
            Login(screen: $screen)
        }
        else if screen == "Autentification" {
            Autentification(screen: $screen)
        }
        else if screen == "CreatePassword" {
            CreatePassword(screen: $screen)
        }
        else if screen == "CreateCard" {
            CreateCard(screen: $screen)
        }
        else if screen == "MainView" {
            MainView(screen: $screen)
        }
        else if screen == "Payment" {
            Payment(screen: $screen)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
