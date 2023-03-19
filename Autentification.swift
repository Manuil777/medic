//
//  Autentification.swift
//  Medic
//
//  Created by bnkwsr4 on 27.02.2023.
//

import SwiftUI
import CITPincode

struct Autentification: View {
    @Binding var screen:String
    @State private var code = ""
    @State private var code2 = ""
    @State private var code3 = ""
    @State private var code4 = ""
    @State private var forceCooldownonce = true
    @State var timeRemaining = 60
    @StateObject var viewModel = ViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button  {
                    screen = "Login"
                } label: {
                    Image("Exit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .padding(6)
                        .background(Color("grayLight"))
                        .cornerRadius(8)
                }
                .padding(.leading, 20)
                .padding(.top, 68)
                Spacer()
            }
            Spacer()
            Text("Введите код из E-mail")
                .font(.custom("SFProDisplay-Semibold", size: 17))
                .padding(.bottom, 24)
            HStack(alignment: .center){
                CITPincodeView(code: $code, forceCooldownOnce: $forceCooldownonce, config: .init(codeLength: 4, font: .custom("SFProDisplay-Regular", size: 20), textColor: .black, backgroundColor: Color("grayLight"), selectedBorderColor: Color("gray"), selectedBorderWidth: 1, alwaysShowSelectedBorder: true, cellSize: CGSize(width: 48, height: 48), cellCornerRadius: 10, keyboardType: .numberPad), onEnteredCode: sendCode, onResendCode: sendCode)
            }
            Text("Отправить код повторно можно будет через \(timeRemaining) секунд")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        viewModel.postSendCode {
                            timeRemaining = 60
                        }
                    }
                }
                .multilineTextAlignment(.center)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color("grayDark"))
                .frame(width: 242)
                .padding(.top)
            Spacer()
            Spacer()
        }
        .ignoresSafeArea()
        .ignoresSafeArea(.keyboard)
    }
    private func sendCode() {
        screen = "CreatePassword"
        UserDefaults.standard.set(true, forKey: "login")
    }
}
