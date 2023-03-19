//
//  Zastavka.swift
//  Medic
//
//  Created by bnkwsr4 on 22.02.2023.
//

import SwiftUI

struct Zastavka: View {
    @Binding var screen:String
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width-112)
                .offset(y: -35)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                if UserDefaults.standard.bool(forKey: "onboarding") == true {
                    if UserDefaults.standard.bool(forKey: "login") == true {
                        if UserDefaults.standard.bool(forKey: "create") == true {
                            screen = "MainView"
                        } else {
                            screen = "CreatePassword"
                        }
                    } else {
                        screen = "Login"
                    }
                } else {
                    screen = "Onboarding"
                }
            }
        }
    }
}
