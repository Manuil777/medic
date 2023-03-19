//
//  Password.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import SwiftUI

struct Password: View {
    @Binding var screen: String
    @State var pressing = false
    @State var count = 0
    @State private var pin = ""
    @State private var num = ""
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    screen = "Card"
                } label: {
                    Text("Пропустить")
                        .font(.custom("SFProDisplay-Regular", size: 15))
                        .foregroundColor(Color("BlueDark"))
                }
            }
            .padding(.top, 84)
            Text("Создайте пароль")
                .font(.custom("SFProDisplay-Heavy", size: 24))
                .padding(.top, 40)
            Text("Для защиты ваших персональных данных")
                .font(.custom("SFProDisplay-Regular", size: 15))
                .foregroundColor(Color("GrayDark"))
                .padding(.top)
            Spacer()
            HStack {
                if count > 0 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("BlueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("BlueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
                if count > 1 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("BlueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("BlueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
                if count > 2 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("BlueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("BlueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
                if count > 3 {
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(Color("BlueDark"))
                } else {
                    Circle()
                        .strokeBorder(Color("BlueDark"),lineWidth: 0.8)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 16)
                }
            }
            Spacer()
            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "1"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("1")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "2"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("2")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "3"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("3")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "4"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("4")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "5"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("5")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "6"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("6")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "7"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("7")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "8"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("8")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "9"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                        
                    } label: {
                        Text("9")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                }
                HStack {
                    Spacer()
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.white.opacity(0))
                    Spacer()
                    Button {
                        if count < 4 {
                            count += 1
                            pin += "0"
                            if count == 4 {
                                screen = "Card"
                                UserDefaults.standard.set(pin, forKey: "pin")
                                UserDefaults.standard.set(true, forKey: "password")
                            }
                        }
                    } label: {
                        Text("0")
                            .font(.custom("SFProDisplay-Semibold", size: 24))
                            
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                    Button {
                        if count > 0 {
                            count -= 1
                            pin.remove(at: pin.index(before: pin.endIndex))
                        }
                    } label: {
                        Image("Delete")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
            }
            .padding(.bottom, 80)
        }
        .padding(.horizontal, 20)
        .ignoresSafeArea()
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 80, height: 80)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .background(configuration.isPressed ? Color("BlueDark") : Color("GrayLight"))
            .clipShape(Circle())
    }
}
