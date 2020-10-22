//
//  Device.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 18/10/2020.
//

import UIKit

enum Device {
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
