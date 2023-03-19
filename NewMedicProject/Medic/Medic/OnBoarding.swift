//
//  OnBoarding.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import SwiftUI

struct BoardingCount {
    let tittle: String
    let description: String
    let image: String
}

private let BoardingStep = [
    BoardingCount(tittle: "Анализы", description: "Экспресс сбор и получение проб", image: "Image1"),
    BoardingCount(tittle: "Уведомления", description: "Вы быстро узнаете о результатах", image: "Image2"),
    BoardingCount(tittle: "Мониторинг", description: "Наши врачи всегда наблюдают\nза вашими показателями здоровья", image: "Image3")
]

struct OnBoarding: View {
    @Binding var screen: String
    @State private var steps = 0
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Button {
                            screen = "Registration"
                            UserDefaults.standard.set(true, forKey: "onboarding")
                        } label: {
                            Text(steps < BoardingStep.count - 1 ? "Пропустить" : "Завершить")
                                .font(.custom("Lato-Semibold", size: 20))
                                .foregroundColor(Color("BlueLight"))
                        }
                        Spacer()
                    }
                    Spacer()
                    Image("Plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 165)
                        .padding(.trailing, -20)
                }
                .frame(height: 165)
                ZStack {
                    TabView(selection: $steps) {
                        ForEach(0..<BoardingStep.count) { step in
                            VStack(spacing: 0) {
                                Text(BoardingStep[step].tittle)
                                    .padding(.top, 70)
                                    .font(.custom("Lato-Semibold", size: 20))
                                    .foregroundColor(Color("Green"))
                                Text(BoardingStep[step].description)
                                    .padding(.top, 30)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("SFProDisplay-Regular", size: 14))
                                    .foregroundColor(Color("GrayDark"))
                                Spacer()
                                if BoardingStep[step].image == "Image1" {
                                    Image(BoardingStep[step].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 50)
                                        .padding(.bottom, 25)
                                } else if BoardingStep[step].image == "Image2" {
                                    Image(BoardingStep[step].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.bottom, 30)
                                } else {
                                    Image(BoardingStep[step].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 5)
                                        .padding(.bottom, 15)
                                }
                            }
                            .tag(step)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.horizontal, -20)
                    HStack(spacing: 7) {
                        ForEach(0..<BoardingStep.count) { step in
                            if steps == step {
                                Circle()
                                    .foregroundColor(Color("BlueLight"))
                                    .frame(width: 12.6)
                            } else {
                                Circle()
                                    .strokeBorder(Color("BlueLight"),lineWidth: 0.8)
                                    .background(Circle().foregroundColor(Color.white))
                                    .frame(width: 14.3)
                            }
                        }
                    }
                    .offset(y: -80)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
