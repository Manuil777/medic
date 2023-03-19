//
//  Payment.swift
//  Medic
//
//  Created by bnkwsr4 on 10.03.2023.
//

import SwiftUI

struct Payment: View {
    @Binding var screen:String
    
    @State private var isRotating = 0.0
    @State var messege = "Связываемся с банком..."
    @State var payment = false
    var body: some View {
        VStack(spacing: 0) {
            Text("Оплата")
                .font(.custom("SFProDisplay-Semibold", size: 20))
                .padding(.top, 62)
            Spacer()
            if payment {
                Image("Image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 204)
                Text("Ваш заказ успешно оплачен!")
                    .font(.custom("SFProDisplay-Semibold", size: 20))
                    .foregroundColor(Color("green"))
                    .padding(.top, 30)
                Text("Вам осталось дождаться приезда медсестры и сдать анализы. До скорой встречи!")
                    .font(.custom("SFProDisplay-Regular", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("grayDark"))
                    .padding(.top, 10)
                    .padding(.horizontal, 42)
                HStack(spacing: 0) {
                    Text("Не забудьте ознакомиться с ")
                        .font(.custom("SFProDisplay-Regular", size: 14))
                        .foregroundColor(Color("grayDark"))
                    Button {
                        //
                    } label: {
                        HStack(spacing: 0) {
                            Image("Rules")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12.8)
                                .foregroundColor(Color("blueDark"))
                            Text(" правилами")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("blueDark"))
                        }
                    }
                }
                .padding(.top, 8)
                Button {
                    //
                } label: {
                    HStack(spacing: 0) {
                        Text("подготовки к сдаче анализов")
                            .font(.custom("SFProDisplay-Regular", size: 14))
                            .foregroundColor(Color("blueDark"))
                    }
                }
                Spacer()
                Button {
                    //
                } label: {
                    HStack {
                        Spacer()
                        Text("Чек покупки")
                            .font(.custom("SFProDisplay-Semibold", size: 17))
                            .foregroundColor(Color("blueDark"))
                            .padding(.vertical, 14)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-40)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("blueDark"), lineWidth: 1)
                    )
                }
                Button {
                    screen = "MainView"
                } label: {
                    Text("На главную")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color("blueDark"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.custom("SFProDisplay-Semibold", size: 17))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
                .padding(.top, 20)
            } else {
                Image("Load")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 66)
                    .rotationEffect(.degrees(isRotating))
                    .onAppear {
                        withAnimation(.linear(duration: 1)
                            .speed(1).repeatForever(autoreverses: false)) {
                                isRotating = 360.0
                            }
                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            messege = "Производим оплату..."
                            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                                payment = true
                            }
                        }
                    }
                Text(messege)
                    .font(.custom("SFProDisplay-Regular", size: 16))
                    .foregroundColor(Color("grayDark"))
                    .padding(.top, 26)
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
