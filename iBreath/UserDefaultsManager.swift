//
//  UserDefaultsManager.swift
//  iBreath
//
//  Created by Amber Spadafora on 11/2/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import Foundation

 class UserDefaultsManager {
    init(){}
    
    static let shared = UserDefaultsManager()
    
    static let breathInVal: TimeInterval = UserDefaults.standard.value(forKey: "breathInDuration") as? TimeInterval ?? 4.0
    static let breathOutVal: TimeInterval = UserDefaults.standard.value(forKey: "breathOutDuration") as? TimeInterval ?? 4.0
    static let holdVal: TimeInterval = UserDefaults.standard.value(forKey: "holdDuration") as? TimeInterval ?? 4.0
    
    static var breathIn = Setting(key: "breathInDuration", value: breathInVal, description: "Breath In Duration")
    static var breathOut = Setting(key: "breathOutDuration", value: breathOutVal, description: "Breath Out Duration")
    static var hold = Setting(key: "holdDuration", value: holdVal, description: "Hold Duration")
    
    static var settings = [breathIn, breathOut, hold]
}

func getBreathInSettings() -> TimeInterval {
    guard let breathInSettings = UserDefaults.standard.value(forKey: UserDefaultsManager.breathIn.key) as? TimeInterval else { return 4.0 }
    return breathInSettings
}
func getBreathOutSettings() -> TimeInterval {
    guard let breathOutSettings = UserDefaults.standard.value(forKey: UserDefaultsManager.breathOut.key) as? TimeInterval else { return 8.0 }
    return breathOutSettings
}

func getHoldSettings() -> TimeInterval {
    guard let holdSettings = UserDefaults.standard.value(forKey: UserDefaultsManager.hold.key) as? TimeInterval else { return 0.0 }
    return holdSettings
}
