//
//  ViewController.swift
//  StackOverflowTest
//
//  Created by David G Chopin on 9/9/19.
//  Copyright © 2019 David G Chopin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var volumeTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeTextField.delegate = self
        priceTextField.delegate = self
    }
}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //An empty string, i.e. "", is the passed text when the user enters a backspace
        if textField == volumeTextField {
            
            if textField.text!.count == 4 && string != "" {
                return false
            } else {
                return true
            }
        } else {
            
            let currentText = textField.text!.stringByRemovingAll(characters: ["$","."])
            print(currentText)
            
            var newText: String!
            if string == "" {
                newText = String(currentText.dropLast())
            } else if currentText.count == 0 {
                newText = string
            } else {
                newText = "\(currentText)\(string)"
            }
            
            
            while newText.count != 0 && newText[0] == "0" {
                newText.remove(at: newText.startIndex)
            }
            
            switch newText.count {
                
            case 0:
                textField.text = "$00.00"
            case 1:
                textField.text = "$00.0\(newText!)"
                
            case 2:
                textField.text = "$00.\(newText[0])\(newText[1])"
                
            case 3:
                textField.text = "$0\(newText[0]).\(newText[1])\(newText[2])"
                
            case 4:
                textField.text = "$\(newText[0])\(newText[1]).\(newText[2])\(newText[3])"
                
            default:
                break
            }
            return false
        }
    }
}

