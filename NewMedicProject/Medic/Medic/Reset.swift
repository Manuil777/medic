//
//  Reset.swift
//  Medic
//
//  Created by bnkwsr4 on 16.03.2023.
//

import SwiftUI

struct Reset: View {
    @Binding var screen: String
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenSize.width, height: screenSize.height)
            Image("LOGO")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenSize.width - 112)
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                screen = "Zastavka"
            }
        }
    }
}

