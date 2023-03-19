//
//  ConnectOn.swift
//  Medic
//
//  Created by bnkwsr4 on 16.03.2023.
//

import SwiftUI
import Foundation
import AVKit
import Network
class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnectOn = true
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnectOn = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
