//
//  Zastavka.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import SwiftUI

struct Zastavka: View {
    //@StateObject var viewModel = ViewModel()
    @StateObject var connect = NetworkManager()
    @Binding var screen: String
    let screenSize = UIScreen.main.bounds
    @State var alert = false
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenSize.width, height: screenSize.height)
            Image("LOGO")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenSize.width - 112)
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                if (connect.isConnectOn) {
                    if UserDefaults.standard.bool(forKey: "onboarding") {
                        if UserDefaults.standard.bool(forKey: "login") {
                            if UserDefaults.standard.bool(forKey: "password") {
                                if UserDefaults.standard.bool(forKey: "skipcard") || UserDefaults.standard.bool(forKey: "card") {
                                    screen = "MainScreen"
                                } else {
                                    screen = "Card"
                                }
                            } else {
                                screen = "Password"
                            }
                        } else {
                            screen = "Registration"
                        }
                    } else {
                        screen = "OnBoarding"
                    }
                } else {
                    alert = true
                }
            }
            
//            do {
//                let dispatch = UserDefaults.standard.data(forKey: "catalogs")
//                debugPrint(dispatch)
//                let dispatcher = try JSONDecoder().decode([viewModel.Catalog].self, from: dispatch ?? Data())
//                viewModel.catalog = dispatcher
//            } catch {
//                debugPrint(error.localizedDescription)
//                if (connectOn.isConnectOn) {
//
//                }
//            }
        }
//        .alert("sss", isPresented: $alert) {
            .alert(isPresented: $alert) {
                Alert(
                    title: Text("Ошибка"),
                    message: Text("Нет подключения к интернету"),
                    primaryButton: .default(
                        Text("Обновить"),
                        action: reset
                    ),
                    secondaryButton: .destructive(
                        Text("Выйти"),
                        action: exite
                    )
                )
            }
//        }
    }
    func reset() {
        screen = "Reset"
    }
    func exite() {
        exit(1)
    }
}
