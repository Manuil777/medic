//
//  CreatePassword.swift
//  Medic
//
//  Created by bnkwsr4 on 27.02.2023.
//

import SwiftUI

struct CreatePassword: View {
    @Binding var screen:String
    @State var count = 0
    @State var pin = ""
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    screen = "CreateCard"
                } label: {
                    Text("Пропустить")
                        .font(.custom("SFProDisplay-Regular", size: 15))
                        .foregroundColor(Color("blueDark"))
                }
            .padding(.top, 84)
            .padding(.trailing, 20)
            }
            Spacer()
            Text("Создайте пароль")
                .font(.custom("SFProDisplay-Heavy", size: 24))
                .padding(.bottom)
            Text("Для защиты ваших персональных данных")
                .font(.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color("grayDark"))
                .padding(.bottom, 56)
            HStack {
                if count > 0 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("blueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("blueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
                if count > 1 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("blueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("blueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
                if count > 2 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("blueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("blueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
                if count > 3 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("blueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("blueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
            }
            .animation(.linear(duration: 0.2))
            .frame(height: 16)
            .padding(.bottom, 60)
            VStack(spacing: 24) {
                HStack(spacing: 24) {
                    NumBut(num: "1", count: $count, pin: $pin, screen: $screen)
                    NumBut(num: "2", count: $count, pin: $pin, screen: $screen)
                    NumBut(num: "3", count: $count, pin: $pin, screen: $screen)
                }
                HStack(spacing: 24) {
                    NumBut(num: "4", count: $count, pin: $pin, screen: $screen)
                    NumBut(num: "5", count: $count, pin: $pin, screen: $screen)
                    NumBut(num: "6", count: $count, pin: $pin, screen: $screen)
                }
                HStack(spacing: 24) {
                    NumBut(num: "7", count: $count, pin: $pin, screen: $screen)
                    NumBut(num: "8", count: $count, pin: $pin, screen: $screen)
                    NumBut(num: "9", count: $count, pin: $pin, screen: $screen)
                }
                HStack(spacing: 24) {
                    Spacer()
                    NumBut(num: "0", count: $count, pin: $pin, screen: $screen)
                    Button {
                        if count > 0 {
                            count -= 1
                            pin.remove(at: pin.index(before: pin.endIndex))
                        }
                    } label: {
                        Image("Del")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .frame(width: 80, height: 80)
                            .clipShape(
                                Circle()
                            )
                    }
                }
            }
            .frame(width: 288)
            .padding(.bottom, 80)
        }
        .ignoresSafeArea()
    }
}

struct NumBut: View {
    var num: String
    @Binding var count: Int
    @Binding var pin: String
    @Binding var screen:String
    var body: some View {
        Button {
            if count < 4 {
                count += 1
                pin += String(num)
                if count == 4 {
                    screen = "CreateCard"
                    UserDefaults.standard.set(pin, forKey: "pin")
                }
            }
        } label: {
            Text(num)
                .font(.custom("SFProDisplay-Semibold", size: 24))
                .foregroundColor(.black)
                .frame(width: 80, height: 80)
                .background(Color("grayLight"))
                .clipShape(
                    Circle()
                )
        }
    }
}
