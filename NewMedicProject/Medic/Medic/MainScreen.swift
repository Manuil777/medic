//
//  MainScreen.swift
//  Medic
//
//  Created by bnkwsr4 on 15.03.2023.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel = ViewModel()
    var dropDounList = ["Мужской", "Женский"]
    @State var tabScreen = "Анализы"
    let screenSize = UIScreen.main.bounds
    @State var search = ""
    @State var category = "Популярные"
    var body: some View {
        ZStack {
            if tabScreen == "Анализы" {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image("Search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.leading, 14)
                        TextField("Искать анализы", text: $search)
                            .padding(14)
                            .padding(.leading, -6)
                    }
                    .background(Color("GrayLight"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Gray"))
                    }
                    .padding(.top, 68)
                    .padding(.horizontal, 20)
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            HStack {
                                Text("Акции и новости")
                                    .font(.custom("SFProDisplay-Semibold", size: 17))
                                    .foregroundColor(Color("GrayDark"))
                                Spacer()
                            }
                            .padding(.top)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(viewModel.news, id: \.id) { news in
                                        Button {
                                            //
                                        } label: {
                                            ZStack {
                                                AsyncImage(url: URL(string: news.image.replacingOccurrences(of: " ", with: "%20"))) { images in images
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .offset(x: 67)
                                                } placeholder: {}
                                                VStack(spacing: 0) {
                                                    HStack {
                                                        Text(news.name)
                                                            .multilineTextAlignment(.leading)
                                                            .font(.custom("SFProDisplay-Heavy", size: 20))
                                                            .padding(.trailing, 35)
                                                        Spacer()
                                                    }
                                                    Spacer()
                                                    HStack {
                                                        Text(news.description)
                                                            .multilineTextAlignment(.leading)
                                                            .font(.custom("SFProDisplay-Regular", size: 14))
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Text("\(news.price) ₽ ")
                                                            .multilineTextAlignment(.leading)
                                                            .font(.custom("SFProDisplay-Heavy", size: 20))
                                                        Spacer()
                                                    }
                                                }
                                                .foregroundColor(.white)
                                                .padding()
                                            }
                                            .frame(width: 270, height: 152)
                                            .background(LinearGradient(colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.3)], startPoint: .leading, endPoint: .trailing))
                                            .cornerRadius(10)
                                            .padding(.trailing)
                                        }
                                    }
                                }
                                .padding(.leading, 20)
                            }
                            .padding(.horizontal, -20)
                            .padding(.top, 8)
                            HStack {
                                Text("Каталог анализов")
                                    .font(.custom("SFProDisplay-Semibold", size: 17))
                                    .foregroundColor(Color("GrayDark"))
                                Spacer()
                            }
                            .padding(.top, 32)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    Button {
                                        category = "Популярные"
                                    } label: {
                                        Text("Популярные")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 14)
                                            .font(.custom("SFProDisplay-Medium", size: 15))
                                            .foregroundColor(category == "Популярные" ? .white : Color("PurpleDark"))
                                            .background(category == "Популярные" ? Color("BlueDark") : Color("GrayLight"))
                                            .cornerRadius(10)
                                    }
                                    .padding(.leading, 20)
                                    Button {
                                        category = "COVID"
                                    } label: {
                                        Text("COVID")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 14)
                                            .font(.custom("SFProDisplay-Medium", size: 15))
                                            .foregroundColor(category == "COVID" ? .white : Color("PurpleDark"))
                                            .background(category == "COVID" ? Color("BlueDark") : Color("GrayLight"))
                                            .cornerRadius(10)
                                    }
                                    .padding(.leading)
                                    Button {
                                        category = "Онкогенетические"
                                    } label: {
                                        Text("Онкогенетические")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 14)
                                            .font(.custom("SFProDisplay-Medium", size: 15))
                                            .foregroundColor(category == "Онкогенетические" ? .white : Color("PurpleDark"))
                                            .background(category == "Онкогенетические" ? Color("BlueDark") : Color("GrayLight"))
                                            .cornerRadius(10)
                                    }
                                    .padding(.leading)
                                    Button {
                                        category = "ЗОЖ"
                                    } label: {
                                        Text("ЗОЖ")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 14)
                                            .font(.custom("SFProDisplay-Medium", size: 15))
                                            .foregroundColor(category == "ЗОЖ" ? .white : Color("PurpleDark"))
                                            .background(category == "ЗОЖ" ? Color("BlueDark") : Color("GrayLight"))
                                            .cornerRadius(10)
                                    }
                                    .padding(.leading)
                                    .padding(.trailing, 20)
                                }
                            }
                            .padding(.top)
                            .padding(.horizontal, -20)
                            VStack(spacing: 0) {
                                ForEach(viewModel.catalog, id: \.id) { catalog in
                                    if category == catalog.category {
                                        Button {
                                            //
                                        } label: {
                                            VStack(spacing: 0) {
                                                HStack {
                                                    Text(catalog.name)
                                                        .font(.custom("SFProDisplay-Medium", size: 16))
                                                        .multilineTextAlignment(.leading)
                                                    Spacer()
                                                }
                                                Spacer()
                                                HStack(spacing: 0) {
                                                    VStack(spacing: 0) {
                                                        HStack {
                                                            Text(catalog.time_result)
                                                                .font(.custom("SFProDisplay-Semibold", size: 14))
                                                                .foregroundColor(Color("GrayDark"))
                                                            Spacer()
                                                        }
                                                        HStack {
                                                            Text("\(catalog.price) ₽")
                                                                .font(.custom("SFProDisplay-Semibold", size: 17))
                                                            Spacer()
                                                        }
                                                        .padding(.top, 4)
                                                    }
                                                    Spacer()
                                                    Button {
                                                        //
                                                    } label: {
                                                        Text("Добавить")
                                                            .foregroundColor(.white)
                                                            .font(.custom("SFProDisplay-Semibold", size: 14))
                                                            .padding(.horizontal)
                                                            .padding(.vertical, 10)
                                                            .background(Color("BlueDark"))
                                                            .cornerRadius(10)
                                                    }
                                                }
                                            }
                                            .foregroundColor(.black)
                                            .padding()
                                            .frame(height: 136)
                                            .background(.white)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("Gray"))
                                            )
                                            .shadow(color: Color.black.opacity(0.1), radius: 8)
                                        }
                                        .padding(.vertical, 8)
                                    }
                                }
                            }
                            .padding(.vertical)
                        }
                        .padding(.horizontal, 20)
                    }
                    .refreshable {
                      do {
                        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
                      } catch {}
                        viewModel.news = []
                        viewModel.catalog = []
                        viewModel.getNews {
                            //
                        }
                        viewModel.getCatalog {
                            //
                        }
                    }
                    .padding(.top)
                    .padding(.bottom, 80)
                }
            } else if tabScreen == "Результаты" {
                Image("LogoIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenSize.width - 100)
            } else if tabScreen == "Поддержка" {
                Image("LogoIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenSize.width - 100)
            } else if tabScreen == "Профиль" {
                if UserDefaults.standard.bool(forKey: "card") {
                    VStack(spacing: 0) {
                        Text("Карта пациента")
                            .font(.custom("SFProDisplay-Heavy", size: 24))
                            .padding(.top, 60)
                        Button {
                            //
                        } label: {
                            VStack {
                                Image("Camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 53)
                            }
                            .frame(width: 148, height: 123)
                            .background(Color("PhotoBG"))
                            .clipShape(Capsule())
                        }
                        .padding(.top, 7)
                        HStack {
                            Text("Без карты пациента вы не сможете заказать анализы.")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("GrayDark"))
                            Spacer()
                        }
                        .padding(.top, 7)
                        HStack {
                            Text("В картах пациентов будут храниться результаты анализов вас и ваших близких.")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("GrayDark"))
                            Spacer()
                        }
                        .padding(.top, 3)
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
                        .padding(.top, 8)
                        .padding(.bottom, 22)
                        if viewModel.firstname.isEmpty || viewModel.middlename.isEmpty || viewModel.lastname.isEmpty || viewModel.bith.isEmpty || viewModel.pol.isEmpty {
                            Text("Сохранить")
                                .font(.custom("SFProDisplay-Semibold", size: 17))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: screenSize.width - 40)
                                .background(Color("PurpleLight"))
                                .cornerRadius(10)
                        } else {
                            Button {
                                viewModel.postUpdateProfile {
                                    UserDefaults.standard.set(viewModel.firstname, forKey: "firstname")
                                    UserDefaults.standard.set(viewModel.middlename, forKey: "middlename")
                                    UserDefaults.standard.set(viewModel.lastname, forKey: "lastname")
                                    UserDefaults.standard.set(viewModel.bith, forKey: "bith")
                                    UserDefaults.standard.set(viewModel.pol, forKey: "pol")
                                }
                            } label: {
                                Text("Сохранить")
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
                } else {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Создание карты пациента")
                                .font(.custom("SFProDisplay-Heavy", size: 24))
                            Spacer()
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
                                viewModel.postCreateProfile {
                                    UserDefaults.standard.set(true, forKey: "card")
                                    
                                    UserDefaults.standard.set(viewModel.firstname, forKey: "firstname")
                                    UserDefaults.standard.set(viewModel.middlename, forKey: "middlename")
                                    UserDefaults.standard.set(viewModel.lastname, forKey: "lastname")
                                    UserDefaults.standard.set(viewModel.bith, forKey: "bith")
                                    UserDefaults.standard.set(viewModel.pol, forKey: "pol")
                                }
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
            VStack(spacing: 0) {
                Spacer()
                VStack(spacing: 0) {
                    Divider()
                        .padding(.horizontal, -20)
                    HStack(spacing: 0) {
                        Button {
                            tabScreen = "Анализы"
                        } label: {
                            VStack(spacing: 0) {
                                Image("Analyzes")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32)
                                Text("Анализы")
                                    .font(.custom("SFProDisplay-Regular", size: 12))
                            }
                            .foregroundColor(tabScreen == "Анализы" ? Color("BlueDark") : Color("Gray2"))
                        }
                        Spacer()
                        Button {
                            tabScreen = "Результаты"
                        } label: {
                            VStack(spacing: 0) {
                                Image("Results")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32)
                                Text("Результаты")
                                    .font(.custom("SFProDisplay-Regular", size: 12))
                            }
                            .foregroundColor(tabScreen == "Результаты" ? Color("BlueDark") : Color("Gray2"))
                        }
                        Spacer()
                        Button {
                            tabScreen = "Поддержка"
                        } label: {
                            VStack(spacing: 0) {
                                Image("Support")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32)
                                Text("Поддержка")
                                    .font(.custom("SFProDisplay-Regular", size: 12))
                            }
                            .foregroundColor(tabScreen == "Поддержка" ? Color("BlueDark") : Color("Gray2"))
                        }
                        Spacer()
                        Button {
                            tabScreen = "Профиль"
                        } label: {
                            VStack(spacing: 0) {
                                Image("User")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32)
                                Text("Профиль")
                                    .font(.custom("SFProDisplay-Regular", size: 12))
                            }
                            .foregroundColor(tabScreen == "Профиль" ? Color("BlueDark") : Color("Gray2"))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    Spacer()
                }
                .frame(height: 88)
                .background(.white)
            }
        }
        .ignoresSafeArea(.keyboard)
        .ignoresSafeArea()
        .onAppear {
            viewModel.getNews {
                //
            }
            viewModel.getCatalog {
                //
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
