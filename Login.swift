//
//  Login.swift
//  Medic
//
//  Created by bnkwsr4 on 27.02.2023.
//

import SwiftUI

struct Login: View {
    @Binding var screen:String
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image("Hand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .padding(.trailing)
                Text("Добро пожаловать!")
                    .font(.custom("SFProDisplay-Heavy", size: 24))
                Spacer()
            }
            .padding(.top, 105)
            VStack(alignment: .leading) {
                Text("Войдите, чтобы пользоваться функциями")
                    .font(.custom("SFProDisplay-Regular", size: 15))
                Text("приложения")
                    .font(.custom("SFProDisplay-Regular", size: 15))
            }
            .padding(.top, 23)
            .offset(x: -40)
            HStack {
                Text("Вход по E-mail")
                    .foregroundColor(Color("purpleDark"))
                    .font(.custom("SFProDisplay-Regular", size: 14))
                    .padding(.bottom, 4)
                Spacer()
            }
            .padding(.top, 64)
            TextField("example@mail.ru", text: $viewModel.email)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .keyboardType(.emailAddress)
                .foregroundColor(Color.black.opacity(0.5))
                .padding(14)
                .background(Color("grayLight"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("gray"), lineWidth: 1))
                .padding(.bottom, 32)
            if viewModel.email == "" {
                Text("Далее")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color("purpleLight"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.custom("SFProDisplay-Semibold", size: 17))
            } else {
                Button {
                    UserDefaults.standard.set(viewModel.email, forKey: "email")
                    viewModel.postSendCode {
                        screen = "Autentification"
                    }
                } label: {
                    Text("Далее")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color("blueDark"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.custom("SFProDisplay-Semibold", size: 17))
                }
            }
            Spacer()
            Text("Или войдите с помощью")
                .padding(.bottom)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color("grayDark"))
            Button {
                //
            } label: {
                Text("Войти с Яндекс")
                    .padding(18)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("gray"), lineWidth: 1))
                    .foregroundColor(.black)
                    .font(.custom("SFProDisplay-Medium", size: 17))
            }
            .padding(.bottom, 56)
        }
        .padding(.horizontal, 20)
        .ignoresSafeArea()
        .ignoresSafeArea(.keyboard)
    }
}
