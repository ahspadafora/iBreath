//
//  ChangeSettingViewController.swift
//  iBreath
//
//  Created by Amber Spadafora on 11/2/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class ChangeSettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let seconds: [TimeInterval] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
    var settingsDelegate: SettingsDelegate?
    var settingsTitle: String = ""
    var currentSetting: TimeInterval = 0 {
        didSet {
            guard let index = settingIndex else { return }
            UserDefaultsManager.settings[index].value = currentSetting
        }
    }
    
    var settingIndex: Int?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seconds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(seconds[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.settingValueLabel.text = "\(seconds[row])"
        self.currentSetting = seconds[row]
        self.saveSettingButton.isEnabled = true
    }
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingValueLabel: UILabel!
    @IBOutlet weak var settingPickerView: UIPickerView!
    @IBOutlet weak var saveSettingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.lightGray
        self.saveSettingButton.isEnabled = false
        guard let index = settingIndex else { return }
        self.settingLabel.text = UserDefaultsManager.settings[index].description
        self.settingValueLabel.text = "\(UserDefaultsManager.settings[index].value) seconds"
    }

    @IBAction func saveSetting(_ sender: UIButton) {
        let indexOfNewSetting = self.settingPickerView.selectedRow(inComponent: 0)
        self.currentSetting = seconds[indexOfNewSetting]
    }
    
    

}
