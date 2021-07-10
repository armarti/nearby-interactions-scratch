//
//  Device.swift
//  nearby-interactions-scratch
//
//  Created by David Charles Morse on 2021-07-09.
//

import Foundation
//import Conn

class Device {
    var connectMethod: ConnectMethod
    init() {
        connectMethod = .BLUETOOTH;
    }
    func f() -> Bool {
        connectMethod = .MULTIPEER
        return true
    }
}
