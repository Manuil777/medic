//
//  MainView.swift
//  Medic
//
//  Created by bnkwsr4 on 01.03.2023.
//

import SwiftUI

struct MainView: View {
    @Binding var screen:String
    
    @State var button = "1"
    
    @State var menu = false
    @State var basket = false
    @State var order = false
    
    @State var address = false
    @State var saveAddress = false
    @State var inputAddress = false
    
    @State var date = false
    @State var time = "10:00"
    @State var day: Date = Date()
    @State var inputDate = false
    @State var selectDate = false
    
    @State var patient = false
    @State var newPatient = ""
    @State var inputPatient = false
    
    @State var pacient = 1
    @StateObject var viewModel = ViewModel()
    @State var cena = UserDefaults.standard.integer(forKey: "cena")
    
    var placeholder = "Пол"
    var dropDounList = ["Мужской", "Женский"]
    @State var firstname = (UserDefaults.standard.string(forKey: "firstname")!)
    @State var lastname = (UserDefaults.standard.string(forKey: "lastname")!)
    @State var middlename = (UserDefaults.standard.string(forKey: "middlename")!)
    @State var bith = (UserDefaults.standard.string(forKey: "bith")!)
    @State var pol = (UserDefaults.standard.string(forKey: "pol")!)
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    @State var search = ""
    @State var category = "Популярные"
    
    var body: some View {
        ZStack {
            if button == "1" {
                VStack(spacing: 16) {
                    HStack(spacing: 0) {
                        Button {
                            //
                        } label: {
                            Image("Search")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                        .padding(14)
                        TextField("Искать анализы", text: $search)
                            .font(.custom("SFProDisplay-Regular", size: 16))
                            .padding(.leading, -6)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("grayLight"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("gray"), lineWidth: 1))
                    .padding(.top, 68)
                    .padding(.horizontal, 20)
                    HStack {
                        Text("Акции и новости")
                            .font(.custom("SFProDisplay-Semibold", size: 17))
                            .foregroundColor(Color("grayDark"))
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.news, id: \.id){ news in
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        AsyncImage(url: URL(string: news.image.replacingOccurrences(of: " ", with: "%20"))) { images in images
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .offset(x: 67)
                                        } placeholder: {
                                            Color("grayLight")
                                        }
                                        HStack {
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text(news.name)
                                                    .font(.custom("SFProDisplay-Heavy", size: 20))
                                                    .foregroundColor(.white)
                                                    .multilineTextAlignment(.leading)
                                                    .padding(.trailing, 35)
                                                Spacer()
                                                Text(news.description)
                                                    .font(.custom("SFProDisplay-Regular", size: 14))
                                                    .foregroundColor(.white)
                                                    .multilineTextAlignment(.leading)
                                                    .padding(.bottom, 4)
                                                Text("\(news.price) ₽")
                                                    .font(.custom("SFProDisplay-Heavy", size: 20))
                                                    .foregroundColor(.white)
                                                    .padding(.bottom, -4)
                                            }
                                            .padding()
                                            Spacer()
                                        }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(LinearGradient(colors: [Color("blue"), Color.blue.opacity(0.3)], startPoint: .leading, endPoint: .trailing))
                                }
                                .frame(width: 270, height: 152)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                        .padding(.leading, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    HStack {
                        Text("Каталог анализов")
                            .font(.custom("SFProDisplay-Semibold", size: 17))
                            .foregroundColor(Color("grayDark"))
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            if category == "Популярные" {
                                Button {
                                    //
                                } label: {
                                    Text("Популярные")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("blueDark"))
                                        .cornerRadius(10)
                                }
                            } else {
                                Button {
                                    category = "Популярные"
                                } label: {
                                    Text("Популярные")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(Color("purpleDark"))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                }
                            }
                            if category == "v" {
                                Button {
                                    //
                                } label: {
                                    Text("COVID")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("blueDark"))
                                        .cornerRadius(10)
                                }
                            } else {
                                Button {
                                    category = "COVID"
                                } label: {
                                    Text("COVID")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(Color("purpleDark"))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                }
                            }
                            if category == "Онкогенетические" {
                                Button {
                                    //
                                } label: {
                                    Text("Онкогенетические")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("blueDark"))
                                        .cornerRadius(10)
                                }
                            } else {
                                Button {
                                    category = "Онкогенетические"
                                } label: {
                                    Text("Онкогенетические")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(Color("purpleDark"))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                }
                            }
                            if category == "ЗОЖ" {
                                Button {
                                    //
                                } label: {
                                    Text("ЗОЖ")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("blueDark"))
                                        .cornerRadius(10)
                                }
                            } else {
                                Button {
                                    category = "ЗОЖ"
                                } label: {
                                    Text("ЗОЖ")
                                        .font(.custom("SFProDisplay-Medium", size: 15))
                                        .foregroundColor(Color("purpleDark"))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.leading, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    if cena > 0 {
                        ScrollView(showsIndicators: false) {
                            ForEach(viewModel.catalog, id: \.id){ catalog in
                                if category == catalog.category {
                                    card(id: catalog.id, name: catalog.name, description: catalog.description, price: catalog.price, category: catalog.category, time_result: catalog.time_result, preparation: catalog.preparation, bio: catalog.bio,cena: $cena, menu: $menu)
                                }
                            }
                        }
                        .padding(.bottom, -18)
                        VStack(spacing: 0) {
                            Divider()
                                .frame(height: 0.1)
                                .background(Color("grayLight"))
                            Button {
                                basket = true
                            } label: {
                                HStack{
                                    Image("Basket2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .padding(.trailing)
                                    Text("В корзину")
                                        .font(.custom("SFProDisplay-Semibold", size: 17))
                                    Spacer()
                                    Text("\(cena) ₽")
                                        .font(.custom("SFProDisplay-Semibold", size: 17))
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("blueDark"))
                                )
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 24)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 104)
                        .padding(.bottom, 40)
                    } else {
                        ScrollView(showsIndicators: false) {
                            ForEach(viewModel.catalog, id: \.id){ catalog in
                                if category == catalog.category {
                                    card(id: catalog.id, name: catalog.name, description: catalog.description, price: catalog.price, category: catalog.category, time_result: catalog.time_result, preparation: catalog.preparation, bio: catalog.bio,cena: $cena, menu: $menu)
                                }
                            }
                        }
                        .padding(.bottom, 40)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .padding(.bottom, 60)
                .ignoresSafeArea()
            } else if button == "2" {
                Text("Результаты")
            } else if button == "3" {
                Text("Поддержка")
            } else if button == "4" {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Карта пациента")
                            .font(.custom("SFProDisplay-Heavy", size: 24))
                            .padding(.top, 60)
                    }
                    .frame(maxWidth: .infinity)
                    HStack {
                        ZStack {
                            Button {
                                shouldShowImagePicker.toggle()
                            } label: {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 148, height: 123)
                                        .cornerRadius(80)
                                } else {
                                    Image("Camera")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 53)
                                }
                            }
                        }
                        .frame(width: 148, height: 123)
                        .background(Color("grayImage"))
                        .clipShape(
                            Capsule()
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
                    Text("Без карты пациента вы не сможете заказать анализы.")
                        .font(.custom("SFProDisplay-Regular", size: 14))
                        .foregroundColor(Color("grayDark"))
                        .padding(.bottom, 3)
                    Text("В картах пациентов будут храниться результаты анализов вас и ваших близких.")
                        .font(.custom("SFProDisplay-Regular", size: 14))
                        .foregroundColor(Color("grayDark"))
                        .padding(.bottom, 8)
                    
                    VStack(spacing: 24) {
                        TextField("Имя", text: $firstname)
                            .font(.custom("SFProDisplay-Regular", size: 15))
                            .padding(14)
                            .background(Color("grayLight"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(firstname.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
                        TextField("Отчество", text: $middlename)
                            .font(.custom("SFProDisplay-Regular", size: 15))
                            .padding(14)
                            .background(Color("grayLight"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(middlename.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
                        TextField("Фамилия", text: $lastname)
                            .font(.custom("SFProDisplay-Regular", size: 15))
                            .padding(14)
                            .background(Color("grayLight"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lastname.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
                        TextField("Дата рождения", text: $bith)
                            .font(.custom("SFProDisplay-Regular", size: 15))
                            .padding(14)
                            .background(Color("grayLight"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(bith.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
                        Menu {
                            ForEach(dropDounList, id: \.self) { client in
                                Button(client) {
                                    pol = client
                                }
                            }
                        } label: {
                            VStack(spacing: 5) {
                                HStack {
                                    Text(pol.isEmpty ? placeholder : pol)
                                        .foregroundColor(pol.isEmpty ? Color("grayTextField") : .black)
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
                                        .stroke(pol.isEmpty ? Color("gray") : Color("grayEmpty"), lineWidth: 1))
                            }
                        }
                    }
                    Spacer()
                    if firstname == "" || middlename == "" || lastname == "" || bith == "" || pol == "" {
                        Text("Сохранить")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color("purpleLight"))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.custom("SFProDisplay-Semibold", size: 17))
                            .padding(.bottom, 110)
                    } else {
                        Button {
                            //                    viewModel.postCreateProfile {
                            //                        //screen = "MainView"
                            //                    }
                        } label: {
                            Text("Сохранить")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color("blueDark"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.custom("SFProDisplay-Semibold", size: 17))
                        }
                        .padding(.bottom, 110)
                    }
                }
                .padding(.horizontal, 20)
                .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                        .ignoresSafeArea()
                }
            }
            VStack {
                Spacer()
                VStack(spacing: 0) {
                    Divider()
                        .frame(height: 0.1)
                        .background(Color("grayLight"))
                    HStack {
                        if button == "1" {
                            Button {
                                //
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
                                .foregroundColor(Color("blueDark"))
                            }
                        } else {
                            Button {
                                button = "1"
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
                                .foregroundColor(Color("grayButton"))
                            }
                        }
                        Spacer()
                        if button == "2" {
                            Button {
                                //
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
                                .foregroundColor(Color("blueDark"))
                            }
                        } else {
                            Button {
                                button = "2"
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
                                .foregroundColor(Color("grayButton"))
                            }
                        }
                        Spacer()
                        if button == "3" {
                            Button {
                                //
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
                                .foregroundColor(Color("blueDark"))
                            }
                        } else {
                            Button {
                                button = "3"
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
                                .foregroundColor(Color("grayButton"))
                            }
                        }
                        Spacer()
                        if button == "4" {
                            Button {
                                //
                            } label: {
                                VStack(spacing: 0) {
                                    Image("User")
                                        .renderingMode(.template)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32)
                                    Text("Пользователь")
                                        .font(.custom("SFProDisplay-Regular", size: 12))
                                }
                                .foregroundColor(Color("blueDark"))
                            }
                        } else {
                            Button {
                                button = "4"
                            } label: {
                                VStack(spacing: 0) {
                                    Image("User")
                                        .renderingMode(.template)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32)
                                    Text("Пользователь")
                                        .font(.custom("SFProDisplay-Regular", size: 12))
                                }
                                .foregroundColor(Color("grayButton"))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    Spacer()
                }
                .frame(height: 88)
                .background(.white)
            }
            .frame(height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            if menu {
                ZStack {
                    VStack {
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.6))
                    VStack {
                        ZStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(UserDefaults.standard.string(forKey: "name")!)
                                        .font(.custom("SFProDisplay-Semibold", size: 20))
                                        .lineSpacing(5)
                                    Spacer()
                                }
                                .padding(.top, 24)
                                .padding(.bottom, 20)
                                ScrollView(showsIndicators: false) {
                                    VStack(alignment: .leading) {
                                        Text("Описание")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("grayDark"))
                                            .padding(.bottom, 8)
                                        Text(UserDefaults.standard.string(forKey: "description")!)
                                            .font(.custom("SFProDisplay-Regular", size: 15))
                                            .lineSpacing(4)
                                            .padding(.bottom)
                                        Text("Подготовка")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("grayDark"))
                                            .padding(.bottom, 8)
                                        Text(UserDefaults.standard.string(forKey: "preparation")!)
                                            .font(.custom("SFProDisplay-Regular", size: 15))
                                            .lineSpacing(4)
                                            .padding(.bottom)
                                    }
                                }
                                Spacer()
                                VStack(spacing: 0) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Результаты через:")
                                                .font(.custom("SFProDisplay-Semibold", size: 14))
                                                .foregroundColor(Color("grayDark"))
                                            Text(UserDefaults.standard.string(forKey: "time_result")!)
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                        }
                                        Spacer()
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Биоматериал:")
                                                .font(.custom("SFProDisplay-Semibold", size: 14))
                                                .foregroundColor(Color("grayDark"))
                                            Text(UserDefaults.standard.string(forKey: "bio")!)
                                                .font(.custom("SFProDisplay-Medium", size: 16))
                                        }
                                        Spacer()
                                    }
                                    .padding(.bottom, 20)
                                    Button {
                                        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "idProd"), forKey: "idProd\(UserDefaults.standard.integer(forKey: "idProd"))")
                                        cena += UserDefaults.standard.integer(forKey: "price")
                                        UserDefaults.standard.set(cena, forKey: "cena")
                                        
                                        menu = false
                                        
                                    } label: {
                                        Text("Добавить за \(UserDefaults.standard.string(forKey: "price")!) ₽")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 56)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                            .font(.custom("SFProDisplay-Semibold", size: 17))
                                    }
                                    .padding(.bottom, 40)
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(width: UIScreen.main.bounds.width)
                            .background(.white)
                            .cornerRadius(24)
                            .padding(.top, UIScreen.main.bounds.height*0.2)
                            VStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        menu = false
                                    } label: {
                                        Image("Close")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 24)
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.top, UIScreen.main.bounds.height*0.2)
                        }
                    }
                }
                .animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0))
            }
            if basket {
                VStack(spacing: 0) {
                    HStack {
                        Button  {
                            basket = false
                            viewModel.catalog = []
                        } label: {
                            Image("Exit")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .padding(6)
                                .background(Color("grayLight"))
                                .cornerRadius(8)
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 60)
                    HStack{
                        Text("Корзина")
                            .font(.custom("SFProDisplay-Heavy", size: 24))
                        Spacer()
                        Button {
                            for i in  1...20 {
                                UserDefaults.standard.set(0, forKey: "idProd\(i)")
                                cena = 0
                                UserDefaults.standard.set(cena, forKey: "cena")
                            }
                            basket = false
                            viewModel.catalog = []
                            pacient = 1
                        } label: {
                            Image("Basket")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 26)
                    .padding(.top, 24)
                    VStack{
                        ScrollView(.vertical, showsIndicators: false){
                            ForEach(viewModel.catalog, id: \.id) { basket in
                                if basket.id == UserDefaults.standard.integer(forKey: "idProd\(basket.id)") {
                                    VStack{
                                        VStack {
                                            HStack{
                                                Text(basket.name)
                                                    .font(.custom("SFProDisplay-Medium", size: 16))
                                                Spacer()
                                                Button {
                                                    UserDefaults.standard.set(0, forKey: "idProd\(basket.id)")
                                                    cena -= Int(basket.price)! * pacient
                                                    pacient = 1
                                                } label: {
                                                    Image("Delete")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 20)
                                                }
                                            }
                                            Spacer()
                                            HStack{
                                                Text("\(basket.price)₽")
                                                    .font(.custom("SFProDisplay-Medium", size: 17))
                                                Spacer()
                                                Text("\(pacient) пациент")
                                                    .font(.custom("SFProDisplay-Regular", size: 15))
                                                HStack(spacing: 0) {
                                                    Button {
                                                        if pacient>1{
                                                            cena -= Int(basket.price)!
                                                            pacient -= 1
                                                        }
                                                    } label: {
                                                        Image("Minus")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 20)
                                                            .padding(6)
                                                    }
                                                    Divider()
                                                        .frame(height: 16)
                                                    Button {
                                                        cena += Int(basket.price)!
                                                        pacient += 1
                                                    } label: {
                                                        Image("Plus 1")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 20)
                                                            .padding(6)
                                                    }
                                                }
                                                .background(RoundedRectangle(cornerRadius: 8)
                                                    .foregroundColor(Color("grayLight"))
                                                )
                                                .padding(.leading)
                                            }
                                        }
                                        .padding()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 136)
                                    .background(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.05), radius: 5)
                                    .shadow(color: Color("grayBorder"), radius: 1)
                                    .padding(.top, 8)
                                    .padding(.horizontal, 20)
                                    
                                }
                            }
                            HStack{
                                Text("Сумма")
                                    .font(.custom("SFProDisplay-Semibold", size: 20))
                                    .padding(.leading, 20)
                                Spacer()
                                Text("\(cena) ₽")
                                    .font(.custom("SFProDisplay-Semibold", size: 20))
                                    .padding(.trailing, 20)
                            }
                            .padding(.top, 40)
                        }
                        Spacer()
                        Button {
                            order = true
                        } label: {
                            Text("Перейти к оформлению заказа")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color("blueDark"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.custom("SFProDisplay-Semibold", size: 17))
                                .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 32)
                    }
                    .padding(.top, 32)
                    Spacer()
                }
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(.white)
            }
            if order {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Button {
                                order = false
                            } label: {
                                Image("Exit")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20)
                                    .padding(6)
                                    .background(Color("grayLight"))
                                    .cornerRadius(8)
                            }
                            Spacer()
                        }
                        .padding(.top, 60)
                        HStack {
                            Text("Оформление заказа")
                                .font(.custom("SFProDisplay-Heavy", size: 24))
                            Spacer()
                        }
                        .padding(.top, 24)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Адрес *")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("purpleDark"))
                            Button {
                                address = true
                            } label: {
                                HStack {
                                    Text(inputAddress ? "\(viewModel.street), кв.\(viewModel.flat)" : "Введите ваш адрес")
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .foregroundColor(.black)
                                        .padding(14)
                                    Spacer()
                                }
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                            }
                            .padding(.top, 4)
                            HStack{
                                Text("Дата и время *")
                                    .font(.custom("SFProDisplay-Regular", size: 14))
                                    .foregroundColor(Color("purpleDark"))
                                Spacer()
                            }
                            .padding(.top)
                            Button {
                                date = true
                            } label: {
                                HStack {
                                    Text(inputDate ? "\(day.formatted(date: .abbreviated, time: .omitted)) \(time)" : "Выберите дату и время")
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .foregroundColor(.black)
                                        .padding(14)
                                    Spacer()
                                }
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                            }
                            .padding(.top, 4)
                            HStack{
                                Text("Кто будет сдавать анализы? *")
                                    .font(.custom("SFProDisplay-Regular", size: 14))
                                    .foregroundColor(Color("purpleDark"))
                                Spacer()
                            }
                            .padding(.top, 32)
                            Button {
                                //
                            } label: {
                                HStack(spacing: 0) {
                                    Image("UserMan")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                        .padding(12)
                                    Text("\(UserDefaults.standard.string(forKey: "lastname")!) \(UserDefaults.standard.string(forKey: "firstname")!)")
                                        .font(.custom("SFProDisplay-Regular", size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image("Chevron2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .padding(14)
                                }
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                            }
                            .padding(.top)
                            if newPatient == "1" && inputPatient {
                                HStack(spacing: 0) {
                                    Image("UserWomen")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                        .padding(12)
                                    Text("Тицкая Елена")
                                        .font(.custom("SFProDisplay-Regular", size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image("Chevron2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .padding(14)
                                }
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                                .padding(.top)
                            }
                            if newPatient == "2" && inputPatient {
                                HStack(spacing: 0) {
                                    Image("UserMan")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                        .padding(12)
                                    Text("Петров Пётр")
                                        .font(.custom("SFProDisplay-Regular", size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image("Chevron2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .padding(14)
                                }
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                                .padding(.top)
                            }
                            Button {
                                patient = true
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Добавить еще пациента")
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .foregroundColor(Color("blueDark"))
                                        .padding(.vertical, 14)
                                    Spacer()
                                }
                                .frame(width: UIScreen.main.bounds.width-40)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("blueDark"), lineWidth: 1)
                                )
                            }
                            .padding(.top)
                        }
                        .padding(.top)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Телефон *")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("purpleDark"))
                                .padding(.top, 32)
                            TextField("Введите ваш телефон", text: $viewModel.phone)
                                .font(.custom("SFProDisplay-Regular", size: 15))
                                .padding(14)
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                                .padding(.top, 4)
                            HStack(alignment: .center) {
                                Text("Комментарий")
                                    .font(.custom("SFProDisplay-Regular", size: 14))
                                    .foregroundColor(Color("purpleDark"))
                                Spacer()
                                Button {
                                    //
                                } label: {
                                    Image("Mic")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                }
                            }
                            .padding(.top)
                            VStack {
                                HStack {
                                    TextField("Можете оставить свои пожелания", text: $viewModel.messege, axis: .vertical)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(.top, 14)
                                        .padding(.leading, 14)
                                    Spacer()
                                }
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width-40, height: 128)
                            .background(Color("grayLight"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("gray"), lineWidth: 1))
                            .padding(.top, 2.73)
                            VStack(spacing: 16) {
                                Button {
                                    //
                                } label: {
                                    HStack {
                                        Text("Оплата Apple Pay")
                                            .font(.custom("SFProDisplay-Medium", size: 15))
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image("Next")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20)
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    HStack {
                                        Text("Промокод")
                                            .font(.custom("SFProDisplay-Medium", size: 15))
                                            .foregroundColor(Color("grayDark"))
                                        Spacer()
                                        Image("Next")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20)
                                    }
                                }
                            }
                            .padding(.top, 40)
                            HStack {
                                Text("1 анализ")
                                    .font(.custom("SFProDisplay-Medium", size: 17))
                                Spacer()
                                Text("\(cena) ₽")
                                    .font(.custom("SFProDisplay-Medium", size: 17))
                            }
                            .padding(.top, 30)
                            Button {
                                screen = "Payment"
                                for i in  1...20 {
                                    UserDefaults.standard.set(0, forKey: "idProd\(i)")
                                    cena = 0
                                    UserDefaults.standard.set(cena, forKey: "cena")
                                }
                                saveAddress = false
                                inputAddress = false
                                inputDate = false
                                selectDate = false
                                pacient = 1
                                newPatient = ""
                                time = "10:00"
                            } label: {
                                Text("Заказать")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 56)
                                    .background(Color("blueDark"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .font(.custom("SFProDisplay-Semibold", size: 17))
                            }
                            .padding(.bottom, 32)
                            .padding(.top, 12)
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.top)
                }
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(.white)
            }
            if address {
                ZStack {
                    VStack {
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.6))
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Адрес сдачи анализов")
                                    .font(.custom("SFProDisplay-Semibold", size: 20))
                                Spacer()
                                Button {
                                    address = false
                                } label: {
                                    Image("CloseAddress")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                }
                            }
                            .padding(.top, 24)
                            Text("Ваш адрес")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("purpleDark"))
                                .padding(.top, 8)
                            TextField("Улица", text: $viewModel.street)
                                .font(.custom("SFProDisplay-Regular", size: 15))
                                .padding(14)
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                                .padding(.top, 4)
                            HStack(spacing: 12.5) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Долгота")
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("purpleDark"))
                                    TextField("Долгота", text: $viewModel.longitude)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("gray"), lineWidth: 1))
                                        .padding(.top, 4)
                                }
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Широта")
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("purpleDark"))
                                    TextField("Широта", text: $viewModel.latitude)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("gray"), lineWidth: 1))
                                        .padding(.top, 4)
                                }
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Высота")
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("purpleDark"))
                                    TextField("Высота", text: $viewModel.height)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("gray"), lineWidth: 1))
                                        .padding(.top, 4)
                                }
                                .frame(width: (UIScreen.main.bounds.width-65)/6)
                            }
                            .padding(.top)
                            HStack(spacing: 17.5) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Квартира")
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("purpleDark"))
                                    TextField("Квартира", text: $viewModel.flat)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("gray"), lineWidth: 1))
                                        .padding(.top, 4)
                                }
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Подъезд")
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("purpleDark"))
                                    TextField("Подъезд", text: $viewModel.entrance)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("gray"), lineWidth: 1))
                                        .padding(.top, 4)
                                }
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Этаж")
                                        .font(.custom("SFProDisplay-Regular", size: 14))
                                        .foregroundColor(Color("purpleDark"))
                                    TextField("Этаж", text: $viewModel.floor)
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .padding(14)
                                        .background(Color("grayLight"))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("gray"), lineWidth: 1))
                                        .padding(.top, 4)
                                }
                            }
                            .padding(.top)
                            Text("Домофон")
                                .font(.custom("SFProDisplay-Regular", size: 14))
                                .foregroundColor(Color("purpleDark"))
                                .padding(.top, 16)
                            TextField("Домофон", text: $viewModel.intercom)
                                .font(.custom("SFProDisplay-Regular", size: 15))
                                .padding(14)
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                                .padding(.top, 4)
                            HStack {
                                Text("Сохранить этот адрес?")
                                    .font(.custom("SFProDisplay-Medium", size: 16))
                                Spacer()
                                ZStack {
                                    Capsule()
                                        .frame(width: 48, height: 28)
                                        .foregroundColor(saveAddress ? Color("blueDark") : Color("Toggle"))
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width: 24)
                                        .offset(x: saveAddress ? 10 : -10)
                                        .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0, y: 3)
                                }
                                .frame(width: 48, height: 28)
                                .onTapGesture {
                                    self.saveAddress.toggle()
                                }
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 22)
                            if saveAddress {
                                TextField("Название: например дом, работа", text: $viewModel.saveAddress)
                                    .font(.custom("SFProDisplay-Regular", size: 15))
                                    .padding(14)
                                    .background(Color("grayLight"))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("gray"), lineWidth: 1))
                                    .padding(.bottom, 14)
                            }
                            if (saveAddress == false || (saveAddress && (viewModel.saveAddress == "" || viewModel.saveAddress != ""))) && (viewModel.street == "" || viewModel.longitude == "" || viewModel.latitude == "" || viewModel.height == "" || viewModel.flat == "" || viewModel.entrance == "" || viewModel.floor == "" || viewModel.intercom == "") || saveAddress && viewModel.saveAddress == "" {
                                Text("Подтвердить")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 56)
                                    .background(Color("purpleLight"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .font(.custom("SFProDisplay-Semibold", size: 17))
                                    .padding(.bottom, 32)
                            } else {
                                Button {
                                    address = false
                                    inputAddress = true
                                } label: {
                                    Text("Подтвердить")
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 56)
                                        .background(Color("blueDark"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .font(.custom("SFProDisplay-Semibold", size: 17))
                                }
                                .padding(.bottom, 32)
                            }
                        }
                        .padding(.bottom, 32)
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width)
                        .background(.white)
                        .cornerRadius(24)
                        .animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0))
                    }
                }
            }
            if date {
                ZStack {
                    VStack {
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.6))
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Дата и время")
                                    .font(.custom("SFProDisplay-Semibold", size: 20))
                                Spacer()
                                Button {
                                    date = false
                                } label: {
                                    Image("Close")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                }
                            }
                            .padding(.top, 24)
                            
                            Text("Выберите дату")
                                .font(.custom("SFProDisplay-Medium", size: 16))
                                .foregroundColor(Color("grayDark"))
                                .padding(.top, 24)
                            Button {
                                self.selectDate.toggle()
                            } label: {
                                HStack(spacing: 0) {
                                    Text("\(day.formatted(date: .abbreviated, time: .omitted))")
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .foregroundColor(.black)
                                        .padding(14)
                                    Spacer()
                                    Image("Chevron2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .padding(14)
                                }
                                .background(Color("grayLight"))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("gray"), lineWidth: 1))
                            }
                            .padding(.top)
                            if selectDate {
                                DatePicker("Выберите дату", selection: $day, displayedComponents: [.date])
                                    .padding(.top)
                                    .font(.custom("SFProDisplay-Regular", size: 15))
                            }
                            Text("Выберите время")
                                .font(.custom("SFProDisplay-Medium", size: 16))
                                .foregroundColor(Color("grayDark"))
                                .padding(.top, 32)
                            HStack(spacing: 0) {
                                Button {
                                    time = "10:00"
                                } label: {
                                    if time == "10:00" {
                                        Text("10:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("10:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                                Spacer()
                                Button {
                                    time = "13:00"
                                } label: {
                                    if time == "13:00" {
                                        Text("13:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("13:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                                Spacer()
                                Button {
                                    time = "14:00"
                                } label: {
                                    if time == "14:00" {
                                        Text("14:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("14:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                                Spacer()
                                Button {
                                    time = "15:00"
                                } label: {
                                    if time == "15:00" {
                                        Text("15:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("15:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding(.top)
                            HStack(spacing: 0) {
                                Button {
                                    time = "16:00"
                                } label: {
                                    if time == "16:00" {
                                        Text("16:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("16:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                                Spacer()
                                Button {
                                    time = "18:00"
                                } label: {
                                    if time == "18:00" {
                                        Text("18:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("18:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                                Spacer()
                                Button {
                                    time = "19:00"
                                } label: {
                                    if time == "19:00" {
                                        Text("19:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("blueDark"))
                                            .cornerRadius(10)
                                    } else {
                                        Text("19:00")
                                            .font(.custom("SFProDisplay-Medium", size: 16))
                                            .foregroundColor(Color("purpleDark"))
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 10)
                                            .background(Color("grayLight"))
                                            .cornerRadius(10)
                                    }
                                }
                                Spacer()
                                VStack {
                                }
                                .frame(width: 70, height: 40)
                            }
                            .padding(.top)
                            Button {
                                inputDate = true
                                date = false
                            } label: {
                                Text("Подтвердить")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 56)
                                    .background(Color("blueDark"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .font(.custom("SFProDisplay-Semibold", size: 17))
                            }
                            .padding(.bottom, 32)
                            .padding(.top, 48)
                        }
                        .padding(.bottom, 32)
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width)
                        .background(.white)
                        .cornerRadius(24)
                        .animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0))
                    }
                }
            }
            if patient {
                ZStack {
                    VStack {
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.black.opacity(0.6))
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Выбор пациента")
                                    .font(.custom("SFProDisplay-Semibold", size: 20))
                                Spacer()
                                Button {
                                    patient = false
                                    newPatient = ""
                                } label: {
                                    Image("Close")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24)
                                }
                            }
                            .padding(.top, 24)
                            Button {
                                newPatient = "1"
                            } label: {
                                if newPatient == "1" {
                                    HStack(spacing: 0) {
                                        Image("UserWomen")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24)
                                            .padding(12)
                                        Text("Тицкая Елена")
                                            .font(.custom("SFProDisplay-Regular", size: 16))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    .background(Color("blueDark"))
                                    .cornerRadius(10)
                                } else {
                                    HStack(spacing: 0) {
                                        Image("UserWomen")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24)
                                            .padding(12)
                                        Text("Тицкая Елена")
                                            .font(.custom("SFProDisplay-Regular", size: 16))
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    .background(Color("grayLight"))
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.top, 24)
                            Button {
                                newPatient = "2"
                            } label: {
                                if newPatient == "2" {
                                    HStack(spacing: 0) {
                                        Image("UserMan")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24)
                                            .padding(12)
                                        Text("Петров Пётр")
                                            .font(.custom("SFProDisplay-Regular", size: 16))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    .background(Color("blueDark"))
                                    .cornerRadius(10)
                                } else {
                                    HStack(spacing: 0) {
                                        Image("UserMan")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24)
                                            .padding(12)
                                        Text("Петров Пётр")
                                            .font(.custom("SFProDisplay-Regular", size: 16))
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    .background(Color("grayLight"))
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.top)
                            Button {
                                //
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Добавить пациента")
                                        .font(.custom("SFProDisplay-Regular", size: 15))
                                        .foregroundColor(Color("blueDark"))
                                        .padding(.vertical, 14)
                                    Spacer()
                                }
                                .frame(width: UIScreen.main.bounds.width-40)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("blueDark"), lineWidth: 1)
                                )
                            }
                            .padding(.top, 24)
                            if newPatient == "" {
                                Text("Подтвердить")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 56)
                                    .background(Color("purpleLight"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .font(.custom("SFProDisplay-Semibold", size: 17))
                                    .padding(.bottom, 32)
                                    .padding(.top, 40)
                            } else {
                                Button {
                                    patient = false
                                    inputPatient = true
                                } label: {
                                    Text("Подтвердить")
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 56)
                                        .background(Color("blueDark"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .font(.custom("SFProDisplay-Semibold", size: 17))
                                }
                                .padding(.bottom, 32)
                                .padding(.top, 40)
                            }
                        }
                        .padding(.bottom, 32)
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width)
                        .background(.white)
                        .cornerRadius(24)
                        .animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0))
                    }
                }
            }
        }
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

struct card: View {
    var id: Int
    var name: String
    var description: String
    var price: String
    var category: String
    var time_result: String
    var preparation: String
    var bio: String
    
    @Binding var cena: Int
    
    @StateObject var viewModel = ViewModel()
    @Binding var menu: Bool
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .font(.custom("SFProDisplay-Medium", size: 16))
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    Text(time_result)
                        .font(.custom("SFProDisplay-Semibold", size: 14))
                        .foregroundColor(Color("grayDark"))
                    Text("\(price) ₽")
                        .font(.custom("SFProDisplay-Semibold", size: 17))
                }
                Spacer()
                VStack {
                    Spacer()
                    if (UserDefaults.standard.integer(forKey: "idProd\(id)") == id) {
                        Button {
                            UserDefaults.standard.set(0, forKey: "idProd\(id)")
                            cena -= Int(price)!
                        } label: {
                            Text("Убрать")
                                .font(.custom("SFProDisplay-Semibold", size: 14))
                                .foregroundColor(Color("blueDark"))
                                .padding(.horizontal, 24.5)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("blueDark"), lineWidth: 1)
                                )
                        }
                    } else {
                        Button {
                            menu = true
                            
                            UserDefaults.standard.set(id, forKey: "idProd")
                            UserDefaults.standard.set(name, forKey: "name")
                            UserDefaults.standard.set(description, forKey: "description")
                            UserDefaults.standard.set(preparation, forKey: "preparation")
                            UserDefaults.standard.set(bio, forKey: "bio")
                            UserDefaults.standard.set(time_result, forKey: "time_result")
                            UserDefaults.standard.set(price, forKey: "price")
                            
                        } label: {
                            Text("Добавить")
                                .font(.custom("SFProDisplay-Semibold", size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(Color("blueDark"))
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.bottom)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 136)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5)
        .shadow(color: Color("grayBorder"), radius: 1)
        .padding(.top, 8)
        .padding(.horizontal, 20)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

