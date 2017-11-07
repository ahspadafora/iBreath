//
//  ViewController.swift
//  iBreath
//
//  Created by Amber Spadafora on 10/24/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var circleView: CircleView!
    
    var breathInDuration: TimeInterval = UserDefaultsManager.breathInVal
    var breathOutDuration: TimeInterval = UserDefaultsManager.breathOutVal
    var holdDuration: TimeInterval = UserDefaultsManager.holdVal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tap the circle to begin the excercise"
        self.view.backgroundColor = Colors.lightGray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startPressed))
        tapGesture.delegate = self
        self.circleView.addGestureRecognizer(tapGesture)
    }
    
    @objc func startPressed(){
        UIView.animate(withDuration: self.breathInDuration, delay: 0, options: .allowAnimatedContent, animations: {
            self.breathIn()
        }) { (completed) in
            guard completed == true else { return }
            self.title = "Hold"
            self.breathOut()
            
        }
    }
    
    func breathIn(){
        self.title = "Breath In Through Your Nose"
        self.circleView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    func breathOut(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.holdDuration, execute: {
            UIView.animate(withDuration: self.breathOutDuration, delay: 0.0, options: .allowAnimatedContent, animations: {
                self.title = "Breath Out Through Your Mouth"
                self.circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }){(completed) in
                self.title = "Tap the circle to begin the excercise"
            }
        })
    }
    
    
}

