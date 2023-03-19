//
//  Verification.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import SwiftUI
import CITPincode

struct Verification: View {
    @Binding var screen: String
    @StateObject var viewModel = ViewModel()
    @State private var forceCooldownonce = true
    @State var time = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var alert = false
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    screen = "Registration"
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("GrayLight"))
                        Image("Back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                }
                .padding(.top, 68)
                Spacer()
            }
            Spacer()
            Text("Введите код из E-mail")
                .font(.custom("SFProDisplay-Semibold", size: 17))
            HStack(alignment: .center) {
                CITPincodeView(code: $viewModel.code, forceCooldownOnce: $forceCooldownonce, config: .init(codeLength: 4, font: .custom("SFProDisplay-Regular", size: 20), textColor: .black, backgroundColor: Color("GrayLight"), selectedBorderColor: Color("Gray"), selectedBorderWidth: 1, alwaysShowSelectedBorder: true, cellSize: CGSize(width: 48, height: 48), cellCornerRadius: 10, keyboardType: .numberPad), onEnteredCode: SendCode, onResendCode: SendCode)
            }
            .padding(.top, 24)
            Text("Отправить код повторно можно\nбудет через \(time) секунд")
                .font(.custom("SFProDisplay-Regular", size: 15))
                .multilineTextAlignment(.center)
                .padding(.top)
                .onReceive(timer) { _ in
                    if time > 0 {
                        time -= 1
                    } else {
                        viewModel.postSendCode {
                            time = 60
                        } error: {
                            alert = true
                        }
                        
                    }
                }
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 20)
        .ignoresSafeArea()
        .ignoresSafeArea(.keyboard)
        .alert("\(viewModel.error1)", isPresented: $alert, actions: {
            //
        })
    }
    private func SendCode() {
        viewModel.postSignIn {
            screen = "Password"
            UserDefaults.standard.set(true, forKey: "login")
        } error: {
            alert = true
        }
    }
}
