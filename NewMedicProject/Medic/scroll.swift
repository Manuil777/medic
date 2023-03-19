//
//  scroll.swift
//  Medic
//
//  Created by bnkwsr4 on 16.03.2023.
//

import SwiftUI
import PhotosUI

struct scroll: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images
            ) {
                VStack {
                    if let data = data, let uiimage = UIImage(data: data) {
                        Image(uiImage: uiimage)
                            .resizable()
                    } else {
                        Image("Camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 53)
                    }
                }
                .frame(width: 148, height: 123)
                .background(Color("PhotoBG"))
                .clipShape(Capsule())
            }
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("Data is nil")
                        }
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
        }
    }
  }

struct scroll_Previews: PreviewProvider {
    static var previews: some View {
        scroll()
    }
}
