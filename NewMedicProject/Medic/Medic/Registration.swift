//
//  Registration.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import SwiftUI

struct Registration: View {
    @Binding var screen: String
    @StateObject var viewModel = ViewModel()
    let screenSize = UIScreen.main.bounds
    @State var alert = false
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                Image("Hand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                Text("Добро пожаловать!")
                    .font(.custom("SFProDisplay-Heavy", size: 24))
                Spacer()
            }
            .padding(.top, 105)
            HStack {
                Text("Войдите, чтобы пользоваться функциями\nприложения")
                    .font(.custom("SFProDisplay-Regular", size: 15))
                    .padding(.top, 25)
                Spacer()
            }
            HStack {
                Text("Вход по E-mail")
                    .font(.custom("SFProDisplay-Regular", size: 14))
                    .foregroundColor(Color("PurpleDark"))
                Spacer()
            }
            .padding(.top, 64)
            TextField("example@mail.ru", text: $viewModel.email)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color.black.opacity(0.5))
                .keyboardType(.emailAddress)
                .padding(14)
                .background(Color("GrayLight"))
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Gray"), lineWidth: 1)
                }
                .padding(.top, 4)
            if viewModel.email == "" {
                Text("Далее")
                    .font(.custom("SFProDisplay-Semibold", size: 17))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: screenSize.width - 40)
                    .background(Color("PurpleLight"))
                    .cornerRadius(10)
                    .padding(.top, 32)
            } else {
                Button {
                    UserDefaults.standard.set(viewModel.email, forKey: "email")
                    viewModel.postSendCode {
                        screen = "Verification"
                    } error: {
                        alert = true
                    }
                } label: {
                    Text("Далее")
                        .font(.custom("SFProDisplay-Semibold", size: 17))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: screenSize.width - 40)
                        .background(Color("BlueDark"))
                        .cornerRadius(10)
                        .padding(.top, 32)
                }
            }
            Spacer()
            Text("Или войдите с помощью")
                .font(.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color("GrayDark"))
                .padding(.bottom)
            Button {
                //
            } label: {
                Text("Войти с Яндекс")
                    .font(.custom("SFProDisplay-Medium", size: 17))
                    .foregroundColor(.black)
                    .padding(18)
                    .frame(width: screenSize.width - 40)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Gray"), lineWidth: 1)
                    }
                    .padding(.bottom, 56)
            }
        }
        .padding(.horizontal, 20)
        .ignoresSafeArea()
        .ignoresSafeArea(.keyboard)
        .alert("\(viewModel.error1)", isPresented: $alert, actions: {
            //
        })
    }
}
