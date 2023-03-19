//
//  CreateCard.swift
//  Medic
//
//  Created by bnkwsr4 on 28.02.2023.
//

import SwiftUI

struct CreateCard: View {
    @StateObject var viewModel = ViewModel()
    
    @Binding var screen:String
    
    var placeholder = "Пол"
    var dropDounList = ["Мужской", "Женский"]
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Создание карты")
                    Text("пациента")
                }
                .font(.custom("SFProDisplay-Heavy", size: 24))
                Spacer()
                VStack {
                    Button {
                        UserDefaults.standard.set("", forKey: "firstname")
                        UserDefaults.standard.set("", forKey: "lastname")
                        UserDefaults.standard.set("", forKey: "middlename")
                        UserDefaults.standard.set("", forKey: "bith")
                        UserDefaults.standard.set("", forKey: "pol")
                        UserDefaults.standard.set("", forKey: "image")
                        screen = "MainView"
                        UserDefaults.standard.set(true, forKey: "create")
                    } label: {
                        Text("Пропустить")
                            .font(.custom("SFProDisplay-Regular", size: 15))
                            .foregroundColor(Color("blueDark"))
                    }
                    .padding(.top, 8)
                    Spacer()
                }
                .frame(height: 56)
            }
            .padding(.top, 76)
            .padding(.bottom, -8)
            HStack {
                Text("Без карты пациента вы не сможете заказать анализы.")
                Spacer()
            }
            .font(.custom("SFProDisplay-Regular", size: 14))
            .foregroundColor(Color("grayDark"))
            .padding(.bottom, -16)
            HStack {
                Text("В картах пациентов будут храниться результаты анализов вас и ваших близких.")
                Spacer()
            }
            .font(.custom("SFProDisplay-Regular", size: 14))
            .foregroundColor(Color("grayDark"))
            .padding(.bottom, 8)
            TextField("Имя", text: $viewModel.firstname)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .padding(14)
                .background(Color("grayLight"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.firstname.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
            TextField("Отчество", text: $viewModel.middlename)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .padding(14)
                .background(Color("grayLight"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.middlename.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
            TextField("Фамилия", text: $viewModel.lastname)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .padding(14)
                .background(Color("grayLight"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.lastname.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
            TextField("Дата рождения", text: $viewModel.bith)
                .font(.custom("SFProDisplay-Regular", size: 15))
                .padding(14)
                .background(Color("grayLight"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.bith.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
            Menu {
                ForEach(dropDounList, id: \.self) { client in
                    Button(client) {
                        viewModel.pol = client
                    }
                }
            } label: {
                VStack(spacing: 5) {
                    HStack {
                        Text(viewModel.pol.isEmpty ? placeholder : viewModel.pol)
                            .foregroundColor(viewModel.pol.isEmpty ? Color("grayTextField") : .black)
                            .font(.custom("SFProDisplay-Regular", size: 15))
                        Spacer()
                        Image("Chevron")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 6)
                    }
                    .padding(14)
                    .background(Color("grayLight"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.pol.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
                }
            }
            Spacer()
            if viewModel.firstname == "" || viewModel.middlename == "" || viewModel.lastname == "" || viewModel.bith == "" || viewModel.pol == "" {
                Text("Создать")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color("purpleLight"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.custom("SFProDisplay-Semibold", size: 17))
                    .padding(.bottom, 56)
            } else {
                Button {
                    viewModel.postCreateProfile {
                        UserDefaults.standard.set(viewModel.firstname, forKey: "firstname")
                        UserDefaults.standard.set(viewModel.lastname, forKey: "lastname")
                        UserDefaults.standard.set(viewModel.middlename, forKey: "middlename")
                        UserDefaults.standard.set(viewModel.bith, forKey: "bith")
                        UserDefaults.standard.set(viewModel.pol, forKey: "pol")
                        UserDefaults.standard.set(viewModel.image, forKey: "image")
                        screen = "MainView"
                        UserDefaults.standard.set(true, forKey: "create")
                    }
                } label: {
                    Text("Создать")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color("blueDark"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.custom("SFProDisplay-Semibold", size: 17))
                }
                .padding(.bottom, 56)
            }
        }
        .ignoresSafeArea()
        .foregroundColor(Color.black)
        .padding(.horizontal, 20)
    }
}
