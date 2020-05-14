//
//  ViewController.swift
//  ScrollButtonUpWithKeyboard
//
//  Created by Ramill Ibragimov on 14.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbnButtomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    
    @objc func keyboardHide(notification: Notification) {
        if let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            UIView.animate(withDuration: 0.5) {
                self.tbnButtomConstraint.constant = height - height + 20
            }
        }
    }
    
    @objc func keyboardShow(notification: Notification) {
        if let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            UIView.animate(withDuration: 0.5) {
                self.tbnButtomConstraint.constant = height + 20
            }
            
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

}

