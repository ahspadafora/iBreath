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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tap within the circle to begin the breathing excercise"
        self.view.backgroundColor = Colors.lightGray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startPressed))
        tapGesture.delegate = self
        self.circleView.addGestureRecognizer(tapGesture)
    }
    
    @objc func startPressed(){
        UIView.animate(withDuration: 4.0, delay: 0, options: .allowAnimatedContent, animations: {
            self.title = "Breath In"
            self.circleView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (completed) in
            guard completed else { return }
            if completed == true {
                self.title = "Hold"
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.0, execute: {
                    UIView.animate(withDuration: 8.0, delay: 0.0, options: .allowAnimatedContent, animations: {
                        self.title = "Breath Out"
                        self.circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }){(completed) in
                        self.title = ""
                    }
                })
            }
        }
    }

    
    
}

