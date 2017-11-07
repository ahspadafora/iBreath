//
//  SettingsTableViewController.swift
//  iBreath
//
//  Created by Amber Spadafora on 11/2/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingsSelected(newSettings: [String: TimeInterval])
}

class SettingsTableViewController: UITableViewController {

    var settingsDelegate: SettingsDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.lightGray
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaultsManager.settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: changeSetting, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ChangeSettingViewController else { return }
        guard let indexPath = sender as? IndexPath else { return }
        destinationVC.settingIndex = indexPath.row
    }
    
    

   
}
