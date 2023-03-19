//
//  Card.swift
//  Medic
//
//  Created by bnkwsr4 on 15.03.2023.
//

import SwiftUI

struct Card: View {
    @Binding var screen: String
    @StateObject var viewModel = ViewModel()
    var dropDounList = ["Мужской", "Женский"]
    let screenSize = UIScreen.main.bounds
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Создание карты\nпациента")
                    .font(.custom("SFProDisplay-Heavy", size: 24))
                Spacer()
                Button {
                    screen = "MainScreen"
                    UserDefaults.standard.set(true, forKey: "skipcard")
                } label: {
                    Text("Пропустить")
                        .font(.custom("SFProDisplay-Regular", size: 15))
                        .foregroundColor(Color("BlueDark"))
                }
            }
            .padding(.top, 76)
            HStack {
                Text("Без карты пациента вы не сможете заказать анализы.")
                    .font(.custom("SFProDisplay-Regular", size: 14))
                    .foregroundColor(Color("GrayDark"))
                Spacer()
            }
            .padding(.top)
            HStack {
                Text("В картах пациентов будут храниться результаты анализов вас и ваших близких.")
                    .font(.custom("SFProDisplay-Regular", size: 14))
                    .foregroundColor(Color("GrayDark"))
                Spacer()
            }
            .padding(.top, 8)
            VStack(spacing: 24) {
                TextField("Имя", text: $viewModel.firstname)
                    .font(.custom("SFProDisplay-Regular", size: 15))
                    .foregroundColor(.black)
                    .padding(14)
                    .background(Color("GrayLight"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.firstname == "" ? Color("Gray") : Color("Gray2"))
                    }
                TextField("Отчество", text: $viewModel.middlename)
                    .font(.custom("SFProDisplay-Regular", size: 15))
                    .foregroundColor(.black)
                    .padding(14)
                    .background(Color("GrayLight"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.middlename == "" ? Color("Gray") : Color("Gray2"))
                    }
                TextField("Фамилия", text: $viewModel.lastname)
                    .font(.custom("SFProDisplay-Regular", size: 15))
                    .foregroundColor(.black)
                    .padding(14)
                    .background(Color("GrayLight"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.lastname == "" ? Color("Gray") : Color("Gray2"))
                    }
                TextField("Дата рождения", text: $viewModel.bith)
                    .font(.custom("SFProDisplay-Regular", size: 15))
                    .foregroundColor(.black)
                    .padding(14)
                    .background(Color("GrayLight"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.bith == "" ? Color("Gray") : Color("Gray2"))
                    }
                Menu {
                    ForEach(dropDounList, id: \.self) { pol in
                        Button(pol) {
                            viewModel.pol = pol
                        }
                    }
                } label: {
                    HStack {
                        Text(viewModel.pol.isEmpty ? "Пол" : viewModel.pol)
                            .font(.custom("SFProDisplay-Regular", size: 16))
                            .foregroundColor(viewModel.pol.isEmpty ? Color("Gray3") : .black)
                        Spacer()
                        Image("DropDown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    .padding(14)
                    .background(Color("GrayLight"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.pol.isEmpty ? Color("Gray") : Color("Gray2"))
                    }
                }
            }
            .padding(.top, 32)
            .padding(.bottom, 48)
            if viewModel.firstname.isEmpty || viewModel.middlename.isEmpty || viewModel.lastname.isEmpty || viewModel.bith.isEmpty || viewModel.pol.isEmpty {
                Text("Создать")
                    .font(.custom("SFProDisplay-Semibold", size: 17))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: screenSize.width - 40)
                    .background(Color("PurpleLight"))
                    .cornerRadius(10)
            } else {
                Button {
                    screen = "MainScreen"
                    UserDefaults.standard.set(true, forKey: "card")
                    
                    UserDefaults.standard.set(viewModel.firstname, forKey: "name")
                    UserDefaults.standard.set(viewModel.middlename, forKey: "middlename")
                    UserDefaults.standard.set(viewModel.lastname, forKey: "lastname")
                    UserDefaults.standard.set(viewModel.bith, forKey: "bith")
                    UserDefaults.standard.set(viewModel.pol, forKey: "pol")
                } label: {
                    Text("Создать")
                        .font(.custom("SFProDisplay-Semibold", size: 17))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: screenSize.width - 40)
                        .background(Color("BlueDark"))
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .ignoresSafeArea(.keyboard)
        .ignoresSafeArea()
    }
}
