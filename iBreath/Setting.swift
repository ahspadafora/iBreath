//
//  Setting.swift
//  iBreath
//
//  Created by Amber Spadafora on 11/2/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import Foundation

struct Setting {
    var key: String
    var value: TimeInterval {
        didSet {
            updateUserDefaults()
        }
    }
    var description: String
    
    
    private func updateUserDefaults(){
        UserDefaults.standard.set(value, forKey: key)
    }
}
