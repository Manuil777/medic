//
//  Onboarding.swift
//  Medic
//
//  Created by bnkwsr4 on 27.02.2023.
//

import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnboardingStep(image: "Image1", title: "Анализы", description: "Экспресс сбор и получение проб"),
    OnboardingStep(image: "Image2", title: "Уведомления", description: "Вы быстро узнаете о результатах"),
    OnboardingStep(image: "Image3", title: "Мониторинг", description: "Наши врачи всегда наблюдают за вашими показателями здоровья")
]

struct Onboarding: View {
    @Binding var screen:String
    @State private var currentStep = 0
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack {
                        Button {
                            screen = "Login"
                            UserDefaults.standard.set(true, forKey: "onboarding")
                        } label: {
                            Text(currentStep < onBoardingSteps.count - 1 ? "Пропустить" : "Завершить")
                                .font(.custom("Lato-Semibold", size: 20))
                                .foregroundColor(Color("blue"))
                        }
                        .padding(.leading, 30)
                        Spacer()
                    }
                    Spacer()
                    Image("plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 167)
                }
                .frame(height: 167)
                .padding(.top, 50)
                ZStack {
                    TabView(selection: $currentStep) {
                        ForEach(0..<onBoardingSteps.count) { step in
                            VStack(spacing: 0) {
                                VStack(spacing: 0) {
                                    Text(onBoardingSteps[step].title)
                                        .font(.custom("Lato-Semibold", size: 20))
                                        .foregroundColor(Color("green"))
                                        .padding(.top, 60)
                                    Text(onBoardingSteps[step].description)
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("grayDark"))
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 30)
                                    
                                }
                                Spacer()
                                if onBoardingSteps[step].image == "Image1" {
                                    Image(onBoardingSteps[step].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 204)
                                        .padding(.bottom, 85)
                                } else if onBoardingSteps[step].image == "Image2" {
                                    Image(onBoardingSteps[step].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 366)
                                        .padding(.bottom, 70)
                                } else {
                                    Image(onBoardingSteps[step].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 360)
                                        .padding(.bottom, 54)
                                }
                            }
                            .tag(step)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    HStack {
                        ForEach(0..<onBoardingSteps.count) { step in
                            if step == currentStep {
                                Circle()
                                    .frame(width: 12.61)
                                    .foregroundColor(Color("blue"))
                            } else {
                                Circle()
                                    .strokeBorder(Color("blue"),lineWidth: 0.8)
                                    .background(Circle().foregroundColor(Color.white))
                                    .frame(width: 14.3)
                            }
                        }
                    }
                    .offset(y: -80)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}
