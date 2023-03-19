//
//  Api.swift
//  Medic
//
//  Created by bnkwsr4 on 14.03.2023.
//

import Foundation
import Alamofire

class ViewModel: ObservableObject {
    @Published var email = "ahmedovmanuil517@gmail.com"
    @Published var code = ""
    @Published var token = ""
    @Published var error1 = ""
    
    @Published var firstname = UserDefaults.standard.string(forKey: "firstname") ?? ""
    @Published var middlename = UserDefaults.standard.string(forKey: "middlename") ?? ""
    @Published var lastname = UserDefaults.standard.string(forKey: "lastname") ?? ""
    @Published var bith = UserDefaults.standard.string(forKey: "bith") ?? ""
    @Published var pol = UserDefaults.standard.string(forKey: "pol") ?? ""
    @Published var image = UserDefaults.standard.string(forKey: "image") ?? ""
    
    @Published var news: [News] = []
    @Published var catalog: [Catalog] = []
    
    private let link = "https://medic.madskill.ru/api/"
    
    func postSendCode(success: @escaping () -> Void, error: @escaping () -> Void) {
        error1 = ""
        if email == "" {
            error1 = "Введите значение"
            return()
        }
        let emailReglax = "[a-z0-9]+@[a-z0-9]+\\.[a-z]{1,3}"
        let emailPregar = NSPredicate(format: "SELF MATCHES %@", emailReglax)
        var isInvalidEmail = emailPregar.evaluate(with: email)
        if !isInvalidEmail {
            error1 = "Неверно введен почтовый адрес"
            error()
            return()
        }
        var headers = HTTPHeaders()
        headers.add(name: "email", value: UserDefaults.standard.string(forKey: "email")!)
        AF.request("\(link)sendCode", method: .post, headers: headers)
            .responseDecodable(of: SendCode.self) { res in
                debugPrint(res)
                success()
            }
    }
    
    func postSignIn(success: @escaping () -> Void, error: @escaping () -> Void) {
        error1 = "Неверный код"
        var headers = HTTPHeaders()
        headers.add(name: "email", value: UserDefaults.standard.string(forKey: "email")!)
        headers.add(name: "code", value: code)
        AF.request("\(link)signin", method: .post, headers: headers)
            .responseDecodable(of: SignIn.self) { res in
                self.token = "\(res.value?.token)"
                debugPrint(self.token)
                if self.token != "nil" {
                    debugPrint(res)
                    UserDefaults.standard.set(res.value!.token, forKey: "token")
                    success()
                }
                else {
                    error()
                }
            }
    }
    
    func getNews(success: @escaping () -> Void) {
        AF.request("\(link)news", method: .get)
            .responseDecodable(of: [News].self) { res in
                debugPrint(res)
                self.news += res.value ?? []
                success()
            }
    }
    
    func getCatalog(success: @escaping () -> Void) {
        AF.request("\(link)catalog", method: .get)
            .responseDecodable(of: [Catalog].self) { res in
                debugPrint(res)
                self.catalog += res.value ?? []
                success()
            }
    }
    
    func postCreateProfile(success: @escaping () -> Void) {
        let ProfileStruct = CreateProfile(id: 1, firstname: firstname, lastname: lastname, middlename: middlename, bith: bith, pol: pol, image: image)
        var headers = HTTPHeaders()
        headers.add(name: "Authorization", value: "Bearer \(UserDefaults.standard.string(forKey: "token")!)")
        AF.request("\(link)createProfile", method: .post, parameters: ProfileStruct,encoder: JSONParameterEncoder.default, headers: headers)
            .responseDecodable(of: CreateProfile.self) { res in
                debugPrint(res)
                success()
            }
    }
    
    func postUpdateProfile(success: @escaping () -> Void) {
        let ProfileStruct = UpdateProfile(firstname: firstname, lastname: lastname, middlename: middlename, bith: bith, pol: pol)
        var headers = HTTPHeaders()
        headers.add(name: "Authorization", value: "Bearer \(UserDefaults.standard.string(forKey: "token")!)")
        AF.request("\(link)updateProfile", method: .post, parameters: ProfileStruct,encoder: JSONParameterEncoder.default, headers: headers)
            .responseDecodable(of: CreateProfile.self) { res in
                debugPrint(res)
                success()
            }
    }
    
}

struct SendCode: Codable {
    let email: String
}
struct SignIn: Decodable {
    let token: String
}
struct News: Codable {
    let id: Int
    let name: String
    let description: String
    let price: String
    let image: String
}
struct Catalog: Codable {
    let id: Int
    let name: String
    let description: String
    let price: String
    let category: String
    let time_result: String
    let preparation: String
    let bio: String
}
struct CreateProfile: Codable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let bith: String
    let pol: String
    let image: String
}
struct UpdateProfile: Codable {
    let firstname: String
    let lastname: String
    let middlename: String
    let bith: String
    let pol: String
}
